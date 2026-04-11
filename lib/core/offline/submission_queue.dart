import 'dart:convert';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

import 'queue_status.dart';

class QueueItem {
  final String id;
  final String type;
  final int? serviceProviderId;
  final Map<String, dynamic> payload;
  final String? imageFilePath;
  final Map<String, dynamic>? imageJson;
  final QueueItemStatus status;
  final String? errorMessage;
  final int retryCount;
  final DateTime createdAt;

  QueueItem({
    required this.id,
    required this.type,
    this.serviceProviderId,
    required this.payload,
    this.imageFilePath,
    this.imageJson,
    required this.status,
    this.errorMessage,
    required this.retryCount,
    required this.createdAt,
  });

  String get providerName =>
      (payload['serviceProviderNameAr'] as String?) ??
      (payload['serviceProviderNameEn'] as String?) ??
      'Unknown';

  factory QueueItem.fromMap(Map<String, dynamic> map) {
    return QueueItem(
      id: map['id'] as String,
      type: map['type'] as String,
      serviceProviderId: map['serviceProviderId'] as int?,
      payload: jsonDecode(map['payload'] as String) as Map<String, dynamic>,
      imageFilePath: map['imageFilePath'] as String?,
      imageJson: map['imageJson'] != null
          ? jsonDecode(map['imageJson'] as String) as Map<String, dynamic>
          : null,
      status: QueueItemStatus.fromString(map['status'] as String),
      errorMessage: map['errorMessage'] as String?,
      retryCount: map['retryCount'] as int,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'serviceProviderId': serviceProviderId,
      'payload': jsonEncode(payload),
      'imageFilePath': imageFilePath,
      'imageJson': imageJson != null ? jsonEncode(imageJson) : null,
      'status': status.name,
      'errorMessage': errorMessage,
      'retryCount': retryCount,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

class SubmissionQueue {
  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'submission_queue.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE queue (
            id TEXT PRIMARY KEY,
            type TEXT NOT NULL,
            serviceProviderId INTEGER,
            payload TEXT NOT NULL,
            imageFilePath TEXT,
            imageJson TEXT,
            status TEXT NOT NULL DEFAULT 'pending',
            errorMessage TEXT,
            retryCount INTEGER NOT NULL DEFAULT 0,
            createdAt TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<void> enqueue({
    required String type,
    int? serviceProviderId,
    required Map<String, dynamic> payload,
    String? imageFilePath,
    Map<String, dynamic>? imageJson,
  }) async {
    final db = await database;
    final item = QueueItem(
      id: const Uuid().v4(),
      type: type,
      serviceProviderId: serviceProviderId,
      payload: payload,
      imageFilePath: imageFilePath,
      imageJson: imageJson,
      status: QueueItemStatus.pending,
      retryCount: 0,
      createdAt: DateTime.now(),
    );
    await db.insert('queue', item.toMap());
  }

  Future<List<QueueItem>> getPendingItems() async {
    final db = await database;
    final maps = await db.query(
      'queue',
      where: 'status IN (?, ?)',
      whereArgs: ['pending', 'failed'],
      orderBy: 'createdAt ASC',
    );
    return maps.map(QueueItem.fromMap).toList();
  }

  Future<List<QueueItem>> getAllItems() async {
    final db = await database;
    final maps = await db.query('queue', orderBy: 'createdAt DESC');
    return maps.map(QueueItem.fromMap).toList();
  }

  Future<int> get pendingCount async {
    final db = await database;
    final result = await db.rawQuery(
      "SELECT COUNT(*) as count FROM queue WHERE status IN ('pending', 'failed')",
    );
    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<void> updateStatus(
    String id,
    QueueItemStatus status, {
    String? errorMessage,
    Map<String, dynamic>? imageJson,
    int? retryCount,
  }) async {
    final db = await database;
    final values = <String, dynamic>{'status': status.name};
    if (errorMessage != null) values['errorMessage'] = errorMessage;
    if (imageJson != null) values['imageJson'] = jsonEncode(imageJson);
    if (retryCount != null) values['retryCount'] = retryCount;
    await db.update('queue', values, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> remove(String id) async {
    final db = await database;
    await db.delete('queue', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> resetStuckItems() async {
    final db = await database;
    await db.update(
      'queue',
      {'status': 'pending'},
      where: 'status IN (?, ?)',
      whereArgs: ['uploadingImage', 'uploadingSubmission'],
    );
  }

  Future<void> removeCompleted() async {
    final db = await database;
    await db.delete('queue', where: 'status = ?', whereArgs: ['completed']);
  }
}
