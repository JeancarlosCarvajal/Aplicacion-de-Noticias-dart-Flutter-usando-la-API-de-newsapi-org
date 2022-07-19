import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/src/api_key/apis_key.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:http/http.dart' as http; 


const _baseUrlNews = 'newsapi.org';
const _apiKey = ApisKey.apiNews;


class NewsService extends ChangeNotifier {

  List<Article> headLines = [];

  String _selectectedCategory = 'business';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  // para almacenar las categorias parecido al token de imagen minada en NFTLatinoAmerica.com para evitar plagio
  Map<String, List<Article>> categoryArticles = {};

  // Categorias de las Noticias... https://newsapi.org/docs/endpoints/top-headlines
  // business entertainment general health science sports technology 

  NewsService(){
    this.getTopHeadLines();

    // barrer categorias para agregar la llave del mapa y tenerlo listo para recibir la lista de articulos
    categories.forEach((item) {
      this.categoryArticles[item.name] = []; // tambien se puede usar new List.empty()
    });
  }

  get selectectedCategory => this._selectectedCategory;
  set setCategory( String valor ) {
    this._selectectedCategory = valor;
    // llamamos a la API
    this.getArticlesByCategory(valor);
    notifyListeners();
  }

  // crear unn getter para obtener la Lista de las categorias seleccionadas
  List<Article>? get getArticulosCategoriaSeleccionada => this.categoryArticles[this.selectectedCategory];


  Future getTopHeadLines() async  {
    print('Cargando Head Lines');

    // Url al cual le voy a pedir la informacion
    final url = Uri.https(_baseUrlNews, '/v2/top-headlines', {
      'apiKey': _apiKey,
      'country': 'us'
    });
    final resp = await http.get(url);

    final newsResponce  = NewsResponce.fromJson(resp.body);

    this.headLines.addAll(newsResponce.articles);
    notifyListeners();

    // print(newsResponce.articles[1].content);
  }


  Future getArticlesByCategory(String category) async {
    print('Cargando categoria: $category');

    // evita volver a llamar la Api en caso que ya tenga las categorias almacenadas en el mapa
    if(!categoryArticles[category]!.isEmpty){
      print('Ya he cargado ${categoryArticles[category]!.length} articulos en la Categoria');
      return this.categoryArticles[category];
    }
    print('Tengo ${categoryArticles[category]!.length} articulos en esta Categoria');

    // Url al cual le voy a pedir la informacion
    final url = Uri.https(_baseUrlNews, '/v2/top-headlines', {
      'apiKey': _apiKey,
      'country': 'us',
      'category': category,
    });
    final resp = await http.get(url);

    final newsResponce  = NewsResponce.fromJson(resp.body);

    print(newsResponce.articles[0].title);

    // agregamos las categorias al mapa de categorias inicializado en el constructor
    this.categoryArticles[category]?.addAll(newsResponce.articles);

    notifyListeners();
  }
}