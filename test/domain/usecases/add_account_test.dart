import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import 'package:owllet/domain/entities/account.dart';
import 'package:owllet/domain/entities/transfer.dart';
import 'package:owllet/domain/repositories/account_repository.dart';
import 'package:owllet/domain/usecases/add_account.dart';

import 'add_account_test.mocks.dart';

@GenerateMocks([AccountsRepository])
void main() {
  group(
    'Add account',
    () {
      const accColor = Colors.white;
      MockAccountsRepository repository = MockAccountsRepository();
      AddAccount usecase = AddAccount(repository);

      test(
        'Add empty account',
        () async {
          // Arrange
          Account emptyAccount = Account('Empty Account', 0, accColor, []);

          when(repository.addAccount(any))
              .thenAnswer((_) async => Right(emptyAccount.id as int));

          // Act
          final result = await usecase(account: emptyAccount);

          // Assert
          expect(result, Right(emptyAccount.id as int));
          verify(repository.addAccount(emptyAccount));
          verifyNoMoreInteractions(repository);
        },
      );

      test(
        'Add account with some expenses registered',
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

          when(repository.addAccount(any))
              .thenAnswer((_) async => Right(testAccount.id as int));

          // Act
          final result = await usecase(account: testAccount);

          // Assert
          expect(result, Right(testAccount.id as int));
          verify(repository.addAccount(testAccount));
          verifyNoMoreInteractions(repository);
        },
      );
    },
  );
}
