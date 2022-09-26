import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import 'package:owllet/domain/entities/account.dart';
import 'package:owllet/domain/entities/transfer.dart';
import 'package:owllet/domain/usecases/delete_account.dart';
import 'package:owllet/domain/repositories/account_repository.dart';

import 'delete_account_test.mocks.dart';

@GenerateMocks([AccountsRepository])
void main() {
  DeleteAccount usecase;
  group(
    'Delete Account',
    () {
      const accColor = Colors.white;
      MockAccountsRepository repository = MockAccountsRepository();
      usecase = DeleteAccount(repository);

      test(
        'Delete existing empty account',
        () async {
          // Arrange
          Account emptyAccount = Account('Account empty', 0, accColor, []);

          when(repository.deleteAccount(any))
              .thenAnswer((_) async => Right(emptyAccount.id as int));

          // Act
          final result = await usecase(account: emptyAccount);

          // Assert
          expect(result, Right(emptyAccount.id as int));
          verify(repository.deleteAccount(emptyAccount));
          verifyNoMoreInteractions(repository);
        },
      );

      test(
        'Delete account with some expenses registered',
        () async {
          // Arrange
          Account testAccount = Account('Account not empty', 100, accColor, []);
          testAccount.addPayment(Transfer(
              value: 10,
              originAccountID: testAccount,
              destinationAccountID: null,
              description: 'test expense 1',
              date: DateTime(2022, 03, 17)));

          testAccount.addPayment(Transfer(
              value: 70,
              originAccountID: testAccount,
              destinationAccountID: null,
              description: 'test expense 2',
              date: DateTime(2021, 05, 29)));

          when(repository.deleteAccount(any))
              .thenAnswer((_) async => Right(testAccount.id as int));

          // Act
          final result = await usecase(account: testAccount);

          // Assert
          expect(result, Right(testAccount.id as int));
          verify(repository.deleteAccount(testAccount));
          verifyNoMoreInteractions(repository);
        },
      );
    },
  );
}
