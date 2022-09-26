import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/constants.dart';
import '../../domain/entities/random_bright_color.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({Key? key,}) : super(key: key);

  // AccountInfo(id) {
  //
  // }

  @override
  _AccountInfoState createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  bool _selected = false;
  final Color _accountColor = RandomBrightColor().generate();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selected ? _selected = false : _selected = true;
        });
      },
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
        ),
        primary: _selected ? _accountColor.withOpacity(0.2) : _accountColor.withOpacity(1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Conta 1",
            textAlign: TextAlign.left,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: _selected ? Colors.black.withOpacity(0.3) : Colors.black.withOpacity(1),
            ),
          ),
          Text(
            "R\$ 400,00",
            textAlign: TextAlign.left,
            style: GoogleFonts.inter(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: _selected ? Colors.white.withOpacity(0.3) : Colors.white.withOpacity(1),
            ),
          )
        ],
      ),
    );
  }
}
