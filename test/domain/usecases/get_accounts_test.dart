import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import 'package:owllet/domain/entities/account.dart';
import 'package:owllet/domain/entities/transfer.dart';
import 'package:owllet/domain/repositories/account_repository.dart';
import 'package:owllet/domain/usecases/get_accounts.dart';

import 'get_accounts_test.mocks.dart';

@GenerateMocks([AccountsRepository])
void main() {
  group(
    'Get accounts',
    () {
      const accColor = Colors.white;
      MockAccountsRepository repository = MockAccountsRepository();
      GetAccounts usecase = GetAccounts(repository);
      test(
        'Get empty list',
        () async {
          // Arrange
          List<Account> emptyList = [];

          when(repository.getAccounts())
              .thenAnswer((_) async => Right(emptyList));

          // Act
          final result = await usecase();

          // Assert
          expect(result, Right(emptyList));
          verify(repository.getAccounts());
          verifyNoMoreInteractions(repository);
        },
      );

      test(
        'Get list with 1 account',
        () async {
          // Arrange
          Account testAccount = Account('Account 1', 200, accColor, []);
          testAccount.addPayment(Transfer(
              value: 20,
              originAccountID: testAccount,
              destinationAccountID: null,
              description: 'test expense 1',
              date: DateTime(2022, 04, 20)));
          testAccount.addPayment(Transfer(
              value: 40,
              originAccountID: testAccount,
              destinationAccountID: null,
              description: 'test expense 2',
              date: DateTime(2022, 05, 21)));

          List<Account> accountsList = [testAccount];

          when(repository.getAccounts())
              .thenAnswer((_) async => Right(accountsList));

          // Act
          final result = await usecase();

          // Assert
          expect(result, Right(accountsList));
          verify(repository.getAccounts());
          verifyNoMoreInteractions(repository);
        },
      );

      test(
        'Get list with 10 accounts',
        () async {
          // Arrange
          List<Account> accountsList = [];

          for (var i = 0; i < 10; i++) {
            // Create account with new id
            Account testAccount = Account('Account $i', 200, accColor, []);
            testAccount.addPayment(Transfer(
                value: 20,
                originAccountID: testAccount,
                destinationAccountID: null,
                description: 'test expense 1',
                date: DateTime(2022, 04, 20)));
            testAccount.addPayment(Transfer(
                value: 40,
                originAccountID: testAccount,
                destinationAccountID: null,
                description: 'test expense 2',
                date: DateTime(2022, 05, 21)));

            // Add to the list
            accountsList.add(testAccount);
          }

          when(repository.getAccounts())
              .thenAnswer((_) async => Right(accountsList));

          // Act
          final result = await usecase();

          // Assert
          expect(result, Right(accountsList));
          verify(repository.getAccounts());
          verifyNoMoreInteractions(repository);

          List<Account> resultList = (result as Right).value;
          expect(resultList[9].id, 10);
          expect(resultList.length, 10);
        },
      );
    },
  );
}
