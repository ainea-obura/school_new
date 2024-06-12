import 'package:flutter/material.dart';
import 'package:school_new/presentation/splash_screen/splash_screen.dart';
import 'package:school_new/presentation/login_screen/login_screen.dart';
import 'package:school_new/presentation/login_vtwo_screen/login_vtwo_screen.dart';
import 'package:school_new/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:school_new/presentation/specify_class_screen/specify_class_screen.dart';
import 'package:school_new/presentation/student_search_screen/student_search_screen.dart';
import 'package:school_new/presentation/student_search_clear_screen/student_search_clear_screen.dart';
import 'package:school_new/presentation/assign_book_screen/assign_book_screen.dart';
import 'package:school_new/presentation/student_search_qr_code_one_screen/student_search_qr_code_one_screen.dart';
import 'package:school_new/presentation/student_search_qr_code_screen/student_search_qr_code_screen.dart';
import 'package:school_new/presentation/assign_book_one_screen/assign_book_one_screen.dart';
import 'package:school_new/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String loginScreen = '/login_screen';

  static const String loginVtwoScreen = '/login_vtwo_screen';

  static const String dashboardScreen = '/dashboard_screen';

  static const String specifyClassScreen = '/specify_class_screen';

  static const String studentSearchScreen = '/student_search_screen';

  static const String studentSearchResultsScreen =
      '/student_search_results_screen';

  static const String assignBookScreen = '/assign_book_screen';

  static const String studentSearchQrCodeOneScreen =
      '/student_search_qr_code_one_screen';

  static const String studentSearchQrCodeScreen =
      '/student_search_qr_code_screen';

  static const String assignBookOneScreen = '/assign_book_one_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        splashScreen: SplashScreen.builder,
        loginScreen: LoginScreen.builder,
        //loginScreen: LoginScreen,
        loginVtwoScreen: LoginVtwoScreen.builder,
        dashboardScreen: DashboardScreen.builder,
        specifyClassScreen: SpecifyClassScreen.builder,
        //studentSearchScreen: StudentSearchScreen.builder,
        // studentSearchScreen: (context) => StudentSearchScreen.builder(context),
        // studentSearchResultsScreen: StudentSearchClearScreen.builder,
        // assignBookScreen: AssignBookScreen.builder,
        studentSearchQrCodeOneScreen: StudentSearchQrCodeOneScreen.builder,
        studentSearchQrCodeScreen: StudentSearchQrCodeScreen.builder,
        assignBookOneScreen: AssignBookOneScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: LoginScreen.builder


          // splashScreen: (context) => SplashScreen.builder(context),
          // loginScreen: (context) => LoginScreen.builder(context),
          // loginVtwoScreen: (context) => LoginVtwoScreen.builder(context),
          // dashboardScreen: (context) => DashboardScreen.builder(context),
          // specifyClassScreen: (context) => SpecifyClassScreen.builder(context),
          // studentSearchScreen: (context) => StudentSearchScreen.builder(context),
          // studentSearchResultsScreen: (context) => StudentSearchResultsScreen.builder(context),
          // assignBookScreen: (context) => AssignBookScreen.builder(context),
          // studentSearchQrCodeOneScreen: (context) => StudentSearchQrCodeOneScreen.builder(context),
          // studentSearchQrCodeScreen: (context) => StudentSearchQrCodeScreen.builder(context),
          // assignBookOneScreen: (context) => AssignBookOneScreen.builder(context),
          // appNavigationScreen: (context) => AppNavigationScreen.builder(context),
          // initialRoute: (context) => LoginScreen.builder(context),
      };
}
