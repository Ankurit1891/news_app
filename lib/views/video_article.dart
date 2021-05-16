import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class VideoArticle extends StatefulWidget {
  final String videoUrl;
  VideoArticle({this.videoUrl});
  @override
  _VideoArticleState createState() => _VideoArticleState();
}

class _VideoArticleState extends State<VideoArticle>  {
  final Completer<WebViewController> _completer= Completer<WebViewController>();
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
              child:Icon(Icons.save),),
          )
        ],
        elevation: 0.0,
      ),
      body: Container(
          child:WebView(
            initialUrl: widget.videoUrl,
            onWebViewCreated: ((WebViewController webViewController)
            {
              _completer.complete(webViewController);
            }),
          )
      ),
    );
  }
}
