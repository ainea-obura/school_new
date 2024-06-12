import 'package:flutter/material.dart';

import '../../core/utils/navigator_service.dart';
import '../../routes/app_routes.dart';



class SuccessPage extends StatelessWidget {
  final String message;

  const SuccessPage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Success'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Success!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
              onPressed: (){
          //      Navigator.of(context).pushNamedAndRemoveUntil(
          //   '/home',
          //   (route) => false,
          WidgetsBinding.instance.addPostFrameCallback((_) {
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => const DashboardScreen()),
                // );
                NavigatorService.popAndPushNamed(
                  AppRoutes.dashboardScreen,
                );
              });
          // );
            }, child: const Text('Done', style: TextStyle(color: Colors.white),))
          
          ],
        ),
      ),
    );
  }
}
