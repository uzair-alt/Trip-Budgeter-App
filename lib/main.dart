
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:tripbudgeter/Admin/AddTrip.dart';
import 'package:tripbudgeter/Pages/login.dart';
// import 'package:tripbudgeter/Pages/registerpage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844), // You can change this to your original design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          color: const Color.fromARGB(255, 40, 30, 93),
          debugShowCheckedModeBanner: false,
          home: const LoginPage()
        );
      },
    );
  }
}
