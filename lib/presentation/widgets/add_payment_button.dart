import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/colors.dart';
import '../../domain/entities/constants.dart';

class AddPaymentButton extends StatefulWidget {
  const AddPaymentButton({Key? key}) : super(key: key);

  @override
  _AddPaymentButtonState createState() => _AddPaymentButtonState();
}

class _AddPaymentButtonState extends State<AddPaymentButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {

      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
      ),
      backgroundColor: dogeIce.withOpacity(0.8),
      child: Icon(
        CupertinoIcons.arrow_up_arrow_down,
        color: dogeMidnight.withOpacity(0.9),
      ),
    );
  }
}
