import 'package:flutter/material.dart' show Color;

import 'transfer.dart';

class Account {
  static num _id = 0;
  String title;
  final num id;
  double _balance;
  final Color color;
  List<Transfer> _payments;

  List<Transfer> get payments => _payments;

  double get balance => _balance;

  Account(this.title, this._balance, this.color, this._payments) : id = _id {
    _id++;
  }

  Account.empty(this.color)
      : title = 'Account',
        _balance = 0,
        _payments = [],
        id = _id {
    _id++;
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'balance': _balance, 'color': color};
  }

  @override
  String toString() {
    return 'Account{id: $id, title: $title, balance: $_balance, color: $color}';
  }

  void addPayment(Transfer payment) {
    if (this == payment.originAccountID) {
      _payments.add(payment);

      if (payment.destinationAccountID != null) {
        payment.destinationAccountID!.addPayment(payment);
      }

      _balance -= payment.value;
    } else if (this == payment.destinationAccountID) {
      _payments.add(payment);

      _balance += payment.value;
    }
  }

  void removePayment(num id) {
    Transfer payment = payments.lastWhere((element) => element.id == id);
    if (this == payment.originAccountID) {
      if (payment.destinationAccountID != null) {
        payment.destinationAccountID!.removePayment(id);
      }

      _payments.removeWhere((element) => element.id == payment.id);
      _balance += payment.value;
    } else if (this == payment.destinationAccountID) {
      _payments.removeWhere((element) => element.id == payment.id);

      _balance -= payment.value;
    }
  }
}
