import 'package:flutter/material.dart';
import 'package:news_app/screen/video_screen.dart';
import 'package:news_app/views/home.dart';
import 'package:news_app/screen/profileScreen.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.black,
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage('https://wallpapercave.com/wp/wp6819293.jpg'),
                        fit:BoxFit.fill,
                      ),
                    ),
                  ),
                  Text('Ankurit',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w600),),
                  Text('ankuritbhakta1891@gmail.com',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home',style: TextStyle(fontSize: 18),),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (Context)=>Home()));
            },
          ),
          Divider(
            height: 5,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile',style: TextStyle(fontSize: 18),),
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Profile()));
            },

          ),
          Divider(
            height: 5,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            leading: Icon(Icons.video_collection),
            title: Text('Videos',style: TextStyle(fontSize: 18),),
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (Context)=>VideoScreen()));
            },

          ),
          Divider(
            height: 5,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
        ],
      ),
    );
  }
}
