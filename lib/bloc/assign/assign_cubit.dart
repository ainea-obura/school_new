
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/assign_repository.dart';
import 'assign_state.dart';

class AssignCubit extends Cubit<AssignState> {
  final AssignmentRepository _assignmentRepository;

  AssignCubit(this._assignmentRepository) : super(AssignInitial());

  Future<void> assignBook({
   
    required String bookNo,
    required int studentId,
    required int subjectId,
  }) async {
    try {
      emit(AssignLoading());
      final assignment = await _assignmentRepository.assignBook(
    
        bookNo: bookNo,
        studentId: studentId,
        subjectId: subjectId,
      );
      emit(AssignSuccess(assignment));
      //emit(AssignInitial());
    } catch (e) {
      emit(AssignError('Failed to assign book: $e'));
    }
  }
   void resetState() {
    emit(AssignInitial());
  }
}
