import 'registerpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey.shade300, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 100.h),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  " Welcome Back! ",
                  style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "  Enter your email to start shopping and get\n  awesome deals today!",
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(height: 30.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                width: 380.w,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    labelText: 'Email',
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    labelStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                width: 380.w,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye_outlined),
                    labelText: 'Password',
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    labelStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "  Forgot Your Password?",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(225, 40, 30, 93),
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              Container(
                margin: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
                padding: EdgeInsets.only(top: 5.h),
                alignment: Alignment.center,
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 40, 30, 93),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
              ),
              SizedBox(height: 35.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(height: 1.h, width: 180.w, color: Colors.grey),
                  Text("OR", style: TextStyle(fontSize: 16.sp)),
                  Container(height: 1.h, width: 175.w, color: Colors.grey),
                ],
              ),
              SizedBox(height: 30.h),
              Container(
                margin: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
                padding: EdgeInsets.only(top: 5.h),
                alignment: Alignment.center,
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Color.fromARGB(255, 40, 30, 93)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.google, size: 20.sp),
                    SizedBox(width: 10.w),
                    Text(
                      "Log in with Google",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 16, 40, 1),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                margin: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
                padding: EdgeInsets.only(top: 5.h),
                alignment: Alignment.center,
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Color.fromARGB(255, 40, 30, 93)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.facebook, color: Colors.blue.shade700, size: 22.sp),
                    SizedBox(width: 10.w),
                    Text(
                      "Log in with Facebook",
                      style: TextStyle(
                        color: Color(0xFF156651),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15.sp),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Registerpage()),
                      );
                    },
                    child: Text(
                      "Register Now",
                      style: TextStyle(
                        color: Color.fromARGB(255, 40, 30, 93),
                        fontWeight: FontWeight.w300,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
