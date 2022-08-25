import 'package:flutter/material.dart';
import 'package:newsapp/src/pages/pages.dart';
import 'package:newsapp/src/providers/providers.dart';
import 'package:newsapp/src/share_preferences/preferences.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
   
  const TabsPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => ProviderPageController(),
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
    final navegacionModel = Provider.of<ProviderPageController>(context);
    
    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginaActual = i, // tenia print('Soy la pagina: $i')
      items: [

        const BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined), label: 'For you'),

        const BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Headers'),

        BottomNavigationBarItem(
          label: 'Country',
          icon: FadeInImage(
            width: 45,
            placeholder: const AssetImage('assets/img/giphy.gif'), 
            image: NetworkImage('https://healthybelleza.com/img/banderas_png/${Preferences.getFlag}.png'),
            imageErrorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
              return const Image(image: AssetImage('assets/img/no-image.png'));
            }
          ),
        ),

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
    final navegacionModel = Provider.of<ProviderPageController>(context);
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

        Tab2Page(),

        UserCountry(), 
      
      ],
    );
  }
}
