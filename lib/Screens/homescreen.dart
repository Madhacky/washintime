import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Homescreen extends StatefulWidget {
  const Homescreen({ Key? key }) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final  user = FirebaseAuth.instance.currentUser;
  String datetime = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:15.0,top: 50),
              child: Text('Welcome, '+user!.displayName.toString()+" \nIt's "+datetime,style: GoogleFonts.urbanist(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ) ,
    );
}
}