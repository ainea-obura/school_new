abstract class AssignState {}

class AssignInitial extends AssignState {}

class AssignLoading extends AssignState {}

class AssignSuccess extends AssignState {
  final Map<String, dynamic> assignment;

  AssignSuccess(this.assignment);
}

class AssignError extends AssignState {
  final String message;

  AssignError(this.message);
}
