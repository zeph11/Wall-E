import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/Authentication/Authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddPerson extends StatefulWidget {
  final AuthBase auth;
  final UserClass adddeatils;

  const AddPerson({this.auth, this.adddeatils});
  @override
  _AddPersonState createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {
  String name;

  final debtRef = FirebaseFirestore.instance.collection("debt");

  //creating databae
  Future<void> addpersondata(String name, int amount) async {
    String id = FirebaseAuth.instance.currentUser.uid;

    await debtRef
        .doc(id)
        .collection('debtid')
        //.doc(name)
        .doc(name)
        .set({
      "name": name,
      'amount': amount,
      "timestamp": DateTime.now(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: true,
          backgroundColor: Color(0xff3282B8),
          elevation: 0.0, //removes dropshadow
          title: Text('Add Person'),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 50.0),
            child: Form(
                child: new Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Add Person', style: TextStyle(color: Colors.black)),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 250,
                      //alignment: ,
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.0),
                          ),
                          hintText: 'Enter  name',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xff3282B8).withOpacity(0.9),
                        ),
                        onChanged: (val) {
                          setState(() => name = val);
                        },
                      ),
                    ),

                    //Text('add'),

                    //yo add garesi data base ma debt doc create hune
                    //yo add lai on press garyo bhane press garna namilne next time
                    //name tyo field ma aaune
                    //uta cash in ra out ma pani name jane
                  ],
                ),

                SizedBox(height: 40.0),
                // ignore: deprecated_member_use
                RaisedButton(
                    child: Text('ADD',
                        style: TextStyle(
                          fontSize: 18.0,
                          decoration: TextDecoration.underline,
                        )),
                    onPressed: () {
                      addpersondata(name, 0);
                      if (true) {
                        Fluttertoast.showToast(
                          msg: "Person Added",
                          gravity: ToastGravity.BOTTOM,
                          toastLength: Toast.LENGTH_SHORT,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                        );
                      }
                    }),
                // ignore: deprecated_member_use
                // RaisedButton(
                //     color: Colors.green[900],
                //     padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(50.0),
                //       //side: BorderSide(color: Colors.white),
                //     ),
                //     child: Text(
                //       'DONE',
                //       style: TextStyle(color: Colors.white),
                //     ),
                //     onPressed: () async {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => ProfilePage(
                //                     auth: widget.auth,
                //                     userInformation: widget.adddeatils,
                //                   )));
                //     })
              ],
            ))));
  }
}
