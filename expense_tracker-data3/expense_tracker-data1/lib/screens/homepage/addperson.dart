import 'package:flutter/material.dart';
import 'package:expense_tracker/screens/homepage/profile.dart';

class AddPerson extends StatefulWidget {
  @override
  _AddPersonState createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {
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
                Text('Add Person1', style: TextStyle(color: Colors.black)),
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
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          //setState(() => amt = val);
                        },
                      ),
                    ),
                    Text('add')
                    //yo add garesi data base ma debt doc create hune
                    //yo add lai on press garyo bhane press garna namilne next time
                    //name tyo field ma aaune
                    //uta cash in ra out ma pani name jane
                  ],
                ),

                SizedBox(
                  height: 20.0,
                ),
                Text('Add Person2', style: TextStyle(color: Colors.black)),
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
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          //setState(() => amt = val);
                        },
                      ),
                    ),
                    Text('add')
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Add Person3', style: TextStyle(color: Colors.black)),
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
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          //setState(() => amt = val);
                        },
                      ),
                    ),
                    Text('add')
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Add Person4', style: TextStyle(color: Colors.black)),
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
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          //setState(() => amt = val);
                        },
                      ),
                    ),
                    Text('add')
                  ],
                ),
                SizedBox(height: 40.0),
                // ignore: deprecated_member_use
                RaisedButton(
                    color: Colors.green[900],
                    padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      //side: BorderSide(color: Colors.white),
                    ),
                    child: Text(
                      'DONE',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    })
              ],
            ))));
  }
}
