import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripbudgeter/Admin/Trip.dart';
import 'package:tripbudgeter/Admin/User.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Text(
                "Admin Menu",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.add, size: 22.sp),
              title: Text("All Trips", style: TextStyle(fontSize: 16.sp)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TripScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.people, size: 22.sp),
              title: Text("Manage Users", style: TextStyle(fontSize: 16.sp)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserTile(), // Provide an appropriate users list here
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.analytics, size: 22.sp),
              title: Text("Reports", style: TextStyle(fontSize: 16.sp)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout, size: 22.sp),
              title: Text("Logout", style: TextStyle(fontSize: 16.sp)),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Overview",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCard("Trips", "24", Icons.flight),
                _buildCard("Users", "56", Icons.people),
                _buildCard("Budget", "\$12K", Icons.attach_money),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              "Recent Activity",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.flight_takeoff, size: 22.sp),
                    title: Text("Trip to Paris", style: TextStyle(fontSize: 16.sp)),
                    subtitle: Text("Added by John", style: TextStyle(fontSize: 14.sp)),
                  ),
                  ListTile(
                    leading: Icon(Icons.flight_takeoff, size: 22.sp),
                    title: Text("Trip to Dubai", style: TextStyle(fontSize: 16.sp)),
                    subtitle: Text("Updated by Admin", style: TextStyle(fontSize: 14.sp)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, String value, IconData icon) {
    return Card(
      elevation: 3,
      child: Container(
        width: 100.w,
        padding: EdgeInsets.all(12.w),
        child: Column(
          children: [
            Icon(icon, size: 30.sp, color: Colors.blue),
            SizedBox(height: 8.h),
            Text(
              value,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            Text(title, style: TextStyle(fontSize: 14.sp)),
          ],
        ),
      ),
    );
  }
}
