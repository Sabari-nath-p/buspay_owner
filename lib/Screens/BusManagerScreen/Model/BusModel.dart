class BusModel {
  int? id;
  String? name;
  String? busNo;
  int? ownerId;
  int? districtId;
  int? busTypeId;
  int? noOfSeats;
  List<Conductors>? conductors;
  List<RouteBus>? routeBus;
  Conductors? owner;

  BusModel(
      {this.id,
      this.name,
      this.busNo,
      this.ownerId,
      this.districtId,
      this.busTypeId,
      this.noOfSeats,
      this.conductors,
      this.routeBus,
      this.owner});

  BusModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    busNo = json['bus_no'];
    ownerId = json['owner_id'];
    districtId = json['district_id'];
    busTypeId = json['bus_type_id'];
    noOfSeats = json['no_of_seats'];
    if (json['conductors'] != null) {
      conductors = <Conductors>[];
      json['conductors'].forEach((v) {
        conductors!.add(new Conductors.fromJson(v));
      });
    }
    if (json['routeBus'] != null) {
      routeBus = <RouteBus>[];
      json['routeBus'].forEach((v) {
        routeBus!.add(new RouteBus.fromJson(v));
      });
    }
    owner =
        json['owner'] != null ? new Conductors.fromJson(json['owner']) : null;
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
    if (this.conductors != null) {
      data['conductors'] = this.conductors!.map((v) => v.toJson()).toList();
    }
    if (this.routeBus != null) {
      data['routeBus'] = this.routeBus!.map((v) => v.toJson()).toList();
    }
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    return data;
  }
}

class Conductors {
  int? id;
  String? name;
  String? phone;
  String? status;
  String? email;

  Conductors({this.id, this.name, this.phone, this.status, this.email});

  Conductors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    status = json['status'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['status'] = this.status;
    data['email'] = this.email;
    return data;
  }
}

class RouteBus {
  int? id;
  int? busId;
  int? routeId;
  String? startTiming;
  List<String>? daysOfWeek;
  String? finishTiming;

  RouteBus(
      {this.id,
      this.busId,
      this.routeId,
      this.startTiming,
      this.daysOfWeek,
      this.finishTiming});

  RouteBus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    busId = json['bus_id'];
    routeId = json['route_id'];
    startTiming = json['start_timing'];
    daysOfWeek = json['days_of_week'].cast<String>();
    finishTiming = json['finish_timing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bus_id'] = this.busId;
    data['route_id'] = this.routeId;
    data['start_timing'] = this.startTiming;
    data['days_of_week'] = this.daysOfWeek;
    data['finish_timing'] = this.finishTiming;
    return data;
  }
}
