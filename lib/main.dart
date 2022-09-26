import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../firebase_options.dart';
import 'domain/repositories/authentication_service.dart';
import 'presentation/pages/authentication_wrapper.dart';
import 'presentation/pages/home_screen.dart';
import 'presentation/pages/login_screen.dart';
import 'presentation/pages/signup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(),
        ),
      ],
      child: MaterialApp(
        title: 'Doge Finances',
        initialRoute: '/',
        routes: {
          '/': (context) => const AuthenticationWrapper(),
          '/login': (context) => const Loginscreen(),
          '/home': (context) => const Homescreen(),
          '/signup': (context) => const Signupscreen(),
        },
      ),
    );
  }
}
