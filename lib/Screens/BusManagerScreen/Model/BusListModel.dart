class BusListModel {
  int? id;
  String? name;
  String? busNo;
  int? ownerId;
  int? districtId;
  int? busTypeId;
  int? noOfSeats;
  String? createdAt;
  String? updatedAt;

  BusListModel(
      {this.id,
      this.name,
      this.busNo,
      this.ownerId,
      this.districtId,
      this.busTypeId,
      this.noOfSeats,
      this.createdAt,
      this.updatedAt});

  BusListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    busNo = json['bus_no'];
    ownerId = json['owner_id'];
    districtId = json['district_id'];
    busTypeId = json['bus_type_id'];
    noOfSeats = json['no_of_seats'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['bus_no'] = this.busNo;
    data['owner_id'] = this.ownerId;
    data['district_id'] = this.districtId;
    data['bus_type_id'] = this.busTypeId;
    data['no_of_seats'] = this.noOfSeats;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
