import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/colors.dart';
import '../../domain/entities/constants.dart';

class BalanceComponent extends StatefulWidget {
  const BalanceComponent({Key? key}) : super(key: key);

  @override
  _BalanceComponentState createState() => _BalanceComponentState();
}

class _BalanceComponentState extends State<BalanceComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(2*defaultPadding, 2*defaultPadding, 2*defaultPadding, 2*defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text(
              "Balanço Total",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 16,
                color: dogeIce.withOpacity(0.9),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "R\$ 2,100.00",
                  textAlign: TextAlign.right,
                  style: GoogleFonts.inter(
                    fontSize: 36,
                    color: dogeWhite,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ]
            )
          ],
        ),
    );
  }
}
