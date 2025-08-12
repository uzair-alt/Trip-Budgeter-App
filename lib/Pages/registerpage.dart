// import 'package:tripbudgeter/Admin/AddTrip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripbudgeter/Admin/AdminHome.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 80.h),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      " Create Account ",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "  Fill in your details below to start planning\n your trips and managing your travel budget.",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h),

                  // First Name
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    width: 380.w,
                    child: TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline),
                        labelText: "First Name",
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "First name is required";
                        }
                        return null;
                      },
                    ),
                  ),

                  SizedBox(height: 25.h),

                  // Last Name
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    width: 380.w,
                    child: TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline),
                        labelText: "Last Name",
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Last name is required";
                        }
                        return null;
                      },
                    ),
                  ),

                  SizedBox(height: 25.h),

                  // Email
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    width: 380.w,
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail_outline),
                        labelText: "Email",
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is required";
                        } else if (!value.contains('@') || !value.contains('.')) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
                    ),
                  ),

                  SizedBox(height: 25.h),

                  // Password
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    width: 380.w,
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                        labelText: "Password",
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is required";
                        } else if (value.length < 8) {
                          return "Password should be at least 8 characters";
                        }
                        return null;
                      },
                    ),
                  ),

                  SizedBox(height: 25.h),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Text(
                        " By clicking Create Account, you acknowledge you have read and agreed to our Terms of Use and Privacy Policy",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h),

                  // Create Account Button
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminHomeScreen(),
                          ),
                        );
                      }
                    },
                    child: Container(
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
                        "Create Account",
                        style: TextStyle(color: Colors.white, fontSize: 20.sp),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
