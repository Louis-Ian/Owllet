import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/account.dart';

abstract class AccountsRepository {
  Future<Either<Failure, int>> addAccount(Account account);
  Future<Either<Failure, int>> deleteAccount(Account account);
  Future<Either<Failure, List>> getAccounts();
}
