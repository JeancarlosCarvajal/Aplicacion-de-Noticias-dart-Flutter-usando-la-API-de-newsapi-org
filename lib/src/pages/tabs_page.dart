import 'package:flutter/material.dart';
import 'package:newsapp/src/pages/pages.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
   
  const TabsPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => new _NavegacionModel(),
      child: const Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  const _Navegacion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // context tiene el provider
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    
    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginaActual = i, // tenia print('Soy la pagina: $i')
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined), label: 'Para ti'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Encabezados'),

      ]);
  }
}

class _Paginas extends StatelessWidget {
  const _Paginas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // accedemos al provider
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    // final newsService = Provider.of<NewsService>(context); // para pruebas 

    return PageView( // es parecido al pasar de un libro, como ojear un libro
      // physics: const BouncingScrollPhysics(),
      controller: navegacionModel.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        // Container(// Temporal era para visualizar el widget
        //   color: Colors.red,
        // ),
        Tab1Page(),

        Tab2Page()

      
      ],
    );
  }
}


class _NavegacionModel extends ChangeNotifier {
  int _paginaActual = 0;

  PageController _pageController = new PageController(initialPage: 0);

  int get paginaActual => this._paginaActual;

  set paginaActual( int valor ) {
    // asignamos el valor de la paginacion
    this._paginaActual = valor;
    // accedemos al pagecontroller para cambiar de pagina en el pageView
    _pageController.animateToPage(valor, duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
    // ejecutar el changeNotifier
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}