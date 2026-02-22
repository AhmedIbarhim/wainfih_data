abstract class Failure {
  final String message;
  const Failure(this.message);
}

class LocationFailure extends Failure {
  const LocationFailure(super.message);
}

class ServerFailure extends Failure {
  final FailureInfo info;
  ServerFailure(this.info) : super(info.exception ?? "Server Error");
}

class FailureInfo {
  final String? exception;
  FailureInfo({this.exception});
}
