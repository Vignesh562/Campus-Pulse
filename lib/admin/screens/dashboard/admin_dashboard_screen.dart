import 'package:campuspulse/providers/auth/pulse_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Consumer<PulseAuthProvider>(
        builder: (context,provider,child) {
          return FloatingActionButton(
            onPressed: provider.logOut,
            child: Text('Log Out'),
          );
        }
      ),
      body: Center(child: Text('Admin Screen')),
    );
  }
}
