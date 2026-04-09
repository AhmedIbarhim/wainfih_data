class PagedResponse<T> {
  final List<T> content;
  final int page;
  final int size;
  final int totalElements;
  final int totalPages;
  final bool hasNextPage;
  final bool hasPreviousPage;

  PagedResponse({
    required this.content,
    required this.page,
    required this.size,
    required this.totalElements,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  factory PagedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return PagedResponse(
      content: (json['content'] as List)
          .map((e) => fromJsonT(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int,
      size: json['size'] as int,
      totalElements: json['totalElements'] as int,
      totalPages: json['totalPages'] as int,
      hasNextPage: json['hasNextPage'] as bool,
      hasPreviousPage: json['hasPreviousPage'] as bool,
    );
  }
}
