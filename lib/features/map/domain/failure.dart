abstract class Failure {
  final String message;
  const Failure(this.message);
}

class LocationFailure extends Failure {
  const LocationFailure(super.message);
}
