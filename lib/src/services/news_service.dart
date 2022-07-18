import 'package:flutter/material.dart';
import 'package:newsapp/src/api_key/apis_key.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:http/http.dart' as http;


const _baseUrlNews = 'newsapi.org';
const _apiKey = ApisKey.apiNews;


class NewsService extends ChangeNotifier {

  List<Article> headLines = [];

  NewsService(){
    this.getTopHeadLines();
  }

  Future getTopHeadLines() async  {
    print('Cargando Head Lines');

    // Url al cual le voy a pedir la informacion
    final url = Uri.https(_baseUrlNews, '/v2/top-headlines', {
      'apiKey': _apiKey,
      'country': 've'
    });
    final resp = await http.get(url);

    final newsResponce  = NewsResponce.fromJson(resp.body);

    this.headLines.addAll(newsResponce.articles);
    notifyListeners();

    // print(newsResponce.articles[1].content);

  }

}