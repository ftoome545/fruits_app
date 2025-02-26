import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWitheEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.createUserWitheEmailAndPassword: ${e.toString()} eCode: ${e.code.toString()}");
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة جداً');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: "تأكد من اتصالك على الانترنت");
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'لقد قمت بتسجيل مسبقاً. الرجاء تسجيل الدخول');
      } else {
        throw CustomException(message: 'حدث خطأ. من فضلك حاول مجدداً');
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.createUserWitheEmailAndPassword: ${e.toString()}");
      throw CustomException(message: 'حدث خطأ. من فضلك حاول مجدداً');
    }
  }
}
