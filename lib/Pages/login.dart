import 'registerpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
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
        child: Padding(
          padding: EdgeInsets.only(top: 100.h),
          child: Form(
            key: _formKey,
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

                // Email Field
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
                      prefixIcon: Icon(Icons.mail),
                      labelText: 'Email',
                      hintText: "Enter Email",
                      border: InputBorder.none,
                      labelStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
                    ),
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Email is required";
                      } else if (!input.contains('@') || !input.contains('.com')) {
                        return "Enter valid email";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 25.h),

                // Password Field
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
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      labelText: 'Password',
                      hintText: "Enter Password",
                      border: InputBorder.none,
                      labelStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
                    ),
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Password is required";
                      } else if (input.length < 8) {
                        return "Password should be at least 8 characters";
                      }
                      return null;
                    },
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

                // Login Button
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      print("Email: ${_emailController.text}");
                      print("Password: ${_passwordController.text}");
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
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    ),
                  ),
                ),
                SizedBox(height: 35.h),

                // Register Now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15.sp,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
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
      ),
    );
  }
}
