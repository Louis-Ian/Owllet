import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/account.dart';
import '../repositories/account_repository.dart';

class GetAccounts {
  final AccountsRepository repository;

  GetAccounts(this.repository);

  Future<Either<Failure, List>> call() async {
    return await repository.getAccounts();
  }
}
