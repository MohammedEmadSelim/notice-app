abstract class Failure {
  final String error;

  Failure({required this.error});
}


class FirebaseFailure extends Failure{
  FirebaseFailure({required super.error});
}