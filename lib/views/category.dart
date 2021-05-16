import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_modal.dart';
import 'article.dart';

class Catergory extends StatefulWidget {
  final String category;
  Catergory({this.category});
  @override
  _CatergoryState createState() => _CatergoryState();
}

class _CatergoryState extends State<Catergory> {
  bool _loading=true;
  List<ArticleModel> articles=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }
  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
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
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.save),),
          )
        ],
        elevation: 0.0,
      ),
      body: _loading
          ? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ) :SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 16),
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
              },
          ),
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
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Article(blogUrl: url)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                imageUrl,
              ),
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
    );
  }
}