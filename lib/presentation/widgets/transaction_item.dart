import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/colors.dart';
import '../../domain/entities/constants.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({Key? key}) : super(key: key);

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
            color: dogeBlack.withOpacity(0.2),
            borderRadius: const BorderRadius.all(Radius.circular(defaultRadius))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              "lib/assets/icons/buy.png",
              width: 32,
              height: 32,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.fromLTRB(defaultPadding, 0, defaultPadding, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Coquinha",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        color: dogeIce,
                      ),
                    ),
                    Text(
                      "Conta 1",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        color: dogeLilac,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "R\$ 3,80",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
                Text(
                  "396,20",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: dogeWhite,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
