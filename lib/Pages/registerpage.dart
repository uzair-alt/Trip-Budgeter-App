import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tripbudgeter/Admin/AdminHome.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  File? _profileImage;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

   void _register() {
    if (_formKey.currentState!.validate()) {
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account Created Successfully')),
      );

      // Navigate to Admin Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AdminHomeScreen()),
      );
    }
  }

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
          padding: EdgeInsets.only(top: 60.h, left: 16.w, right: 16.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    "Create Account",
                    style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Fill in your details below to start planning your trips and managing your travel budget.",
                    style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 20.h),

                  // Image Picker
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      width: 150.w,
                      height: 150.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: _profileImage != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: Image.file(
                                _profileImage!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add_a_photo,
                                    size: 40.sp, color: Colors.grey[700]),
                                SizedBox(height: 8.h),
                                Text(
                                  "Add Image",
                                  style: TextStyle(
                                      fontSize: 14.sp, color: Colors.grey[700]),
                                ),
                              ],
                            ),
                    ),
                  ),
                  SizedBox(height: 25.h),

                  // Name Field
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    width: double.infinity,
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        labelText: 'Name',
                        hintText: "Enter Name",
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                            color: Colors.black, fontSize: 16.sp),
                      ),
                      validator: (input) {
                        if (input!.isEmpty) {
                          return "Name is required";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 15.h),

                  // Email Field
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    width: double.infinity,
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.mail),
                        labelText: 'Email',
                        hintText: "Enter Email",
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                            color: Colors.black, fontSize: 16.sp),
                      ),
                      validator: (input) {
                        if (input!.isEmpty) {
                          return "Email is required";
                        } else if (!input.contains('@') ||
                            !input.contains('.com')) {
                          return "Enter valid email";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 15.h),

                  // Password Field
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    width: double.infinity,
                    child: TextFormField(
                      controller: _pwController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                        labelText: 'Password',
                        hintText: "Enter Password",
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                            color: Colors.black, fontSize: 16.sp),
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
                  SizedBox(height: 25.h),

                  // Register Button
                  GestureDetector(
                    onTap: _register,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 40, 30, 93),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        "Create Account",
                        style: TextStyle(color: Colors.white, fontSize: 20.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
