import 'dart:convert';

import 'package:news_app/models/article_modal.dart';
import 'package:http/http.dart' as http;
class News
{
  List<ArticleModel> news=[];

  Future<void>  getNews()async
  {
    String url='https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=ffa3a7ae430b43b683ecdccd030cb453';
    var response=await http.get(url);
    var jsondata=jsonDecode(response.body);
    if(jsondata['status']=='ok')
      {
        jsondata['articles'].forEach((element){
          if(element['urlToImage']!=null && element['description']!=null)
            {
              ArticleModel articalModel=ArticleModel(
                title: element['title'],
                author: element['author'],
                description: element['description'],
                url:element['url'],
                urlToImage: element['urlToImage'],
                content: element['context']
              );
              news.add(articalModel);
             }
        });
      }
  }

}

class CategoryNewsClass
{
  List<ArticleModel> news=[];

  Future<void>  getNews(String category)async
  {
    String url='https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=ffa3a7ae430b43b683ecdccd030cb453';
    var response=await http.get(url);
    var jsondata=jsonDecode(response.body);
    if(jsondata['status']=='ok')
    {
      jsondata['articles'].forEach((element){
        if(element['urlToImage']!=null && element['description']!=null)
        {
          ArticleModel articalModel=ArticleModel(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              url:element['url'],
              urlToImage: element['urlToImage'],
              content: element['context']
          );
          news.add(articalModel);
        }
      });
    }
  }

}