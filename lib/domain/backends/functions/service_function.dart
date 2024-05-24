import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<UserCredential?> createAccount(String id, String pass) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: id,
        password: pass,
      );
      return credential;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<UserCredential?> signIn(String id, String pass) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: id,
        password: pass,
      );
      return credential;
    } catch (e) {
      print(e);
    }

    return null;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
