class AppApi {
  // Base URL
  static const String baseUrl = 'https://www.bme.seawindsolution.ae/api/f/';

  // City Endpoints
  static const String getCity = '${baseUrl}city/';

  // Country Endpoints
  static const String getCountry = '${baseUrl}country';

// Category Endpoints
  static const String getCategories = '${baseUrl}category';

  // Slider Endpoints
  static const String getSliders = '${baseUrl}slider';

  // Event Endpoints
  static const String getEvents = '${baseUrl}home/type/events/';
}
