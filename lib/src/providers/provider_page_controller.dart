import 'package:flutter/material.dart';

class ProviderPageController extends ChangeNotifier {
  int _paginaActual = 0;

  final PageController _pageController = PageController(initialPage: 0);

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