import '../models/thirtyfour_item_model.dart';
import 'package:flutter/material.dart';
import 'package:school_new/core/app_export.dart';

// ignore: must_be_immutable
class ThirtyfourItemWidget extends StatelessWidget {
  ThirtyfourItemWidget(
    this.thirtyfourItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ThirtyfourItemModel thirtyfourItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          thirtyfourItemModelObj.name!,
          style: CustomTextStyles.bodyLargeBlack900,
        ),
        SizedBox(height: 4.v),
        Text(
          thirtyfourItemModelObj.admNo!,
          style: theme.textTheme.bodyLarge,
        ),
        SizedBox(height: 2.v),
        Text(
          thirtyfourItemModelObj.classVar!,
          style: theme.textTheme.bodyLarge,
        ),
      ],
    );
  }
}
