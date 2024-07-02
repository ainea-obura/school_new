import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../bloc/student_assigned/student_assigned_cubit.dart';
import '../bloc/student_assigned/student_assigned_state.dart';
import '../models/student_assigned_model.dart';
import '../models/students_model.dart';
import 'clear_confirm.dart';


class ClearPage extends StatefulWidget {
   final Student student;
  const ClearPage({super.key, required  this.student});

  @override
  State<ClearPage> createState() => _ClearPageState();
}

class _ClearPageState extends State<ClearPage> {

  StudentAssignedModel? _selectedStudentAssigned; // Store the selected studentAssigned
  @override
  Widget build(BuildContext context) {
    final studentAssignedCubit = BlocProvider.of<StudentAssignedCubit>(context);
    studentAssignedCubit.getStudentAssigned(widget.student.id);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () => Navigator.of(context).pop(),
  ), 
        title: const Text('Clear'),
      ),
      body: BlocBuilder<StudentAssignedCubit, StudentAssignedState>(
        builder: (context, state) {
          if (state is StudentAssignedLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is StudentAssignedLoaded) {
            final studentAssigned = state.studentAssigned;
            // Display studentAssigneds using ListView, GridView, or other widgets
            
            return ListView.builder(
              itemCount: studentAssigned.length,
              itemBuilder: (context, index) {
                return Card(
                            elevation: 4.0,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //const Icon(Icons.person),
                                  const SizedBox(width: 8.0),
                                  Column(
                                    children: [
                                      Text(
                                        studentAssigned[index].book.toString(),
                                        style: const TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text('Book No: ${studentAssigned[index].bookNo.toString()}'),
                                      // Text(
                                      //     'Class: ${student.form} ${student.stream}'),
                                    ],
                                  ),
                                  //Text('Radio')
                                  Radio(
              value: studentAssigned[index],
              groupValue: _selectedStudentAssigned,
              onChanged: (value) {
                setState(() {
                  _selectedStudentAssigned = value as StudentAssignedModel;
                });

                // Navigate to clear confirm page with book name, no, and id
                if (_selectedStudentAssigned != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => clearConfirm(
                        bookName: _selectedStudentAssigned!.book.toString(),
                        bookNo: _selectedStudentAssigned!.bookNo.toString(),
                        studenId: _selectedStudentAssigned!.student,
                        bookId: _selectedStudentAssigned!.id,
                        assignId: _selectedStudentAssigned!.id,
                      ),
                    ),
                  );
                }
              }
                                  )
                                  // Radio(
                                  //   value:
                                  //       student, // Assign the current student as value
                                  //   groupValue:
                                  //       selectedStudent, // Use selectedStudent as the groupValue
                                  //   onChanged: (value) {
                                  //     setState(() {
                                  //       selectedStudent = value
                                  //           as Student; // Update selected student
                                  //     });
                                  //   },
                                  // ),
                                ],
                              ),
                            ),
                          );
                // return ListTile(
                //   title: Text(studentAssigned[index].bookName),
                //   // Add more fields as needed
                // );
              },
            );

            // return ListView.builder(
            //   itemCount: studentAssigned.length,
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       title: Text(studentAssigned[index].bookName),
            //       // Add more fields as needed
            //     );
            //   },
            // );
          } else if (state is StudentAssignedError) {
            return Center(child: Text(state.message));
          } else {
            return Container(); // Handle other states if needed
          }
        },
      ),
    );
  }
}
