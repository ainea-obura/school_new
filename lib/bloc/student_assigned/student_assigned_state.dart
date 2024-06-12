import '../../models/student_assigned_model.dart';

abstract class StudentAssignedState {}

class StudentAssignedLoading extends StudentAssignedState {}

class StudentAssignedLoaded extends StudentAssignedState {
  final List<StudentAssignedModel> studentAssigned;

  StudentAssignedLoaded(this.studentAssigned);
}

class StudentAssignedError extends StudentAssignedState {
  final String message;

  StudentAssignedError(this.message);
}
