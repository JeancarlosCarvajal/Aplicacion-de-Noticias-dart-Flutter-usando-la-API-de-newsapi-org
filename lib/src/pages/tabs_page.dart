import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
   
  const TabsPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => new _NavegacionModel(),
      child: Scaffold(
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
      items: [
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

    return PageView( // es parecido al pasar de un libro, como ojear un libro
      // physics: const BouncingScrollPhysics(),
      controller: navegacionModel.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [

        Container(
          color: Colors.red,
        ),


        Container(
          color: Colors.green,
        )


      
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