import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateTripScreen extends StatefulWidget {
  const CreateTripScreen({super.key});

  @override
  State<CreateTripScreen> createState() => _CreateTripScreenState();
}

class _CreateTripScreenState extends State<CreateTripScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _tripNameController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();

  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _pickDate(BuildContext context, bool isStart) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        if (isStart) {
          _startDate = pickedDate;
        } else {
          _endDate = pickedDate;
        }
      });
    }
  }

  void _saveTrip() {
    if (_formKey.currentState!.validate()) {
      print("Trip Name: ${_tripNameController.text}");
      print("Destination: ${_destinationController.text}");
      print("Start Date: $_startDate");
      print("End Date: $_endDate");
      print("Budget: ${_budgetController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 30, 93),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Add Trip", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey.shade300, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create Trip",
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Fill in the details to plan your perfect trip.",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 25.h),

                // Trip Name
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: TextFormField(
                    controller: _tripNameController,
                    validator: (value) =>
                        value!.isEmpty ? "Please enter trip name" : null,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.card_travel),
                      labelText: "Trip Name",
                      border: InputBorder.none,
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                // Destination
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: TextFormField(
                    controller: _destinationController,
                    validator: (value) =>
                        value!.isEmpty ? "Please enter destination" : null,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on_outlined),
                      labelText: "Destination",
                      border: InputBorder.none,
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                // Dates
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => _pickDate(context, true),
                        child: Container(
                          height: 55.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 15.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_today_outlined, size: 20.sp),
                              SizedBox(width: 10.w),
                              Text(
                                _startDate == null
                                    ? "Start Date"
                                    : "${_startDate!.day}/${_startDate!.month}/${_startDate!.year}",
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: InkWell(
                        onTap: () => _pickDate(context, false),
                        child: Container(
                          height: 55.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 15.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_today_outlined, size: 20.sp),
                              SizedBox(width: 10.w),
                              Text(
                                _endDate == null
                                    ? "End Date"
                                    : "${_endDate!.day}/${_endDate!.month}/${_endDate!.year}",
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                // Budget
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: TextFormField(
                    controller: _budgetController,
                    validator: (value) =>
                        value!.isEmpty ? "Please enter budget" : null,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.attach_money),
                      labelText: "Budget",
                      border: InputBorder.none,
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),

                // Save Trip Button
                Container(
                  width: double.infinity,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 40, 30, 93),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: TextButton(
                    onPressed: _saveTrip,
                    child: Text(
                      "Save Trip",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
