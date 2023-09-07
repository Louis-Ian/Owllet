import 'package:flutter/material.dart';

import '../../domain/entities/colors.dart';
import '../../domain/entities/constants.dart';
import '../widgets/login_component.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: owlletMidnight,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            height: 360,
                            child: SizedBox(
                              height: 128,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(defaultPadding),
                                child: Image.asset(
                                  "lib/assets/icons/logo.png",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 460,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(defaultRadius),
                          ),
                        ),
                        child: const Padding(
                          padding:
                              EdgeInsets.fromLTRB(0, 2 * defaultPadding, 0, 0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              LoginComponent(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
