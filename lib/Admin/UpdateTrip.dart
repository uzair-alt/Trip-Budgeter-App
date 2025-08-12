// EditTripScreen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditTripScreen extends StatefulWidget {
  final String tripName;
  final String destination;
  final double budget;
  final DateTime startDate;
  final DateTime endDate;

  const EditTripScreen({
    Key? key,
    required this.tripName,
    required this.destination,
    required this.budget,
    required this.startDate,
    required this.endDate,
  }) : super(key: key);

  @override
  State<EditTripScreen> createState() => _EditTripScreenState();
}

class _EditTripScreenState extends State<EditTripScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _tripNameController;
  late TextEditingController _destinationController;
  late TextEditingController _budgetController;

  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
    _tripNameController = TextEditingController(text: widget.tripName);
    _destinationController = TextEditingController(text: widget.destination);
    _budgetController = TextEditingController(text: widget.budget.toString());
    _startDate = widget.startDate;
    _endDate = widget.endDate;
  }

  Future<void> _pickDate(BuildContext context, bool isStart) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: isStart ? (_startDate ?? DateTime.now()) : (_endDate ?? DateTime.now()),
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

  void _updateTrip() {
    if (_formKey.currentState!.validate()) {
      print("Updated Trip Name: ${_tripNameController.text}");
      print("Updated Destination: ${_destinationController.text}");
      print("Updated Start Date: $_startDate");
      print("Updated End Date: $_endDate");
      print("Updated Budget: ${_budgetController.text}");
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 30, 93),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Edit Trip", style: TextStyle(color: Colors.white)),
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
                  "Edit Trip",
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Update the trip details below.",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 25.h),

                // Trip Name
                _buildTextField(_tripNameController, Icons.card_travel, "Trip Name"),
                SizedBox(height: 20.h),

                // Destination
                _buildTextField(_destinationController, Icons.location_on_outlined, "Destination"),
                SizedBox(height: 20.h),

                // Dates
                Row(
                  children: [
                    Expanded(
                      child: _buildDatePicker(true, _startDate, "Start Date"),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: _buildDatePicker(false, _endDate, "End Date"),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                // Budget
                _buildTextField(_budgetController, Icons.attach_money, "Budget", isNumber: true),
                SizedBox(height: 30.h),

                // Update Trip Button
                Container(
                  width: double.infinity,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 40, 30, 93),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: TextButton(
                    onPressed: _updateTrip,
                    child: Text(
                      "Update Trip",
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

  Widget _buildTextField(TextEditingController controller, IconData icon, String label, {bool isNumber = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: TextFormField(
        controller: controller,
        validator: (value) => value!.isEmpty ? "Please enter $label" : null,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: label,
          border: InputBorder.none,
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildDatePicker(bool isStart, DateTime? date, String label) {
    return InkWell(
      onTap: () => _pickDate(context, isStart),
      child: Container(
        height: 55.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(Icons.calendar_today_outlined, size: 20.sp),
            SizedBox(width: 10.w),
            Text(
              date == null ? label : "${date.day}/${date.month}/${date.year}",
              style: TextStyle(fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }
}
