import 'package:equatable/equatable.dart';

abstract class AddProviderState extends Equatable {
  const AddProviderState();
  @override
  List<Object?> get props => [];
}

class AddProviderInitial extends AddProviderState {}

class AddProviderImageUploading extends AddProviderState {}

class AddProviderImageUploaded extends AddProviderState {
  final Map<String, dynamic> imageJson;
  const AddProviderImageUploaded(this.imageJson);
  @override
  List<Object?> get props => [imageJson];
}

class AddProviderImageFailed extends AddProviderState {
  final String message;
  const AddProviderImageFailed(this.message);
  @override
  List<Object?> get props => [message];
}

class AddProviderSubmitting extends AddProviderState {}

class AddProviderSubmitSuccess extends AddProviderState {
  final int providerId;
  const AddProviderSubmitSuccess(this.providerId);
  @override
  List<Object?> get props => [providerId];
}

class AddProviderSubmitFailed extends AddProviderState {
  final String message;
  const AddProviderSubmitFailed(this.message);
  @override
  List<Object?> get props => [message];
}

class AddProviderQueuedOffline extends AddProviderState {}
