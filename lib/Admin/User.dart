import 'dart:io';
import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  final List<Map<String, dynamic>> users;

  const UserListScreen({super.key, required this.users});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late List<Map<String, dynamic>> displayUsers;

  @override
  void initState() {
    super.initState();
    displayUsers = widget.users.isNotEmpty
        ? widget.users
        : [
            {
              'name': 'John Doe',
              'email': 'john@example.com',
              'password': '12345678',
              'image': null,
            },
            {
              'name': 'Jane Smith',
              'email': 'jane@example.com',
              'password': 'password123',
              'image': null,
            },
            {
              'name': 'Alex Johnson',
              'email': 'alex@example.com',
              'password': 'qwertyui',
              'image': null,
            },
          ];
  }

  void deleteUser(int index) {
    setState(() {
      displayUsers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registered Users"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: displayUsers.length,
        itemBuilder: (context, index) {
          final user = displayUsers[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: user['image'] != null
                    ? FileImage(user['image'] as File)
                    : const AssetImage('assets/default_user.png')
                        as ImageProvider,
              ),
              title: Text(
                user['name'] ?? "No Name",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email: ${user['email'] ?? ''}"),
                  Text(
                    "Password: ${'*' * (user['password']?.length ?? 0)}",
                  ),
                ],
              ),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'delete') {
                    deleteUser(index);
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
          );
        },
      ),
    );
  }
}
