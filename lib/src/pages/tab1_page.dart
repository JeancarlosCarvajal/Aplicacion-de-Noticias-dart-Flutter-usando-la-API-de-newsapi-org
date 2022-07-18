import 'package:flutter/material.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
   
  const Tab1Page({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final headLines = Provider.of<NewsService>(context).headLines;
    // newsService.headLines

    return Scaffold(
      body: ListaNoticias(noticias: headLines),
    );
  }
}