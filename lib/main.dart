import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'mainscreens/home.dart';
// import 'package:your_app_name/home_page.dart'; // Import your main app page/widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English AI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
      ),
      debugShowCheckedModeBanner: false,
      home: GoogleSignInPage(), // Show the GoogleSignInPage initially
    );
  }
}

class GoogleSignInPage extends StatelessWidget {
  const GoogleSignInPage({Key? key});

  googleLogin(BuildContext context) async {
    print("Google login method called");
    GoogleSignIn _googleSignIn = GoogleSignIn(
      clientId:
      "29087784068-mgb215uh8mhjhbutl3fulk12krah59sj.apps.googleusercontent.com",
      // '29087784068-lnl70etnvk0dhgrgsvugd7u5e0gn8ed4.apps.googleusercontent.com',
    );
    try {
      var result = await _googleSignIn.signIn();
      if (result != null) {
        print("Signed in as: ${result}");
        print("Signed in as: ${result.displayName}");
        print("image link: ${result.photoUrl}");
        print("Email-id: ${result.email}");
        print("Authentication id: ${result.serverAuthCode}");
        print("${result.id}");
        print("google signin method successful access");
        // Navigate to the main content page after successful login
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Myhome(), // Replace with your main app page/widget
          ),
        );
      }
    } catch (error) {
      print(error);
    }
   }

  // final _googleSignIn = GoogleSignIn();
  // Future<void> GoogleSignOut() async {
  //   try {
  //     await _googleSignIn.signOut();
  //
  //   } catch (error) {
  //     print("Error signing out: $error");
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 206, 232, 245),
        title: Text(
          "English AI",
          style: TextStyle(
            color: Color.fromARGB(255, 113, 168, 47),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/new.png")),
              ),
            ),
            SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Start Learning with ",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 2),
                Text(
                  "English AI ",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 113, 168, 47),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 30,
              width: 200,
              child: ElevatedButton(
                onPressed: () => googleLogin(context), // Pass the context
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(
                      color: Color.fromARGB(255, 206, 232, 245),
                      width: 3,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Google Login",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 2),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/img.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
