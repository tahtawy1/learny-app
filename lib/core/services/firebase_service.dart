import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learny/core/const/user_role.dart';
import 'package:learny/core/error/exceptions.dart';
import 'package:learny/features/auth/data/models/user_model.dart';

class FirebaseService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;
  static Future<UserModel> getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw AuthException(code: 'user_not_logged_in');
      }
      return await getDataUserWithId(user.uid);
    } on FirebaseException catch (e) {
      throw AuthException(code: e.code);
    } on SocketException {
      throw AuthException(code: "No_Internet_connection");
    } on TimeoutException {
      throw AuthException(code: 'The_connection_has_timed_out');
    } on FormatException catch (e) {
      throw AuthException(code: e.message);
    } catch (e) {
      throw AuthException(code: e.toString());
    }
  }

  static Future<UserModel> getDataUserWithId(String userId) async {
    final doc = await _firebaseFirestore.collection('users').doc(userId).get();

    final data = doc.data();

    if (!doc.exists || data == null) {
      throw AuthException(code: 'user-not-found');
    }

    return UserModel(
      id: userId,
      email: data['email'] as String? ?? '',
      role: userRoleFromJson(data['role'] as String),
      name: data['name'] as String? ?? '',
      phone: data['phone'] as String? ?? '',
      isBlock: data['isBlock'] as bool? ?? false,
      emailVerified: data['emailVerified'] as bool? ?? false,
    );
  }

  static String? getCurrentUserId() {
    return _auth.currentUser?.uid;
  }

  static Future<UserModel> updateUserProfile({required String name}) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw const AuthException(code: 'user_not_logged_in');
      }

      await user.updateDisplayName(name);
      await _firebaseFirestore
          .collection('users')
          .doc(user.uid)
          .update({'name': name});

      return await getDataUserWithId(user.uid);
    } on FirebaseException catch (e) {
      throw AuthException(code: e.code);
    } catch (e) {
      if (e is AppException) rethrow;
      throw AuthException(code: e.toString());
    }
  }

  // ── Email Verification ─────────────────────────────────────────────────────
  static Future<void> reloadCurrentUser() async {
    try {
      await _auth.currentUser?.reload();
    } catch (e) {
      throw AuthException(code: e.toString());
    }
  }

  static bool isEmailVerified() {
    return _auth.currentUser?.emailVerified ?? false;
  }

  static Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } catch (e) {
      throw AuthException(code: e.toString());
    }
  }

  static Future<UserModel> signInWithEmailAndPassword(
    UserModel userModel,
  ) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password!,
      );

      final user = userCredential.user;

      if (user == null) {
        throw AuthException(code: 'invalid_credential');
      }

      final doc = await _firebaseFirestore
          .collection('users')
          .doc(user.uid)
          .get();

      final data = doc.data();
      return UserModel(
        id: user.uid,
        email: userModel.email,
        role: userRoleFromJson(data?["role"]),
        name: user.displayName,
        isBlock: data?["isBlock"] as bool?,
        emailVerified: user.emailVerified,
        phone: data?['phone'] as String?,
      );
    } on FirebaseException catch (e) {
      log(e.toString());
      throw AuthException(code: e.code);
    } on SocketException {
      throw AuthException(code: "No_Internet_connection");
    } on TimeoutException {
      throw AuthException(code: 'The_connection_has_timed_out');
    } on FormatException catch (e) {
      log(e.toString());
      throw AuthException(code: e.message);
    } catch (e) {
      log(e.toString());
      throw AuthException(code: e.toString());
    }
  }

  static Future<UserModel> createUserWithEmailAndPassword(
    UserModel userModel,
  ) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password!,
      );

      final user = userCredential.user;
      if (user == null) {
        throw AuthException(code: 'invalid_credential');
      }

      await user.updateDisplayName(userModel.name);

      userModel = UserModel(
        id: user.uid,
        email: userModel.email,
        name: userModel.name,
        phone: userModel.phone,
        role: userModel.role ?? UserRole.student,
        emailVerified: user.emailVerified,
        isBlock: userModel.isBlock,
      );

      await _firebaseFirestore
          .collection('users')
          .doc(user.uid)
          .set(userModel.toJson());

      return userModel;
    } on FirebaseException catch (e) {
      log(e.toString());
      throw AuthException(code: e.code);
    } on SocketException {
      throw AuthException(code: "No_Internet_connection");
    } on TimeoutException {
      throw AuthException(code: 'The_connection_has_timed_out');
    } on FormatException catch (e) {
      log(e.toString());
      throw AuthException(code: e.message);
    } catch (e) {
      log(e.toString());
      throw AuthException(code: e.toString());
    }
  }

  // ── Password Reset ─────────────────────────────────────────────────────────
  static Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e);
      throw AuthException(code: e.toString());
    }
  }

  static Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw AuthException(code: e.toString());
    }
  }
}
