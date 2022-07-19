import 'package:flutter/material.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
   
  const Tab2Page({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    // esta loista newsService.getArticulosCategoriaSeleccionada nunca va venir vacia
    // excepto cuando es el primer movimiento a esta pantalla en "business" donde alli no se ha llamado a getArticlesByCategory()
    // por esa razon es que hago este condicional debajo
    if(newsService.getArticulosCategoriaSeleccionada!.isEmpty){
      newsService.getArticlesByCategory(newsService.selectectedCategory!);
    }

    return SafeArea(
      child: Scaffold(
        body: (newsService.getArticulosCategoriaSeleccionada!.isEmpty)
          ? const Center(
            child: CircularProgressIndicator(),
          ) 
          : Column(
          children: [

            _ListaCategorias(), 

            Expanded(child: ListaNoticias(noticias: newsService.getArticulosCategoriaSeleccionada!))

          ],
        ),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  const _ListaCategorias({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    // pares que tiene el icono y el texto
    final newsService = Provider.of<NewsService>(context);
    final categories = newsService.categories;
    return Container(
      width: double.infinity,
      height: 80,
      // color: Colors.red, // para pruebas
      child: ListView.builder(
        physics: const BouncingScrollPhysics(), // para que se vea bien en android IOS de igual forma
        scrollDirection: Axis.horizontal, 
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index){
          final cName = categories[index].name;
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                _CategoryButton(categoria: categories[index]),
                const SizedBox(height: 5),
                Text(
                  '${cName[0].toUpperCase()}${cName.substring(1)}',
                  style: TextStyle(color: categories[index].name == newsService.selectectedCategory 
                    ? Colors.red[400] 
                    : Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  
  final Category categoria;

  const _CategoryButton({
    Key? key,
    required this.categoria,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // print('Hola Mundo. Soy Categoria: ${categoria.name}');
    final newsService = Provider.of<NewsService>(context, listen: false);
    return GestureDetector(
      onTap: (){
        // seteamos el valor de la categoria para que llame nuestra api y use el setter
        newsService.setCategory = categoria.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          categoria.icon,
          color: categoria.name == newsService.selectectedCategory 
            ? Colors.red 
            : Colors.black54,
        ),
      ),
    );
  }
}