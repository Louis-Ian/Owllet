import 'package:owllet/domain/entities/transfer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:owllet/domain/entities/account.dart';

void main() {
  const accColor = Colors.white;

  group('Account', () {
    test('Empty creation', () {
      final account = Account.empty(accColor);

      expect(account.balance, 0);
      expect(account.color, accColor);
    });

    test('Creation', () {
      final account = Account('Account', 100, accColor, List<Transfer>.empty());

      expect(account.balance, 100);
      expect(account.color, accColor);
      expect(account.payments.length, 0);
    });

    test('Multiple IDs', () {
      final account1 = Account.empty(accColor);
      final account2 = Account.empty(accColor);

      expect(account1.id, 2);
      expect(account2.id, 3);
    });

    test('New deposit', () {
      final account = Account.empty(accColor);

      account.addPayment(Transfer(
        value: 20,
        originAccountID: account,
        destinationAccountID: null,
        description: 'test expense',
        date: DateTime(2022, 1, 15),
      ));

      expect(account.balance, -20);
      expect(account.payments.last.value, 20);
      expect(account.payments.last.originAccountID, account);
      expect(account.payments.last.description, 'test expense');
      expect(account.payments.last.date.year, 2022);
      expect(account.payments.last.date.month, 1);
      expect(account.payments.last.date.day, 15);
    });

    test('Mapping account', () {
      String accTitle = 'Account Mapped';
      double accBalance = 42;
      List<Transfer> accTransfers = List<Transfer>.empty();
      final account = Account(accTitle, accBalance, accColor, accTransfers);

      var expectedMap = {
        'id': 5,
        'title': accTitle,
        'balance': accBalance,
        'color': accColor
      };

      expect(account.toMap(), expectedMap);
    });

    test('Print account', () {
      String accTitle = 'Account Printed';
      double accBalance = -66.6;
      List<Transfer> accTransfers = List<Transfer>.empty();
      final account = Account(accTitle, accBalance, accColor, accTransfers);

      String expectedPrint =
          'Account{id: 6, title: $accTitle, balance: $accBalance, color: $accColor}';

      expect(account.toString(), expectedPrint);
    });

    test('New transfers', () {
      final accountOrig = Account.empty(accColor);
      final accountDest = Account.empty(accColor);

      accountOrig.addPayment(Transfer(
        value: 20,
        originAccountID: accountOrig,
        destinationAccountID: null,
        description: 'test transfer 1',
        date: DateTime(2022, 1, 15),
      ));
      accountOrig.addPayment(Transfer(
        value: 30,
        originAccountID: accountOrig,
        destinationAccountID: accountDest,
        description: 'test transfer 2',
        date: DateTime(2022, 2, 16),
      ));
      accountOrig.addPayment(Transfer(
        value: 40,
        originAccountID: accountOrig,
        destinationAccountID: accountDest,
        description: 'test transfer 3',
        date: DateTime(2022, 3, 17),
      ));

      expect(accountOrig.balance, -90);
      expect(accountOrig.payments.last.value, 40);
      expect(accountOrig.payments.last.originAccountID, accountOrig);
      expect(accountOrig.payments.last.description, 'test transfer 3');
      expect(accountOrig.payments.last.date.year, 2022);
      expect(accountOrig.payments.last.date.month, 3);
      expect(accountOrig.payments.last.date.day, 17);

      expect(accountDest.balance, 70);
      expect(accountDest.payments.last.value, 40);
      expect(accountDest.payments.last.originAccountID, accountOrig);
      expect(accountDest.payments.last.description, 'test transfer 3');
      expect(accountDest.payments.last.date.year, 2022);
      expect(accountDest.payments.last.date.month, 3);
      expect(accountDest.payments.last.date.day, 17);
    });

    test('Remove payment', () {
      final accountOrig = Account.empty(accColor);
      final accountDest = Account.empty(accColor);
      Transfer testPayment = Transfer(
        value: 30,
        originAccountID: accountOrig,
        destinationAccountID: accountDest,
        description: 'test deposit',
        date: DateTime(2022, 4, 28),
      );

      accountOrig.addPayment(testPayment);

      expect(accountOrig.balance, -30);
      expect(accountOrig.payments.last.value, 30);
      expect(accountOrig.payments.last.originAccountID, accountOrig);
      expect(accountOrig.payments.last.destinationAccountID, accountDest);
      expect(accountOrig.payments.last.description, 'test deposit');
      expect(accountOrig.payments.last.date.year, 2022);
      expect(accountOrig.payments.last.date.month, 4);
      expect(accountOrig.payments.last.date.day, 28);

      expect(accountDest.balance, 30);
      expect(accountDest.payments.last.value, 30);
      expect(accountDest.payments.last.originAccountID, accountOrig);
      expect(accountDest.payments.last.destinationAccountID, accountDest);
      expect(accountDest.payments.last.description, 'test deposit');
      expect(accountDest.payments.last.date.year, 2022);
      expect(accountDest.payments.last.date.month, 4);
      expect(accountDest.payments.last.date.day, 28);

      accountOrig.removePayment(testPayment.id);

      expect(accountOrig.balance, 0);
      expect(accountOrig.payments.length, 0);

      expect(accountDest.balance, 0);
      expect(accountDest.payments.length, 0);
    });
  });
}
