




class CountriesLanguages {

  // Paises por codigo
  // ae ar at au be bg br ca ch cn co cu cz de eg fr gb gr hk hu id ie il in it jp kr lt lv ma mx my ng nl no nz ph pl pt ro rs ru sa se sg si sk th tr tw ua us ve za 
  final Map<String, List> contryNames = {
    'United Arab Emirates': ['ae', 'AED'], 
    'Argentina': ['ar', 'ARS'], 
    'Austria': ['at', 'ATS'], 
    'Australia': ['au', 'AUD'], 
    'Belgium': ['be', 'BEF'], 
    'Bulgaria': ['bg', 'BGN'], 
    'Brazil': ['br', 'BRL'], 
    'Canada': ['ca', 'CAD'], 
    'Chile': ['ch', 'CLP'], 
    'China': ['cn', 'CNY'], 
    'Colombia': ['co', 'COP'], 
    'Cuba': ['cu', 'CUC'], 
    'Czech Republic': ['cz', 'CZK'], 
    'Germany': ['de', 'DEM'], 
    'Egypt': ['eg', 'EGP'], 
    'France': ['fr', 'FRF'], 
    'United Kingdom': ['gb', 'GBP'], 
    'Grecia': ['gr', 'GRD'], 
    'Hong Kong': ['hk', 'HKD'], 
    'Hungary': ['hu', 'HUF'], 
    'Indonesia': ['id', 'IDR'], 
    'Ireland': ['ie', 'IRL'], 
    'Israel': ['il', 'ILS'], 
    'India': ['in', 'INR'], 
    'Italy': ['it', 'ITL'], 
    'Japan': ['jp', 'JPY'], 
    'South Korea': ['kr', 'KRW'], 
    'Lithuania': ['lt', 'LTL'], 
    'Latvia': ['lv', 'LTV'], 
    'Marocco': ['ma', 'MAD'], 
    'Mexico': ['mx', 'MXN'], 
    'Malaysia': ['my', 'MYR'], 
    'Nigeria': ['ng', 'NGN'], 
    'Netherlands': ['nl', 'NLD'], 
    'Norway': ['no', 'NOK'], 
    'New Zealand': ['nz', 'NZD'], 
    'Philippines': ['ph', 'PHP'], 
    'Poland': ['pl', 'PLN'], 
    'Portugal': ['pt', 'PTG'], 
    'Romania': ['ro', 'RON'], 
    'Serbia': ['rs', 'RSD'], 
    'Russia': ['ru', 'RUB'], 
    'Saudi Arabia': ['sa', 'SAR'], 
    'Swedn': ['se', 'SEK'], 
    'Singapore': ['sg', 'SGD'], 
    'Slovenia': ['si', 'SLV'], 
    'Slovakia': ['sk', 'SLQ'], 
    'Thailand': ['th', 'THB'], 
    'Turkey': ['tr', 'TRY'], 
    'Taiwan': ['tw', 'TWD'], 
    'Ukraine': ['ua', 'UAH'], 
    'United States': ['us', 'USD'], 
    'Venezuela': ['ve', 'VES'], 
    'South Africa': ['za', 'SAR']
  };
    
  // lenguajes por codigo
  // ar de en es fr he it nl no pt ru sv ud zh
  final Map<String, String> languajesNames = {
    'Arabic': 'ar', 
    'German': 'de', 
    'English': 'en', 
    'Espanish': 'es', 
    'French': 'fr', 
    'Hebrew': 'he', 
    'Italian': 'it', 
    'Dutch': 'nl', 
    'Norway': 'no', 
    'Portuguese': 'pt', 
    'Russian': 'ru', 
    'Swedish': 'sv',
    'Chinese': 'zh', 
  };

  CountriesLanguages({
    Map<String, String>? contryNames,
    Map<String, String>? languajesNames
  });

  List contryNamesList(){
    final maptoList = [];
    contryNames.forEach((k, v) => maptoList.add([k, v]));
    return maptoList;
  }

  List languajesNamesList() {
    final maptoList = [];
    contryNames.forEach((k, v) => maptoList.add([k, v]));
    return maptoList;
  }

}