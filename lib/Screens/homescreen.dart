import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:washintimeassing/Authservice/google_sign_in.dart';
import 'package:washintimeassing/Model/responsemodel.dart';
import 'package:washintimeassing/Screens/loginscreen.dart';
import 'package:washintimeassing/Services/apiservice.dart';
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
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.greenAccent,
        elevation: 0,
        actions: [IconButton(
        onPressed:(){
          Navigator.pop(context);
  final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
  provider.logout().then((value) => Navigator.push(context, MaterialPageRoute(builder: ((context) => Loginscreen()))));
  
        } , 
      icon: Icon(Icons.logout_outlined,size: 30,color: Colors.black,))]),
      backgroundColor: Colors.greenAccent,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:15.0,top: 30),
              child: Text('Welcome, '+user!.displayName.toString()+" \nIt's "+datetime,style: GoogleFonts.urbanist(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 15,),
            Expanded(
              child: FutureBuilder(
                future: ApiService().getRequest(''),
                builder: (builder,snapshot){
                if(snapshot.hasData){
                  ResponseModel result = snapshot.data as ResponseModel;
                  return ListView.builder(
                    itemCount: result.problems!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title:Text( result.problems![index].diabetes![index].medications![index].medicationsClasses![index].className![index].associatedDrug![index].name!),
                      );
                    } 
                    );
                    
                }
                return Center(child: CircularProgressIndicator());
              }),
            )
          ],
        ),
      ) ,
    );
}
loadJson() async {
  String data = await rootBundle.loadString('assets/medicine.json');
  var jsonResult = json.decode(data);
  print(jsonResult);
}
}
