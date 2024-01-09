class AppData {

  static const baseUrl = "https://1a71-103-16-68-202.ngrok-free.app";
  static const List<String> filterOptions = ["ratings", "bed availability", "distance with in km", "services"];
  static const List<String> hospitalField = ["ratings", "beds", "distance", "services"];
  static const Map<String, int> mapFilterOptions = {
    "ratings" : 1,
    "beds": 2,
    "distance" : 3,
    "services" : 2
  };
  static const List<String> beds = ["ICU", "Manual", "Fowler", "Electric", "Prana Electric ICU", "Hospital", "Low"];
  static const List<String> ratings = ["1", "2", "3", "4", "5"];
  static const List<String> distance = ['5', '10', '20', '50', 'Any'];
  static const List<String> services = ['Financial Aid', 'Blood bank', 'Wheelchair-accessible entrance'];
}
