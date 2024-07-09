import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:school_new/presentation/assign_book_screen/bloc/assign_book_bloc.dart';
import 'bloc/assign/assign_cubit.dart';
import 'bloc/book/books_bloc.dart';
import 'bloc/books/books_cubit.dart';
import 'bloc/clear/clear_cubit.dart';
import 'bloc/form/form_bloc.dart';
import 'bloc/stream_bloc.dart';
import 'bloc/student_assigned/student_assigned_cubit.dart';
import 'bloc/subject_bloc.dart';
import 'core/app_export.dart';
import 'repositories/assign_repository.dart';
import 'repositories/clear_repository.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PrefUtils().init()
  ]).then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        // return BlocProvider(
        //   create: (context) => ThemeBloc(
        //     ThemeState(
        //       themeType: PrefUtils().getThemeData(),
        //     ),
        //   ),
        return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(
            ThemeState(
              themeType: PrefUtils().getThemeData(),
            ),
          ),
        ),
        BlocProvider<StreamBloc>(
          create: (context) => StreamBloc(), // Provide your other blocs here
        ),
        BlocProvider<SubjectBloc>(
          create: (context) => SubjectBloc(), // Provide your other blocs here
        ),

        BlocProvider<FormBloc>(
          create: (context) => FormBloc(), // Provide your other blocs here
        ),

        BlocProvider<BooksBloc>(
          create: (context) => BooksBloc(), // Provide your other blocs here
        ),

        BlocProvider<AssignBookBloc>(
          create: (context) => AssignBookBloc(AssignBookState()), // Provide your other blocs here
        ),
        
        // BlocProvider(
        //   create: (context) => BookCubit(),
        // ),

        BlocProvider(
          create: (context) => AssignCubit( AssignmentRepository()),
        ),

        BlocProvider(
          create: (context) => StudentAssignedCubit(),
        ),

        BlocProvider(
          create: (context) => ClearCubit(ClearRepository()),
        ),
        
      ],
          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                theme: theme,
                title: 'school_new',
                navigatorKey: NavigatorService.navigatorKey,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: [
                  AppLocalizationDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: [
                  Locale(
                    'en',
                    '',
                  ),
                ],
                initialRoute: AppRoutes.initialRoute,
                routes: AppRoutes.routes,
              );
            },
          ),
        );
      },
    );
  }
}
