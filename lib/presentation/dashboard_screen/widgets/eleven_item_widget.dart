import '../../student_search_clear_screen/student_search_clear_screen.dart';
import '../models/eleven_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:school_new/core/app_export.dart';

// ignore: must_be_immutable
class ElevenItemWidget extends StatelessWidget {
  ElevenItemWidget({
    Key? key,
  }) : super(
          key: key,
        );

  // ElevenItemModel elevenItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Container(
                  width: 100, // Adjust the width as needed
                  height: 100,
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        // Action for Assign books
                        // Navigator.of(context).pushReplacement(
                        //   MaterialPageRoute(
                        //       builder: (context) => const AssignBooks()),
                        // );
                        NavigatorService.pushNamed(
                          AppRoutes.specifyClassScreen,
                        );
                      },
                      child: const Center(child: Text('Assign books')),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 11.0, right: 11.0),
                child: Container(
                  width: 100, // Adjust the width as needed
                  height: 100,
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        // NavigatorService.pushNamed(
                        //   AppRoutes.studentSearchResultsScreen,
                        // );
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const StudentSearchClearScreen()),
                        );
                      },
                      child: const Center(child: Text('Clear books')),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 11.0, right: 11.0),
                child: Container(
                  width: 100, // Adjust the width as needed
                  height: 100,
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context).pushReplacement(
                        //   MaterialPageRoute(
                        //       builder: (context) =>
                        //           const ChangePasswordPage()),
                        // );
                      },
                      child: const Center(child: Text('Change password')),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 11.0, right: 11.0),
                child: Container(
                  width: 100, // Adjust the width as needed
                  height: 100,
                  child: Card(
                            child: InkWell(
                              onTap: () {
                                // logout(); // Call the logout function on tap
                              },
                              child: const Center(child: Text('Logout')),
                            ),
                          ),
                  //   child: _loggingOut
                  //       ? const Center(
                  //           child:
                  //               CircularProgressIndicator(), // Show progress indicator when logging out
                  //         )
                  //       : Card(
                  //           child: InkWell(
                  //             onTap: () {
                  //               logout(); // Call the logout function on tap
                  //             },
                  //             child: const Center(child: Text('Logout')),
                  //           ),
                  //         ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
    // return Container(
    //   padding: EdgeInsets.symmetric(
    //     horizontal: 19.h,
    //     vertical: 6.v,
    //   ),
    //   decoration: BoxDecoration(
    //     image: DecorationImage(
    //       image: fs.Svg(
    //         ImageConstant.imgGroup11,
    //       ),
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     mainAxisAlignment: MainAxisAlignment.end,
    //     children: [
    //       SizedBox(height: 12.v),
    //       // CustomImageView(
    //       //   imagePath: elevenItemModelObj?.assignBooksImage,
    //       //   height: 29.v,
    //       //   width: 39.h,
    //       // ),
    //       // SizedBox(height: 19.v),
    //       // Text(
    //       //   elevenItemModelObj.playQuizText!,
    //       //   style: CustomTextStyles.bodyLargeBlack90018,
    //       // ),
    //     ],
    //   ),
    // );
  }
}
