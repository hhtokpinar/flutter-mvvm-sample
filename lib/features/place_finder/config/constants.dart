class ConstantsPlaceFinder {
  static const String googleMapAPIKey = 'AIzaSyACIQrlFNbXrFlr_6YVWAGHF2D1Ii9PoHw';
  static String googleNearbySearchUrl(String keyword, double lat, double longt) =>
      'https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=$keyword&location=$lat%2C$longt&radius=1500&type=restaurant&key=$googleMapAPIKey';
}
