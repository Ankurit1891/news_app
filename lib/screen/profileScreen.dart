import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screen/new_profile.dart';
import 'side_menu.dart';
class Profile extends StatelessWidget {
  Widget textField({String mainText,String label})
  {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape:RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(fontSize: 18,color: Colors.grey[800],fontWeight: FontWeight.w600,),
          fillColor: Colors.white30 ,
          filled: true,
          border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,

          )
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey[800],
        toolbarHeight: 50,
        actions: [
          Opacity(
            opacity: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child:GestureDetector(
                onTap: ()
                {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>NewProfile()));
                },
                child: Icon(Icons.edit,color: Colors.black87,
                ),
              ),),
          )
        ],
        ),
      drawer: SideMenu(),
      body:Stack(
        alignment: Alignment.center,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 430,
              width: double.infinity,
              margin:EdgeInsets.symmetric(horizontal:30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  textField(label: "Padumbasan Tamluk,WestBengal",),
                  textField(label: "721636"),
                  textField(label: "18-07-2000"),
                  textField(label: "Male"),
                  textField(label: "8972554848"),
                  textField(label: "ankuritbhakta1891@gmail.com"),
                ],
              ),
            )
          ],
          ),
          CustomPaint(
            child:Container(
              width: 500,
              height: 1500,
            ),
            painter:HeaderCurvedContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(5),
              child:Text('Ankurit',style:TextStyle(fontSize: 25,color:Colors.white
              ,fontWeight: FontWeight.w600),),),
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width/3,
              height: MediaQuery.of(context).size.width/3,
              decoration: BoxDecoration(
                border:Border.all(color:Colors.white),
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                  fit:BoxFit.cover,
                  image: NetworkImage('https://wallpapercave.com/wp/wp6819293.jpg'),
                )
              ),
            )

            ],
          ),

        ],
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter{

  @override
  void paint(Canvas canvas ,Size size){
    Paint paint=Paint()..color=Colors.grey[800];
    Path path=Path()..relativeLineTo(0,70)..quadraticBezierTo(size.width/2,225,size.width,70  )..relativeLineTo(0,-150)..close();
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate)=>false;
}
