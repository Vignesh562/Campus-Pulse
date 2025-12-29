import 'package:campuspulse/providers/auth/pulse_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common/widgets/gradient_background.dart';
import 'screens/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: "https://skeotlyldsabdsgyjfuq.supabase.co",
    anonKey: "sb_publishable_sarOMS8-7UpR6BMLp_ITLQ_o5bY6_9Z",
  );

  runApp(CampusPulse());
}

class CampusPulse extends StatelessWidget {
  const CampusPulse({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PulseAuthProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          canvasColor: Colors.transparent,
          colorScheme: const ColorScheme.dark(
            background: Colors.transparent,
            surface: Colors.transparent,
          ),
        ),

        builder: (context, child) {
          return GradientBackground(child: child ?? const SizedBox());
        },

        home: const SplashScreen(),

        navigatorKey: navigatorKey,
        scaffoldMessengerKey:scaffoldMessengerKey,
      ),
    );
  }
}
