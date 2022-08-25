import 'package:flutter/material.dart';
import 'package:newsapp/src/data/data.dart';
import 'package:newsapp/src/pages/pages.dart';
import 'package:newsapp/src/providers/provider_page_controller.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/share_preferences/preferences.dart';
import 'package:provider/provider.dart';


class UserCountry extends StatelessWidget {
  const UserCountry({
    Key? key, 
  }) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    final data = CountriesLanguages(); 
    final languageListNames = data.languajesNamesList();   
    // print(languageListNames);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Divider(thickness: 3,),
              Container(
                padding: const EdgeInsets.only(top: 9),
                height: 40,
                child: const Text('Select country', style: TextStyle(fontSize: 17),)
              ),
              const Divider(thickness: 3,),
              SizedBox(
                height: size.height-130,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: languageListNames.length,
                  itemBuilder: (BuildContext context, int index) { 
                    final lang = languageListNames[index];
                    final country = lang[0];
                    final langCode = lang[1][0];
                    final flagCode = lang[1][1];
                    // final flagCode = 'DEM';
                    return MaterialButton(
                      child: Column(
                        children: [
                          ListTile(
                            leading: FadeInImage(
                              width: 50,
                              placeholder: const AssetImage('assets/img/giphy.gif'), 
                              image: NetworkImage('https://healthybelleza.com/img/banderas_png/$flagCode.png'),
                              imageErrorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                return const Image(image: AssetImage('assets/img/no-image.png'));
                              }
                            ),
                            title: Text( '$country' ),
                          ),
                          const Divider(thickness: 3)
                        ], 
                      ),
                      onPressed: () { 
                        print('jean: Codigo $langCode');
                        final navegacionModel = Provider.of<ProviderPageController>(context, listen: false);
                        navegacionModel.paginaActual = 0; 
                        Preferences.setCountry = langCode;
                        Preferences.setFlag = flagCode; 
                        // Navigator.pushNamed(context, 'main');

                        // TODO: llamo al newService
                        final newsService = Provider.of<NewsService>(context, listen: false); 
                        // TODO: Limpio los headLines
                        newsService.headLines = [];


                        // TODO: Limpio las Categorias

                      
                        
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}