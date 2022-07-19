import 'package:flutter/material.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget { // lo gransforme en un statefull para mantener el estado
   
  const Tab1Page({Key? key}) : super(key: key);

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

// AutomaticKeepAliveClientMixin se uso para poder mantener el estado de scroll de este widget
class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {

    final headLines = Provider.of<NewsService>(context).headLines;
    // newsService.headLines

    return Scaffold(
      body: (headLines.isEmpty)
      ? const Center(
        child: CircularProgressIndicator(),
      ) : ListaNoticias(noticias: headLines)
    );
  }
  
  @override
  //  implement wantKeepAlive
  // seteo en  => true para que siempre mantenga el estado no quiero cambiarlo
  bool get wantKeepAlive => true;
}