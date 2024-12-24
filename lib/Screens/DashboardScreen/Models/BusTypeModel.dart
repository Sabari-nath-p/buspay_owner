class BusTypeModel {
  int? id;
  String? type;
  String? minimumFare;
  String? minimumKilometer;
  String? farePerKilometer;

  BusTypeModel(
      {this.id,
      this.type,
      this.minimumFare,
      this.minimumKilometer,
      this.farePerKilometer});

  BusTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    minimumFare = json['minimum_fare'];
    minimumKilometer = json['minimum_kilometer'];
    farePerKilometer = json['fare_per_kilometer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['minimum_fare'] = this.minimumFare;
    data['minimum_kilometer'] = this.minimumKilometer;
    data['fare_per_kilometer'] = this.farePerKilometer;
    return data;
  }
}
