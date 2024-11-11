import 'package:flutter/material.dart';
import 'package:uts_pm2/models/user.dart';

class DashboardScreen extends StatelessWidget {
  final User user;

  DashboardScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username: ${user.username}'),
            Text('Name: ${user.name}'),
            Text('Email: ${user.email}'),
            Text('Phone: ${user.phone}'),
          ],
        ),
      ),
    );
  }
}