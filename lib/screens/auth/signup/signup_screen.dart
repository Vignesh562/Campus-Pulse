import 'package:campuspulse/providers/auth/pulse_auth_provider.dart';
import 'package:campuspulse/screens/main_screen.dart';
import 'package:campuspulse/screens/auth/widget/textfield_pulse.dart';
import 'package:campuspulse/utils/constants/pulse_colors.dart';
import 'package:campuspulse/utils/constants/pulse_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../common/widgets/glass_card.dart';
import '../../../utils/utils.dart';

///  ENUM MUST BE OUTSIDE CLASS
enum RegisterRole { user, organizer }

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  RegisterRole selectedRole = RegisterRole.user;

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool loading = false;

  final supabase = Supabase.instance.client;

  Future<void> signUp() async {
    if (!signupFormKey.currentState!.validate()) return;

    setState(() => loading = true);

    try {
      final response = await supabase.auth.signUp(
        email: emailController.text.trim().toLowerCase(),
        password: passwordController.text.trim(),
      );

      final user = response.user;

      if (user != null) {
        await supabase.from('user_details').insert({
          'id': user.id,
          'name': fullNameController.text.trim(),
          'role': selectedRole == RegisterRole.organizer
              ? 'organizer'
              : 'user',
          'phone_number': null,
          'university': null,
          'profile_image': null,
          'qr_code': null,
          'confirmed_tickets': [],
          'cancelled_tickets': [],
          'favorites': [],
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.transparent,
            duration: const Duration(seconds: 2),
            content: Text(
              'Registered Successfully',
              style: PulseText.title.copyWith(color: PulseColors.green),
              textAlign: TextAlign.center,
            ),
          ),
        );

        Navigator.pop(context);
      }
    } catch (e) {
      debugPrint('Signup Error: $e');
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: PulseColors.primary,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: Utils.screenPadding(vertical: 20),
        child: Form(
          key: signupFormKey,
          child: ListView(
            children: [
              Text('Sign Up', style: PulseText.heading),
              Utils.spacePulse(),
              Text(
                'Create your account and start exploring everything CampusPulse has to offer.',
                style: PulseText.body,
              ),

              Utils.spacePulse(height: 16),

              TextFieldPulse(
                controller: fullNameController,
                label: 'Full Name',
                hint: 'Campus Pulse',
                prefixIcon: const Icon(Icons.person),
                validator: (value) =>
                value == null || value.isEmpty ? 'Please enter your name.' : null,
              ),

              Utils.spacePulse(),

              TextFieldPulse(
                controller: emailController,
                label: 'Email Address',
                hint: 'campuspulse@gmail.com',
                prefixIcon: const Icon(Icons.email),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Please enter your email.';
                  if (!value.contains('@')) return 'Enter a valid email';
                  return null;
                },
              ),

              Utils.spacePulse(),

              TextFieldPulse(
                controller: passwordController,
                label: 'Password',
                hint: 'Create Password',
                obscureText: true,
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: const Icon(Icons.remove_red_eye_sharp),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Password is required.';
                  if (value.length < 8) return 'Password must be at least 8 characters';
                  return null;
                },
              ),

              Utils.spacePulse(),

              TextFieldPulse(
                controller: confirmPasswordController,
                label: 'Confirm Password',
                hint: 'Repeat your password',
                obscureText: true,
                prefixIcon: const Icon(Icons.lock_reset),
                suffixIcon: const Icon(Icons.remove_red_eye_sharp),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Confirm Password is required.';
                  if (value != passwordController.text) return 'Password does not match.';
                  return null;
                },
              ),

              /// 🔥 ROLE SELECTION
              Utils.spacePulse(height: 24),

              Text('Register As', style: PulseText.title),

              Utils.spacePulse(height: 8),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white.withOpacity(0.05),
                ),
                child: Column(
                  children: [
                    RadioListTile<RegisterRole>(
                      title: const Text('User'),
                      value: RegisterRole.user,
                      groupValue: selectedRole,
                      onChanged: (value) {
                        setState(() => selectedRole = value!);
                      },
                    ),
                    RadioListTile<RegisterRole>(
                      title: const Text('Event Organizer'),
                      value: RegisterRole.organizer,
                      groupValue: selectedRole,
                      onChanged: (value) {
                        setState(() => selectedRole = value!);
                      },
                    ),
                  ],
                ),
              ),

              Utils.spacePulse(height: 30),

              Consumer<PulseAuthProvider>(
                builder: (context, provider, child) {
                  return GestureDetector(
                    onTap: signUp,
                    child: GlassCard(
                      child: Center(
                        child: Text(
                          loading ? 'Registering...' : 'Register',
                          style: PulseText.btnTxt,
                        ),
                      ),
                    ),
                  );
                },
              ),

              Utils.spacePulse(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?", style: PulseText.body),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Log In',
                      style: PulseText.title.copyWith(fontSize: 14),
                    ),
                  ),
                ],
              ),

              Utils.spacePulse(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('I agree to the ', style: PulseText.body.copyWith(fontSize: 12)),
                  Text(
                    'Terms of service and Privacy policy',
                    style: PulseText.title.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
