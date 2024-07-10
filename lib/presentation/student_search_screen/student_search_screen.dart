import 'dart:async';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../../bloc/student_bloc.dart';
import '../../models/form_model.dart';
import '../../models/stream_model.dart';
import '../../models/students_model.dart';
import '../../models/subject_model.dart';
import '../../repositories/student_search_repository.dart';
import '../assign_book_screen/assign_book_screen.dart';
import 'bloc/student_search_bloc.dart';
import 'models/student_search_model.dart';
import 'package:flutter/material.dart';
import 'package:school_new/core/app_export.dart';
import 'package:school_new/widgets/app_bar/appbar_leading_image.dart';
import 'package:school_new/widgets/app_bar/appbar_title.dart';
import 'package:school_new/widgets/app_bar/custom_app_bar.dart';
import 'package:school_new/widgets/custom_icon_button.dart';

class StudentSearchScreen extends StatefulWidget {
  // final StreamModel selectedStream;
  final SubjectModel selectedSubject;
  final FormModel selectedForm;
  
  //const StudentSearchScreen({Key? key}) : super(key: key);
   const StudentSearchScreen({
    super.key,
    // required this.selectedStream,
    required this.selectedSubject,
    required this.selectedForm,
  });

// static Widget builder(BuildContext context, {
//     required StreamModel selectedStream,
//     required SubjectModel selectedSubject,
//     required String selectedForm,
//   }) {
//     return BlocProvider<StudentSearchBloc>(
//       create: (context) => StudentSearchBloc(
//         StudentSearchState(studentSearchModelObj: StudentSearchModel())
//       )..add(StudentSearchInitialEvent()),
//       child: StudentSearchScreen(
//         selectedStream: selectedStream,
//         selectedSubject: selectedSubject,
//         selectedForm: selectedForm,
//       ),
//     );
//   }
  // static Widget builder(BuildContext context) {
  //   return BlocProvider<StudentSearchBloc>(
  //       create: (context) => StudentSearchBloc(
  //           StudentSearchState(studentSearchModelObj: StudentSearchModel()))
  //         ..add(StudentSearchInitialEvent()),
  //       child: StudentSearchScreen( 
          
  //         ));
  // }

  @override
  State<StudentSearchScreen> createState() => _StudentSearchScreenState();
}

class _StudentSearchScreenState extends State<StudentSearchScreen> {
final _studentController = TextEditingController();
  late StudentBloc _bloc;
  Timer? _searchTimer;
  final _formKey = GlobalKey<FormState>();
  Student? selectedStudent;

  Future<void> scanQRCode() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      '#FF0000',
      'Cancel',
      true,
      ScanMode.QR,
    );

    if (!mounted) return;

    setState(() {
      _studentController.text = barcodeScanRes;
    });

    print(_studentController.text);
    _searchStudent(barcodeScanRes);
  }

  Future<void> _searchStudent(String studentNumber) async {
    if (studentNumber.isEmpty) {
      return;
    }
    setState(() {});
    _searchTimer?.cancel();
    _searchTimer = Timer(const Duration(milliseconds: 500), () async {
      var query = _studentController.text;

      if (_formKey.currentState!.validate()) {
        _bloc.add(SearchStudent(query: query));
      }

      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _bloc = StudentBloc(SearchStudentsRepository()); // Initialize StudentBloc
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search or scan QR code'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: TextFormField(
                        controller: _studentController,
                        decoration: InputDecoration(
                          labelText: "Search students' record",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          prefixIcon: const Icon(Icons.search),
                        ),
                        onChanged: (value) => _searchStudent(value),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Student number is required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.qr_code_scanner),
                  onPressed: scanQRCode,
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            BlocBuilder<StudentBloc, StudentState>(
              bloc: _bloc,
              builder: (context, state) {
                if (state is StudentLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is StudentLoaded) {
                  List<Student> students = state.students;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: students.length,
                      itemBuilder: (context, index) {
                        Student student = students[index];
                        return InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => AssignPage(
                            //       student: student,
                            //       subject: widget.selectedSubject,
                            //     ),
                            //   ),
                            // );
                          },
                          child: Card(
                            elevation: 4.0,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        '${student.firstName} ${student.lastName}',
                                        style: const TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text('Adm No: ${student.admNo}'),
                                      Text(
                                          'Class: ${student.formName} ${student.streamName}'),
                                    ],
                                  ),
                                  Radio(
                                    value: student,
                                    groupValue: selectedStudent,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedStudent = value as Student;
                                      });

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AssignBookScreen(
                                            student: student,
                                            subject: widget.selectedSubject,
                                            form: widget.selectedForm,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is StudentError) {
                  return Center(
                    child: Column(
                      children: [
                        Text(state.error),
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}