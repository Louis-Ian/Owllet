import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/colors.dart';
import '../../domain/entities/constants.dart';
import '../widgets/account_info.dart';
import '../widgets/add_payment_button.dart';
import '../widgets/balance_component.dart';
import '../widgets/transaction_item.dart';
import '../widgets/user_icon.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dogeMidnight,
      floatingActionButton: const Padding(
          padding: EdgeInsets.fromLTRB(
              0, 0, defaultPadding, 2 * defaultPadding),
          child: AddPaymentButton()),
      body: SafeArea(
        child: ListView(children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    2 * defaultPadding, defaultPadding, 2 * defaultPadding, 0),
                // ignore: sized_box_for_whitespace
                child: Container(
                  height: 48,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(
                        width: 8.0,
                      ),
                      UserIcon(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(2 * defaultPadding,
                      defaultPadding, 2 * defaultPadding, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: dogeCloudy.withOpacity(0.8),
                      borderRadius: const BorderRadius.all(
                          Radius.circular(defaultRadius)),
                    ),
                    child: const BalanceComponent(),
                  ),
                ),
              ),
              GridView.builder(
                padding: const EdgeInsets.all(2 * defaultPadding),
                shrinkWrap: true,
                itemCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: largePadding,
                  mainAxisSpacing: largePadding,
                  childAspectRatio: 160 / 90,
                ),
                itemBuilder: (context, index) => const AccountInfo(),
              ),
              Container(
                  height: 1000,
                  padding: const EdgeInsets.only(
                    top: largePadding,
                    bottom: largePadding,
                    left: 3 * defaultPadding,
                    right: 3 * defaultPadding,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(2 * defaultPadding),
                        topRight: Radius.circular(2 * defaultPadding),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          colors: [
                            dogeCloudy.withOpacity(1.0),
                            dogeCloudy.withOpacity(0.4)
                          ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Transações",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          color: dogeIce,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, defaultPadding, 0, defaultPadding),
                        child: TransactionItem(),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, defaultPadding, 0, defaultPadding),
                        child: TransactionItem(),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, defaultPadding, 0, defaultPadding),
                        child: TransactionItem(),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, defaultPadding, 0, defaultPadding),
                        child: TransactionItem(),
                      ),
                    ],
                  ))
            ],
          ),
        ]),
      ),
    );
  }
}
