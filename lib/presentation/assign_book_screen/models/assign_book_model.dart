// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [assign_book_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AssignBookModel extends Equatable {
  AssignBookModel() {}

  AssignBookModel copyWith() {
    return AssignBookModel();
  }

  @override
  List<Object?> get props => [];
}
