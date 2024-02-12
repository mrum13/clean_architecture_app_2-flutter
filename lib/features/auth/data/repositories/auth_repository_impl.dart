import 'dart:async';

import 'package:clean_architecture_app_2/core/error/exceptions.dart';
import 'package:clean_architecture_app_2/core/error/failures.dart';
import 'package:clean_architecture_app_2/core/platform/network_info.dart';
import 'package:clean_architecture_app_2/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:clean_architecture_app_2/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo networkInfo;
  final AuthRemoteDataSource remoteDataSource;
  // final DestinationLocalDataSource localDataSource;

  AuthRepositoryImpl({required this.networkInfo, required this.remoteDataSource});
  
  @override
  Future<Either<Failure, bool>> login({required String user, required String pass}) async {
    bool online = await networkInfo.isConnected();
    if (online) {
      ///mengambil data dari database online
      try {
        final result = await remoteDataSource.login(user: user, pass: pass);
        ///jika ada database lokal dan menyimpan hasil dari get API 
        // await localDataSource.cacheAll(result);
        return Right(result);
      } on TimeoutException {
        return const Left(TimeoutFailure('Time Out. No Response'));
      } on NotFoundException {
        return const Left(NotFoundFailure('Data Not Found'));
      } on ServerException {
        return const Left(ServerFailure('Server Error'));
      }
    } else {
      ///mengambil data dari database lokal
      // try {
      //   final result = await localDataSource.getAll();
      //   return Right(result.map((e) => e.toEntity).toList());
      // } on CachedException {
      //   return const Left(CachedFailure('Data is Not Present'));
      // }
      return const Right(false);
    }
  }
  
}