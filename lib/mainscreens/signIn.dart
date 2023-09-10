import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class googleSignIn extends StatelessWidget {
  const googleSignIn({super.key});


    googleLogin() async{
      print("Google login method called");
      GoogleSignIn _googleSignIn = GoogleSignIn();
      try{
        var result = await _googleSignIn.signIn();
        print(result!.displayName);
        print(result.email);
        print(result.id);

      }catch(error){
        print(error);
      }

    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(elevation: 0,backgroundColor:Color.fromARGB(255, 206, 232, 245),title: Text(
          "English AI",
          style: TextStyle(color: Color.fromARGB(255, 113, 168, 47),
              fontWeight: FontWeight.bold,fontSize: 20),)),
        body:
        Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height: 50,width: 50,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/new.png"))),),


                  // SizedBox(height: 2,),
                  // Text("Welcome",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

                  SizedBox(height: 2,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Start Learning with ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),

                      SizedBox(width: 2,),
                      Text("English AI ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 113, 168, 47)),),
                    ],
                  ),


                  SizedBox(height: 30,),
                  SizedBox(
                    height: 30, // Set the desired height
                    width: 200, // Set the desired width
                    child: ElevatedButton(
                      onPressed: googleLogin,
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
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Google Login",style:
                          TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),

                          SizedBox(width: 2,),
                          Container(height: 20,width: 20,
                            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/google.png"),)),)
                        ],
                      ),),
                  )])


        ),


      );
    }
  }


