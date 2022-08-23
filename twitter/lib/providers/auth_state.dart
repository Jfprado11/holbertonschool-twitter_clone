import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twitter/models/user.dart' as local_user;
import 'package:uuid/uuid.dart';
import 'dart:math';

String getRandomString(int length) {
  const chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random rnd = Random();
  return String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
}

enum Errors {
  none,
  matchError,
  weakError,
  existsError,
  error,
  wrongError,
  noUserError
}

class Auth extends ChangeNotifier {
  final auth = FirebaseAuth.instance;

  final usersRef = FirebaseFirestore.instance
      .collection('users')
      .withConverter<local_user.User>(
        fromFirestore: (snapshot, _) {
          return local_user.User.fromJson(
            snapshot.data() ?? {},
          );
        },
        toFirestore: (user, _) => user.toJson(),
      );

  attemptSignUp(email, name, password, passwordConfirmation) async {
    try {
      if (password != passwordConfirmation) {
        return Errors.matchError;
      }
      final userCredentials = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userCreated = local_user.User(
        key: userCredentials.user!.uid,
        userID: const Uuid().v4(),
        email: email,
        userName: '@${getRandomString(8)}',
        displayName: name,
      );
      await usersRef.add(userCreated);
      return Errors.none;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Errors.weakError;
      } else if (e.code == 'email-already-in-use') {
        return Errors.existsError;
      }
    } catch (e) {
      return Errors.error;
    }
  }

  attemptLogin(email, password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Errors.none;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Errors.noUserError;
      } else if (e.code == 'wrong-password') {
        return Errors.wrongError;
      }
    } catch (e) {
      return Errors.error;
    }
  }

  logout() async {
    await auth.signOut();
    notifyListeners();
  }

  Future<local_user.User> getCurrentUserModel() async {
    final userUUid = auth.currentUser?.uid;
    final query = usersRef.where('key', isEqualTo: userUUid);
    final user = await query.get();
    return user.docs[0].data();
  }

  Future<local_user.User> getUserByID(String userID) async {
    final query = usersRef.where('userID', isEqualTo: userID);
    final user = await query.get();
    return user.docs[0].data();
  }
}
