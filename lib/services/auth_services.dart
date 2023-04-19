import 'package:firebase_auth/firebase_auth.dart';
import 'package:group_app/helper/helper_function.dart';
import 'package:group_app/services/database_services.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // login

  Future loginWithrUserWithEmailandPassword(
      String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (user != null) {
        // call database service to update the user data
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // register
  Future registerUserWithEmailandPassword(
      String fullname, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (user != null) {
        // call database service to update the user data

        await DatabaseService(uid: user.uid).savingUserData(fullname, email);

        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // signout

  Future signOut() async {
    try {
      await HelperFunction.savedUserLoggedinStatus(false);
      await HelperFunction.savedUserEmailSF("");
      await HelperFunction.savedUserNameSF("");
      await firebaseAuth.signOut();

      } catch (e) {
      return null;
    }
  }
}
