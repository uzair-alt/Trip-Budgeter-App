import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> user = {
      'name': 'John Doe',
      'email': 'john@example.com',
      'image': null,
    };

    return ScreenUtilInit(
      designSize: const Size(360, 690), // Base design size
      minTextAdapt: true,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "User Details",
              style: TextStyle(fontSize: 18.sp), // Responsive font size
            ),
            backgroundColor: Colors.blue,
          ),
          body: Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r), // Responsive radius
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30.r,
                backgroundImage: user['image'] != null
                    ? FileImage(user['image'] as File)
                    : const AssetImage('assets/default_user.png')
                        as ImageProvider,
              ),
              title: Text(
                user['name'] ?? "No Name",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "Email: ${user['email'] ?? ''}",
                style: TextStyle(fontSize: 14.sp),
              ),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'delete') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("User deleted")),
                    );
                  }
                },
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete, color: Colors.red),
                          SizedBox(width: 8),
                          Text('Delete'),
                        ],
                      ),
                    ),
                  ];
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
