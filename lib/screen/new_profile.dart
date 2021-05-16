import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screen/side_menu.dart';

class NewProfile extends StatefulWidget {
  @override
  _NewProfileState createState() => _NewProfileState();
}

class _NewProfileState extends State<NewProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 20,
        actions: [
          Opacity(
            opacity: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child:GestureDetector(
                onTap: ()
                {
                  print('Data Saved');
                },
                child: Icon(Icons.save_outlined,color: Colors.black87,
                ),
              ),),
          )
        ],
      ),
      drawer: SideMenu(),
      body: GestureDetector(
        onTap:() {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          padding: EdgeInsets.only(top: 10),
          child: ListView(
            children: [
              Center(

                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4,
                        color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset:Offset(0,10),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit:BoxFit.cover,
                          image: NetworkImage('https://wallpapercave.com/wp/wp6819293.jpg'),
                        )
                      ),
                    ),
                    Positioned(
                      bottom:0,
                      right: 0,
                      child: GestureDetector(
                        onTap: (){
                          print('Change Profile Picture');
                        },
                        child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width:4,
                            color: Colors.white,
                          ),
                          color: Colors.grey[800],
                        ),
                        child: Icon(Icons.edit,color: Colors.white,),
                    ),
                      ))
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "UserName",
                    hintText: "Name",
                    hintStyle: TextStyle(fontSize: 16,
                        color: Colors.grey[500]),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "Location",
                    hintText: "xxxxxxxxxxxxxxxxxxxxx",
                    hintStyle: TextStyle(fontSize: 16,
                        color: Colors.grey[500]),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "Pincode",
                    hintText: "xxxxxx",
                    hintStyle: TextStyle(fontSize: 16,
                        color: Colors.grey[500]),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "Date of Birth",
                    hintText: "dd-mm-yyyy",
                    hintStyle: TextStyle(fontSize: 16,
                        color: Colors.grey[500]),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "Gender",
                    hintText: "Male",
                    hintStyle: TextStyle(fontSize: 16,
                        color: Colors.grey[500]),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "Whatsapp",
                    hintText: "+91-xxxxxxxxxx",
                    hintStyle: TextStyle(fontSize: 16,
                        color: Colors.grey[500]),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "Email",
                    hintText: "xxxxxxxx@hmail.com",
                    hintStyle: TextStyle(fontSize: 16,
                        color: Colors.grey[500]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
