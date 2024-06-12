import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/clear/clear_cubit.dart';
import '../bloc/clear/clear_state.dart';
import 'assign_book_screen/assign_success_page.dart';

class clearConfirm extends StatefulWidget {
  final String bookName;
  final String bookNo;
  final int assignId;

  const clearConfirm({
    Key? key,
    required this.bookName,
    required this.bookNo,
    required this.assignId,
  }) : super(key: key);

  @override
  State<clearConfirm> createState() => _clearConfirmState();
}

class _clearConfirmState extends State<clearConfirm> {
  late ClearCubit clearCubit;

  @override
  void initState() {
    //clearCubit =
    //final clearCubit = context.read<ClearCubit>();
    clearCubit = BlocProvider.of<ClearCubit>(context);
    super.initState();
  }

  // @override
  // void dispose() {
  //   clearCubit.close(); // Close your cubit properly
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Confirm'),
        ),
        body: BlocConsumer<ClearCubit, ClearState>(
          listener: (context, state) {
            if (state is ClearSuccessState) {
              Future.delayed(Duration.zero, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const SuccessPage(message: 'cleared successfully!'),
                  ),
                );
              });
            } else if (state is ClearErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
          },
          builder: (context, state) {
            if (state is ClearLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      elevation: 4.0,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Book Name: ${widget.bookName}',
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Book No: ${widget.bookNo}',
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            const SizedBox(height: 16.0),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        // final clearCubit = context.read<ClearCubit>();
                        clearCubit.clearAssignment(widget.assignId);
                      },
                      child: const Text('Confirm'),
                    ),
                  ],
                ),
              );
            }
          },
        ));
  }
}

