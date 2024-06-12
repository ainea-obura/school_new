part of 'stream_bloc.dart';

sealed class StreamEvent extends Equatable {
  const StreamEvent();

  @override
  List<Object> get props => [];
}

// abstract class StreamEvent {
//   const StreamEvent();
// }

class LoadStreams extends StreamEvent {}
