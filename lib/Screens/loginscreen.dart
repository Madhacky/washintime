import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:washintimeassing/Authservice/google_sign_in.dart';
import 'package:washintimeassing/Screens/homescreen.dart';
import 'package:washintimeassing/widgets/googlebutton.dart';
class Loginscreen extends StatefulWidget {
  const Loginscreen({ Key? key }) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        color: Colors.green,
        child: Center(child: Googlebutton(
          text: 'Conitnue with google', 
                  icon: FontAwesomeIcons.google,
                  c: Colors.black,
                  iconsize: 20,
                  func: (){
                    final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                    provider.googleLogin().then((value) => Navigator.push(context, MaterialPageRoute(builder: ((context) => Homescreen()))));
                  },
        )
        ),
      ) ,


    );
  }
}