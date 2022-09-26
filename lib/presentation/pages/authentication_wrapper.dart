import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/repositories/authentication_service.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);

    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if(snapshot.connectionState == ConnectionState.active){
          final User? user = snapshot.data;
          return user == null ? const Loginscreen() : const Homescreen();
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      }
    );
  }
}
