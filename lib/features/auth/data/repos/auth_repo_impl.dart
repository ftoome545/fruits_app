import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/services/data_service.dart';
import 'package:fruits_hub/core/utils/backend_endpoint.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/firebase_auth_service.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl(
      {required this.databaseService, required this.firebaseAuthService});

  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWitheEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      return Left(ServerFailure(e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      log("Exception in AuthRepoImpl.createUserWitheEmailAndPassword: ${e.toString()}");
      return Left(ServerFailure('حدث خطأ ما. من فضلك حاول مجدداً'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log("Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}");
      return Left(ServerFailure('حدث خطأ ما. من فضلك حاول مجدداً'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log("Exception in AuthRepoImpl.signInWithGoogle: ${e.toString()}");
      return Left(ServerFailure('حدث خطأ ما. من فضلك حاول مجدداً'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log("Exception in AuthRepoImpl.signinWithFacebook: ${e.toString()}");
      return Left(ServerFailure('حدث خطأ ما. من فضلك حاول مجدداً'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
        path: BackendEndpoint.addUserData, data: user.toMap());
  }
}
