import 'package:learny/core/services/firebase_service.dart';
import 'package:learny/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(UserModel credentials);
  Future<UserModel> register(UserModel userModel);
  Future<void> reloadCurrentUser();
  bool isEmailVerified();
  Future<void> sendEmailVerification();
  Future<void> sendPasswordResetEmail(String email);
  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl();

  @override
  Future<UserModel> login(UserModel userModel) async {
    return FirebaseService.signInWithEmailAndPassword(userModel);
  }

  @override
  Future<UserModel> register(UserModel userModel) async {
    return FirebaseService.createUserWithEmailAndPassword(userModel);
  }

  @override
  Future<void> reloadCurrentUser() async {
    await FirebaseService.reloadCurrentUser();
  }

  @override
  bool isEmailVerified() {
    return FirebaseService.isEmailVerified();
  }

  @override
  Future<void> sendEmailVerification() async {
    await FirebaseService.sendEmailVerification();
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await FirebaseService.sendPasswordResetEmail(email);
  }

  @override
  Future<void> signOut() async {
    await FirebaseService.signOut();
  }
}
