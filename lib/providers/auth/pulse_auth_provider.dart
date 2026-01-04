import 'package:campuspulse/main.dart';
import 'package:campuspulse/screens/auth/login/login_screen.dart';
import 'package:campuspulse/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../admin/screens/dashboard/admin_dashboard_screen.dart';
import '../../utils/constants/pulse_colors.dart';
import '../../utils/constants/pulse_text.dart';

class PulseAuthProvider with ChangeNotifier {
  final supabase = Supabase.instance.client;
  bool loading = false;

  Future<void> login(String email, String password) async {
    _loading(true);
    try {
      await supabase.auth.signInWithPassword(password: password, email: email);

      final userId = supabase.auth.currentUser!.id;

      final List data = await supabase
          .from('user_details')
          .select('role_user')
          .eq('id', userId);

      bool isUser = (data.first)['role_user'] as bool;

      Navigator.pushAndRemoveUntil(
        navigatorKey.currentContext!,
        MaterialPageRoute(builder: (_) => isUser ? MainScreen() : AdminDashboardScreen()),
        (route) => false,
      );
    } on AuthApiException catch (e) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          duration: Duration(seconds: 2),
          content: Text(
            e.message,
            style: PulseText.title.copyWith(color: PulseColors.red),
            textAlign: TextAlign.center,
          ),
        ),
      );
    } catch (e) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          duration: Duration(seconds: 2),
          content: Text(
            e.toString(),
            style: PulseText.title.copyWith(color: PulseColors.red),
            textAlign: TextAlign.center,
          ),
        ),
      );
    } finally {
      _loading(false);
    }
  }

  void signUp(String name, String email, String password) async {
    _loading(true);
    try {
      final response = await supabase.auth.signUp(
        password: password,
        email: email,
      );
      final user = response.user;
      if (user != null && response.session != null) {
        await supabase.from('user_details').insert({
          'id': user.id,
          'name': name.trim(),
          'phone_number': null,
          'university': null,
          'profile_image': null,
          'qr_code': null,
          'confirmed_tickets': [],
          'cancelled_tickets': [],
          'favorites': [],
        });
        scaffoldMessengerKey.currentState?.showSnackBar(
          SnackBar(
            backgroundColor: Colors.transparent,
            duration: Duration(seconds: 2),
            content: Text(
              ' Registered Successfully ',
              style: PulseText.title.copyWith(color: PulseColors.green),
              textAlign: TextAlign.center,
            ),
          ),
        );
        Navigator.pop(navigatorKey.currentContext!);
      }
    } catch (e) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          duration: Duration(seconds: 2),
          content: Text(
            e.toString(),
            style: PulseText.title.copyWith(color: PulseColors.red),
            textAlign: TextAlign.center,
          ),
        ),
      );
    } finally {
      _loading(false);
    }
  }

  void logOut() async {
      _loading(true);
    try {
      await supabase.auth.signOut();
     Navigator.pushAndRemoveUntil(navigatorKey.currentContext!, MaterialPageRoute(builder: (_)=>LoginScreen()), (route)=>false);
    } catch (e) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          duration: Duration(seconds: 2),
          content: Text(
            e.toString(),
            style: PulseText.title.copyWith(color: PulseColors.red),
            textAlign: TextAlign.center,
          ),
        ),
      );
    } finally {
      _loading(false);
    }
  }

  _loading(bool value) {
    loading = value;
    notifyListeners();
  }
}
