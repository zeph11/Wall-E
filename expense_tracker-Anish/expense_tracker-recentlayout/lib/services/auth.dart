//connect to the database for authenciation
import 'package:firebase_auth/firebase_auth.dart';
import 'user.dart';
import 'package:expense_tracker/screens/Authenticate/register.dart';
import 'package:expense_tracker/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create userclass object based on firebaseUser
  Userclass _userfromfirebaseuser(User user) {
    return user != null ? Userclass(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<Userclass> get user {
    return _auth.authStateChanges().map(_userfromfirebaseuser);
  }

  //register
  Future registerwithemail(String email, String name, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      //create a new user document
      await DatabaseService(uid: user.uid).trialDatabase(email, name, password);
      return _userfromfirebaseuser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in emial
  Future signinwithemail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userfromfirebaseuser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

/*import 'package:google_sign_in/google_sign_in.dart';  

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<User> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  
  
  final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);
  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final User currentUser = await _auth.currentUser;
  assert(currentUser.uid == user.uid);

  
  return user;
}


void signoutGoogle() async {
  await googleSignIn.signOut();
}
*/
