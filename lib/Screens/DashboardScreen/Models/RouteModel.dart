class RouteModel {
  int? id;
  String? name;
  double? totalDistance;

  RouteModel({this.id, this.name, this.totalDistance});

  RouteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    totalDistance = json['total_distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['total_distance'] = this.totalDistance;
    return data;
  }
}
