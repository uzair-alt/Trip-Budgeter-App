import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripbudgeter/Admin/AddTrip.dart';

class TripScreen extends StatefulWidget {
  const TripScreen({super.key});

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  // Mock trip data (replace with Firebase later)
  List<Map<String, dynamic>> trips = [
    {
      "tripName": "Paris Vacation",
      "destination": "Paris, France",
      "startDate": "12/09/2025",
      "endDate": "20/09/2025",
      "budget": "\$2000"
    },
    {
      "tripName": "Dubai Getaway",
      "destination": "Dubai, UAE",
      "startDate": "05/10/2025",
      "endDate": "12/10/2025",
      "budget": "\$3000"
    },
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 40, 30, 93),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 40, 30, 93),
              ),
              child: Text(
                "TripBudgeter Admin",
                style: TextStyle(color: Colors.white, fontSize: 20.sp),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text("All Trips"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Manage Users"),
              onTap: () {
                // Navigate to Manage Users Screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.analytics),
              title: const Text("Reports"),
              onTap: () {
                // Navigate to Reports Screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                // Implement Logout
              },
            ),
          ],
        ),
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey.shade300, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: trips.isEmpty
            ? Center(
                child: Text(
                  "No trips added yet",
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.all(16.w),
                itemCount: trips.length,
                itemBuilder: (context, index) {
                  final trip = trips[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(12.w),
                      leading: CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 40, 30, 93),
                        child: const Icon(Icons.flight_takeoff, color: Colors.white),
                      ),
                      title: Text(
                        trip["tripName"],
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Destination: ${trip["destination"]}"),
                          Text("Dates: ${trip["startDate"]} - ${trip["endDate"]}"),
                          Text("Budget: ${trip["budget"]}"),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            trips.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 40, 30, 93),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CreateTripScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
