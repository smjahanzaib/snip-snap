class ChartData {
  int earning;
  String date;
  String day;

  ChartData();

  ChartData.fromJson(Map<String, dynamic> json) {
    try {
      earning = int.parse((json['earning'] ?? 0).toString());
      date = (json['date'] ?? '').toString();
      day = (json['day'] ?? '').toString();
    } catch (e) {
      print("Exception - chartDataModel.dart - ChartDataModel.fromJson():" +
          e.toString());
    }
  }
}
