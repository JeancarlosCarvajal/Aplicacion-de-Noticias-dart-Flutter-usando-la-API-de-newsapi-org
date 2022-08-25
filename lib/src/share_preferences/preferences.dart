// puedes usar esto en todos los proyectos 
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {

  // el Static es para no instancias
 
  // late es para decirle a flutter que cuando la vaya a usar ya debe estar inicializada
  static late SharedPreferences _prefs;
 
  // en todo momento luego de haber llamado al init() vamos a tener acceso al name, isDarkMode, gender
  static Future init() async {
    // Obtain shared preferences.
    _prefs = await SharedPreferences.getInstance();
  }

  //Trabajar con getter y setters para guardar las preferencias 
 
  // no quiero que se instancie la instancia por eso es static
  static String get getCountry {
    // Save an String value to 'action' key.
    return _prefs.getString('language') ?? 'us';
  }

  // modificamos la preferencia
  static set setCountry (String language) {
    // guardamos el valor de name en las preferencias del paquete
    _prefs.setString('language', language); 
  }
 
  // no quiero que se instancie la instancia por eso es static
  static String get getFlag {
    // Save an String value to 'action' key.
    return _prefs.getString('flag') ?? 'USD';
  }

  // modificamos la preferencia
  static set setFlag (String flag) {
    // guardamos el valor de name en las preferencias del paquete
    _prefs.setString('flag', flag); 
  }
 
  // no quiero que se instancie la instancia por eso es static
  static bool get getDarkMode {
    // Save an String value to 'action' key.
    // final bool? repeat = _prefs.getBool('repeat');
    return _prefs.getBool('darkMode') ?? false;
  }

  // modificamos la preferencia
  static set setDarkMode (bool value) { 
    // guardamos el valor de name en las preferencias del paquete
    _prefs.setBool('darkMode', value); 
  }
  
  
}