part of 'stream_bloc.dart';

sealed class StreamState extends Equatable {
  const StreamState();
  
  @override
  List<Object> get props => [];
}

final class StreamInitial extends StreamState {}

// abstract class StreamState {
//   const StreamState();
// }

class StreamLoading extends StreamState {}

class StreamLoaded extends StreamState {
  final List<StreamModel> streams;

  const StreamLoaded(this.streams);

  @override
  List<Object> get props => [streams];
}

class StreamError extends StreamState {
  final String error;

  const StreamError(this.error);

  @override
  List<Object> get props => [error];
}