import 'package:flutter/material.dart';
import 'package:newsapp/src/api_key/apis_key.dart';
import 'package:newsapp/src/models/news_models.dart';





class NewsService extends ChangeNotifier {

  final String apiKey = ApisKey.apiNews;

  List<Article> headLines = [];

  NewsService(){
    this.getTopHeadLines();
  }

  getTopHeadLines() {
    print('Cargando');
  }

}