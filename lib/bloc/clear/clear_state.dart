abstract class ClearState {}

class ClearInitialState extends ClearState {}

class ClearLoadingState extends ClearState {}

class ClearSuccessState extends ClearState {
  final String message;

  ClearSuccessState(this.message);
}

class ClearErrorState extends ClearState {
  final String errorMessage;

  ClearErrorState(this.errorMessage);
}
