import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/account.dart';
import '../repositories/account_repository.dart';

class AddAccount {
  final AccountsRepository repository;

  AddAccount(this.repository);

  Future<Either<Failure, int>> call({required Account account}) async {
    return await repository.addAccount(account);
  }
}
