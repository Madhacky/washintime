import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:washintimeassing/Authservice/authentication.dart';
class Googlebutton extends StatefulWidget {

  final String? text;
  final IconData? icon;
  final Color? c;
  final double? iconsize;
  final VoidCallback? func;

  
   Googlebutton({ @required this.text, @required this.icon,this.func, this.c,this.iconsize,});

  @override
  State<Googlebutton> createState() => _GooglebuttonState();
}

class _GooglebuttonState extends State<Googlebutton> {
     final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return 
    
     ElevatedButton(
      
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        fixedSize: Size(MediaQuery.of(context).size.width*0.88, MediaQuery.of(context).size.height*0.070),
        elevation: 5,
        primary: Colors.white
      ),
      onPressed: widget.func,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(widget.icon,color: widget.c,size: widget.iconsize,),
          SizedBox(width: 10,),
          Text(widget.text!,style: GoogleFonts.urbanist(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold))
        ],
      ),
    ) ;
  }
}