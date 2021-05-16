import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/helper/video_data.dart';
import 'package:news_app/models/video_model.dart';
import 'package:news_app/views/video_article.dart';
import 'package:news_app/screen/side_menu.dart';


class VideoScreen extends StatefulWidget {
  final String videocategory;
  VideoScreen({this.videocategory});
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  List<VideoModel> articles = [];

  bool _loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    articles = getVideoCateogries();
    print(articles);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News ',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              'App',
              style: TextStyle(
                color: Colors.blue[500],
              ),
            )
          ],
        ),
        elevation: 8,
        actions: [
          Opacity(
            opacity: 0,
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
    body: _loading? Container(
            child: Center(
                  child: CircularProgressIndicator(),
                        ),
                ):
                SingleChildScrollView(
                  child:Container(
                padding: EdgeInsets.only(top: 10),
                          child: ListView.builder(
                            itemCount: articles.length,
                                      shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                   scrollDirection: Axis.vertical,
                                   itemBuilder: (context, index) {
                                    return VideoTile(
                                    imageUrl: articles[index].imageUrl,
                                    videourl: articles[index].videoUrl,
                                    text: articles[index].text,
                                    name: articles[index].name,
                                    );
                             } ,
                          ),
                      ),
                ),
            );
        }
}

class VideoTile extends StatelessWidget {
  final String imageUrl, name, text, videourl;

  VideoTile({this.imageUrl, this.name, this.text, this.videourl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color:Colors.black12,
            blurRadius :6,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => VideoArticle(videoUrl: videourl,)));
        },
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),

                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 400,
                  height: 200,
                  fit: BoxFit.cover,
                )),
              SizedBox(
                height: 5,
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.red[500],
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
