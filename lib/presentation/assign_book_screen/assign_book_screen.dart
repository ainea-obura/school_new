import 'package:school_new/bloc/book/books_bloc.dart';

import '../../bloc/assign/assign_cubit.dart';
import '../../bloc/assign/assign_state.dart';
import '../../bloc/books/books_cubit.dart';
import '../../bloc/books/books_state.dart';
import '../../models/students_model.dart';
import '../../models/subject_model.dart';
import '../../models/book_model.dart';
import 'assign_success_page.dart';
import 'bloc/assign_book_bloc.dart';
import 'models/assign_book_model.dart';
import 'package:flutter/material.dart';
import 'package:school_new/core/app_export.dart';
import 'package:school_new/widgets/app_bar/appbar_leading_image.dart';
import 'package:school_new/widgets/app_bar/appbar_title.dart';
import 'package:school_new/widgets/app_bar/custom_app_bar.dart';
import 'package:school_new/widgets/custom_elevated_button.dart';

class AssignBookScreen extends StatefulWidget {
  final Student student; // Received student object from the previous page
  final SubjectModel subject;
  final String form;
  const AssignBookScreen(
      {Key? key, required this.student, required this.subject, required this.form});

  // static Widget builder(BuildContext context) {
  //   return BlocProvider<AssignBookBloc>(
  //       create: (context) => AssignBookBloc(
  //           AssignBookState(assignBookModelObj: AssignBookModel()))
  //         ..add(AssignBookInitialEvent()),
  //       child: AssignBookScreen());
  // }

  @override
  State<AssignBookScreen> createState() => _AssignBookScreenState();
}

class _AssignBookScreenState extends State<AssignBookScreen> {

  late BooksBloc _booksBloc;

  BookModel? _selectedBook;
  late AssignCubit _assignCubit;
  final bookController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // final bookCubit = BlocProvider.of<BookCubit>(context);
    _booksBloc = BlocProvider.of<BooksBloc>(context);
    
    _assignCubit = BlocProvider.of<AssignCubit>(context);
    // bookCubit.getBooks(widget.form,widget.subject.id);
    
    int formId = _mapFormToInt(widget.form);
    
    // bookCubit.getBooks(formId, widget.subject.id); 


    
    _booksBloc.add(LoadBooks(form: formId, subject: widget.subject.id));
  }

  int _mapFormToInt(String form) {
    switch (form) {
      case 'Form 1':
        return 1;
      case 'Form 2':
        return 2;
      case 'Form 3':
        return 3;
      case 'Form 4':
        return 4;
      default:
        throw Exception('Unknown form: $form');
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssignBookBloc, AssignBookState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: SizedBox(
                  height: 768.v,
                  width: double.maxFinite,
                  child: Stack(alignment: Alignment.center, children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgBackground769x375,
                        height: 769.v,
                        width: 375.h,
                        alignment: Alignment.center),
                    Align(
                        alignment: Alignment.center,
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 1.v),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: 10.v),
                                  _buildAppBar(context),
                                  SizedBox(height: 142.v),
                                  Expanded(
                                      child: SingleChildScrollView(
                                          child: _buildForm(context)))
                                ])))
                  ]))));
      // bottomNavigationBar: _buildMobile(context)));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 28.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftWhiteA700,
            margin: EdgeInsets.only(left: 16.h, bottom: 3.v),
            onTap: () {
              // onTapArrowLeft(context);
            }),
        title: Padding(
            padding: EdgeInsets.only(left: 15.h),
            child: Row(children: [
              AppbarTitle(text: "lbl_assigning_to".tr),
              AppbarTitle(
                  text: "${widget.student.firstName} ${widget.student.lastName}"
                      .tr,
                  margin: EdgeInsets.only(left: 20.h))
            ])));
  }

  /// Section Widget
  Widget _buildDoubtDescription(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextFormField(
        controller: bookController,
        decoration: InputDecoration(
          labelText: 'Enter Book Number',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        // keyboardType: TextInputType.number,
        // Validate book number input
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Book number is required';
          }
          // You can add additional validation here if needed
          return null;
        },
      ),
      // Padding(
      //     padding: EdgeInsets.only(left: 4.h),
      //     child: Text("lbl_book_number".tr, style: theme.textTheme.bodySmall)),
      // SizedBox(height: 13.v),
      // Padding(
      //     padding: EdgeInsets.only(left: 4.h),
      //     child: Text("lbl".tr, style: theme.textTheme.bodyLarge)),
      SizedBox(height: 21.v),
      Divider()
    ]);
  }

  /// Section Widget
  Widget _buildForm(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 222.v),
        padding: EdgeInsets.symmetric(horizontal: 29.h),
        child: Column(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("lbl_book_title".tr, style: theme.textTheme.bodySmall),
            SizedBox(height: 9.v),
             BlocBuilder<BooksBloc, BooksState>(
                  builder: (context, state) {
                    if (state is BooksLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is BooksLoaded) {
                      final books = state.books;
                      return DropdownButtonFormField<BookModel>(
                        value: null, // Initially selected value
                        items: books
                            .map((books) => DropdownMenuItem<BookModel>(
                                  value: books,
                                  child: Text(books.bookTitle),
                                ))
                            .toList(),
                        onChanged: (books) {
                          setState(() {
                            _selectedBook = books!;
                          });
                          // Handle selected stream
                          print('Selected book: ${books!.bookTitle}');
                        },
                      );
                    } else if (state is BooksError) {
                      return Text(state.error);
                    } else {
                      return const Text('Something went wrong!');
                    }
                  },
                ),
            // Padding(
            //   padding: EdgeInsets.only(right: 14.h),
            //   child: BlocBuilder<BookCubit, BookState>(
            //     builder: (context, state) {
            //       if (state is BookLoading) {
            //         return const Center(child: CircularProgressIndicator());
            //       } else if (state is BookLoaded) {
            //         final books = state.Books;
            //         final filteredBooks = books
            //             .where((book) => widget.subject.id == book.id)
            //             .toList();
            //         final List<DropdownMenuItem<String>> dropdownItems =
            //             filteredBooks.map((book) {
            //           return DropdownMenuItem(
            //             value: book.bookTitle,
            //             child: Text(book.bookTitle),
            //           );
            //         }).toList();

            //         void onChanged(String? selectedBookName) {
            //           setState(() {
            //             _selectedBook = filteredBooks.firstWhere(
            //                 (book) => book.bookTitle == selectedBookName);
            //             if (_selectedBook != null) {
            //               print('Selected Book: ${_selectedBook!.bookTitle}');
            //             }
            //           });
            //         }

                    

            //         return Column(
            //           children: [
            //             DropdownButton<String>(
            //               items: dropdownItems,
            //               onChanged: onChanged,
            //               value: _selectedBook
            //                   ?.bookTitle, // Set the selected value
            //               hint: const Text('Select a book'),
            //             ),
            //             // if (_selectedBook != null)
            //             //   Padding(
            //             //     padding: const EdgeInsets.all(16.0),
            //             //     child: Text(
            //             //       'Selected Book: ${_selectedBook!.name}',
            //             //       style: const TextStyle(fontSize: 18.0),
            //             //     ),
            //             //   ),
            //           ],
            //         );
            //       } else if (state is BookError) {
            //         return Center(child: Text(state.message));
            //       } else {
            //         return Container();
            //       }
            //     },
            //   ),
            // ),
            SizedBox(height: 14.v),
            Divider()
          ]),
          SizedBox(height: 49.v),
          _buildDoubtDescription(context),
          SizedBox(height: 129.v),
          BlocConsumer<AssignCubit, AssignState>(listener: (context, state) {
            if (state is AssignSuccess) {
              //final assignment = state.assignment;
              // Display assignment details or handle accordingly
              // return Text('Book assigned: ${assignment['book_name']}');
              Future.delayed(Duration.zero, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SuccessPage(
                        message: 'Book assigned successfully!'),
                  ),
                ).then((_) {
                  _assignCubit.resetState();
                });

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) =>
                //         const SuccessPage(message: 'Book assigned successfully!'),
                //   ),
                // );
              });
              // Return a placeholder widget while navigation occurs
              // return const SizedBox();
            } else if (state is AssignError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
              // final snackBar = SnackBar(
              //   content: Text(state.error),
              //   backgroundColor: Colors.red,
              // );
              // ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }, builder: (context, state) {
            if (state is AssignLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            // else if (state is AssignSuccess) {
            //     final assignment = state.assignment;
            //     // Display assignment details or handle accordingly
            //     // return Text('Book assigned: ${assignment['book_name']}');
            //     Future.delayed(Duration.zero, () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => const SuccessPage(message: 'Book assigned successfully!'),
            //     ),
            //   );
            // });
            // // Return a placeholder widget while navigation occurs
            // return const SizedBox();
            //   } else if (state is AssignError) {
            //     return Center(child: Text(state.message));
            //   }
            else {
              return CustomElevatedButton(
                  onPressed: () {
                    if (_selectedBook != null) {
                      _assignCubit.assignBook(
                        // Get the selected book name
                        bookNo: bookController.text,
                        studentId: widget.student.id,
                        subjectId: _selectedBook!.id,
                      );
                    }
                  },
                  text: "lbl_assign".tr,
                  buttonStyle: CustomButtonStyles.none,
                  decoration:
                      CustomButtonStyles.gradientIndigoToPrimaryTL10Decoration);
            }
          })
        ]));
  }
}
