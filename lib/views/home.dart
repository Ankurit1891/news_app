import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/models/article_modal.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/helper/news.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/screen/side_menu.dart';
import 'package:news_app/views/article.dart';
import 'package:news_app/views/category.dart';

import 'package:news_app/screen/side_menu.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCateogries();
    print(categories);
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
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
      drawer: SideMenu(),    /////-------------------->sidemenu
      body: _loading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(

                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    //categories------------>
                    Container(
                      height: 70,
                      child: ListView.builder(
                        itemCount: categories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            imageUrl: categories[index].imageUrl,
                            categoryName: categories[index].categoryName,
                          );
                        },
                      ),
                    ),
                    //BLOG------------------->
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: ListView.builder(
                          itemCount: articles.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return BlogTile(
                              imageUrl: articles[index].urlToImage,
                              title: articles[index].title,
                              desc: articles[index].description,
                              url: articles[index].url,
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Catergory(category: categoryName.toString().toLowerCase(),)),);
      },
      child: Container(
        margin: EdgeInsets.only(right: 16,top: 10),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 100,
                  height: 60,
                  fit: BoxFit.cover,
                )),
            Container(
              width: 100,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.black26,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                  child: Text(
                    categoryName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),

            // Text(imageUrl),
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;

  BlogTile({this.imageUrl, this.title, this.desc, this.url});

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
              MaterialPageRoute(builder: (context) => Article(blogUrl: url)));
        },
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                desc,
                style: TextStyle(fontSize: 17, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
