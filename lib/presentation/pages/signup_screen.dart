import 'package:flutter/material.dart';

import '../../domain/entities/colors.dart';
import '../../domain/entities/constants.dart';
import '../widgets/signup_component.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: owlletMidnight,
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
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
                      height: 480,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(defaultRadius))),
                      child: const Padding(
                        padding:
                            EdgeInsets.fromLTRB(0, 2 * defaultPadding, 0, 0),
                        child: Column(
                          children: [
                            SignupComponent(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
