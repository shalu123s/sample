import 'dart:core';

class Driver {
  String? driverid;
  String? drivername;
  String? drivercategory;
  String? drivernumber;
  String? driverdescription;

  Driver({
    this.driverid,
    this.drivername,
    this.drivercategory,
    this.drivernumber,
    this.driverdescription,
  });

  Driver.fromMap(Map<String, dynamic> json) {
    Driver(
      driverid: json['driverid'],
      drivername: json['drivername'],
      drivercategory: json['drivercategory'],
      drivernumber: json['drivernumber'],
      driverdescription: json['driverdescription'],
    );
  }

  Map<String, dynamic> toMap() => {
        'driverid': driverid,
        'drivername': drivername,
        'drivercategory': drivercategory,
        'drivernumber': drivernumber,
        'driverdescription': driverdescription,
      };
}
