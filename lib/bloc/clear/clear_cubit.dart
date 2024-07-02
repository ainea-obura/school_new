import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/clear_repository.dart';
import 'clear_state.dart';

class ClearCubit extends Cubit<ClearState> {
  final ClearRepository clearRepository;

  ClearCubit(this.clearRepository) : super(ClearInitialState());

  Future<void> clearAssignment(int assignId, int bookId) async {
    emit(ClearLoadingState());

    try {
      final message = await clearRepository.clearAssignment(assignId, bookId);
      emit(ClearSuccessState(message));
    } catch (e) {
      emit(ClearErrorState(e.toString()));
    }
  }
}
