import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRemoteDatasource
{
  FirebaseAuth firbaseAuth  = FirebaseAuth.instance;

  Future<String> createUserAccount({required String email, required String password, required String name})async
  {
    try {
      await firbaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await firbaseAuth.currentUser?.updateDisplayName(name);
      return "Account Created Successfully";
    }
    catch(e)
    {
      print(e.toString());
      return e.toString();
    }
  }

  Future<String> loginUserAccount({
    required String email,
    required String password,
})async {
    try{
      await firbaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return "Login Success";
    }catch(e){
      return e.toString();
    }
  }
}