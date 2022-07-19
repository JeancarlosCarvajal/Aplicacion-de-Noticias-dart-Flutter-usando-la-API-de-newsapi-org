import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart'; 
import 'package:newsapp/src/theme/tema.dart'; 


class ListaNoticias extends StatelessWidget {

  final List<Article> noticias;
   
  const ListaNoticias({
    Key? key, 
    required this.noticias
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(), // para que se vea bien en android IOS de igual forma
      scrollDirection: Axis.vertical, // sino agrego esto me da este error = "Vertical viewport was given unbounded height"
      shrinkWrap: true, // sino agrego esto me da este error = "Vertical viewport was given unbounded height"
      itemCount: noticias.length,
      itemBuilder: (BuildContext context, int index){

        return _Noticia(noticia: this.noticias[index], index: index);

      }
    );
  }
}


class _Noticia extends StatelessWidget {

  final Article noticia;
  final int index;

  const _Noticia({
    Key? key, 
    required this.noticia, 
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) { 

    // print('Aqui esta la del error: $index');
    return Column(
      children: [

        _TarjetaTopBar(noticia: noticia, index: index),

        _TarjetaTitulo(noticia: noticia),

        _TarjetaImagen(noticia: noticia),

        _TarjetaBody(noticia: noticia),

        const Divider(height: 10),

        _TarjetaBotones()

      ],
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
 
  const _TarjetaBotones({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: (){},
            fillColor: AppTheme.primary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.star_border),
          ),
          const SizedBox(width: 10),
          RawMaterialButton(
            onPressed: (){},
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.more),
          )
        ],
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  final Article noticia;

  const _TarjetaBody({
    Key? key, 
    required this.noticia,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(noticia.description ?? ''),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {

  final Article noticia;
 
  const _TarjetaImagen({
    Key? key, 
    required this.noticia,  
  }) : super(key: key);


  @override
  Widget build(BuildContext context) { 
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          child: (noticia.urlToImage != null) 
          ? FadeInImage( 
            placeholder: const AssetImage('assets/img/giphy.gif'),
            image: NetworkImage(noticia.urlToImage!),
            imageErrorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
              // print('Error en URL: ${noticia.urlToImage}');
              return const Image(image: AssetImage('assets/img/no-image.png'));
            }
          ) : const Image(image: AssetImage('assets/img/no-image.png'))
        ),
      ),
    ); 
  }
}
 

class _TarjetaTitulo extends StatelessWidget {
  
  final Article noticia;

  const _TarjetaTitulo({
    Key? key, 
    required this.noticia,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(noticia.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {

  final Article noticia;
  final int index;

  const _TarjetaTopBar({
    Key? key, 
    required this.noticia, 
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${index + 1}. ', style: const TextStyle(color: AppTheme.primary)),
          Text('${noticia.source.name}. '),
        ],
      ),
    );
  }
}