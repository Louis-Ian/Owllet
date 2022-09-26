import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/account.dart';
import '../repositories/account_repository.dart';

class DeleteAccount {
  final AccountsRepository repository;

  DeleteAccount(this.repository);

  Future<Either<Failure, int>> call({required Account account}) async {
    return await repository.deleteAccount(account);
  }
}
