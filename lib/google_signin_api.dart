import 'package:google_sign_in/google_sign_in.dart';
 class GoogleSignInApi {
   static final _clientIDWeb =
   '29087784068-mgb215uh8mhjhbutl3fulk12krah59sj.apps.googleusercontent.com';
   static final _gooleSignIn = GoogleSignIn(clientId: _clientIDWeb);
   static Future<GoogleSignInAccount?> login() => _gooleSignIn.signIn();
   static Future logout() => _gooleSignIn.disconnect();
 }