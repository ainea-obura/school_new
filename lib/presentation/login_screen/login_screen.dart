import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/user_model.dart';
import '../../repositories/login_repository.dart';
// import '../../theme/app_decoration.dart';
// import '../../theme/theme_helper.dart';
import 'bloc/login_bloc.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(LoginRepository()),
      child: const LoginScreen(),
    );
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<LoginBloc, LoginState>(
          // builder: (BuildContext context, LoginState state) {
          builder: (context, state) {
            if (state is LoginLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoginFailure) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: Colors.red,
                  ),
                );
              });
            } else if (state is LoginSuccess) {
              // Navigate to home page
              //final User user = state.user;
              _saveUserDetails(state.user);
              WidgetsBinding.instance.addPostFrameCallback((_) {
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => const DashboardScreen()),
                // );
                NavigatorService.popAndPushNamed(
                  AppRoutes.dashboardScreen,
                );
              });
            }

            return SingleChildScrollView(
              child: SizedBox(
                height: 768.v,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    // Your UI components here
                    Align(
                        alignment: Alignment.center,
                        child: Container(
                            decoration: AppDecoration.gradientIndigoToPrimary,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Spacer(),
                                  Container(
                                      height: 483.v,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                          color: appTheme.whiteA700,
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(40.h))))
                                ]))),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 30.h, top: 23.v, right: 16.h),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      imagePath:
                                          ImageConstant.imgVectorAmber300,
                                      height: 131.v,
                                      width: 294.h,
                                      alignment: Alignment.centerRight),
                                  SizedBox(height: 25.v),
                                  _buildHeadingContent(context),
                                  SizedBox(height: 75.v),
                                  Text("Email".tr,
                                      style: theme.textTheme.bodySmall),
                                  SizedBox(height: 5.v),
                                  TextField(
                                    controller: emailController,
                                    // keyboardType: TextInputType.phone,
                                    decoration: const InputDecoration(
                                      labelText: 'Email',
                                      prefixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.mail),
                                          SizedBox(
                                              width:
                                                  8), // Add some spacing between the icon and flag
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Text("msg_syalfreelance_gmail_com".tr,
                                  //     style: theme.textTheme.bodyLarge),
                                  SizedBox(height: 15.v),
                                  // Divider(endIndent: 13.h),
                                  SizedBox(height: 32.v),
                                  // _buildPassword(context),
                                  Text("lbl_password".tr,
                                      style: theme.textTheme.bodySmall),
                                  SizedBox(height: 9.v),
                                  TextField(
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      prefixIcon: const Icon(Icons.lock_open),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscurePassword
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscurePassword =
                                                !_obscurePassword;
                                          });
                                        },
                                      ),
                                    ),
                                    obscureText: _obscurePassword,
                                    //keyboardType: TextInputType.number,
                                  ),
                                  SizedBox(height: 40.v),
                                  CustomElevatedButton(
                                      onPressed: () {
                                        //                         final email = emailController.text;
                                        // final password = passwordController.text;
                                        // BlocProvider.of<LoginBloc>(context).add(
                                        //   LoginButtonPressed(email: email, password: password),
                                        BlocProvider.of<LoginBloc>(context).add(
                                          LoginButtonPressed(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          ),
                                        );
                                        // );
                                      },
                                      text: "lbl_sign_in".tr,
                                      margin: EdgeInsets.only(right: 13.h),
                                      rightIcon: Container(
                                          margin: EdgeInsets.only(left: 30.h),
                                          child: CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgArrowleft,
                                              height: 17.v,
                                              width: 25.h)),
                                      buttonStyle: CustomButtonStyles.none,
                                      decoration: CustomButtonStyles
                                          .gradientIndigoToPrimaryDecoration),
                                  SizedBox(height: 19.v),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                          padding: EdgeInsets.only(right: 13.h),
                                          child: Text("msg_forgot_password".tr,
                                              style: CustomTextStyles
                                                  .bodyLargeBluegray900)))
                                ])))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Other methods and widgets
  Widget _buildHeadingContent(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_hi_teacher".tr, style: theme.textTheme.displaySmall),
      SizedBox(height: 8.v),
      Opacity(
          opacity: 0.61,
          child: Text("msg_sign_in_to_continue".tr,
              style: theme.textTheme.titleLarge))
    ]);
  }

  Future<void> _saveUserDetails(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access', user.access);
    await prefs.setString('refresh', user.refresh);
    // await prefs.setString('name', user.user.name);
    // await prefs.setString('email', user.user.email);
  }
}
