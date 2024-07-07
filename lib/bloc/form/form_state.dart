part of 'form_bloc.dart';

sealed class FormsState extends Equatable {
  const FormsState();
  
  @override
  List<Object> get props => [];
}

final class FormInitial extends FormsState {}

class FormLoading extends FormsState {}

class FormLoaded extends FormsState {
  final List<FormModel> forms;

  const FormLoaded(this.forms);

  @override
  List<Object> get props => [forms];
}

class FormError extends FormsState {
  final String error;

  const FormError(this.error);

  @override
  List<Object> get props => [error];
}