import 'dart:core';

class Driver {
  String? driverid;
  String? drivername;
  String? vehicletype;
  String? drivernumber;
  String? driverdescription;

  Driver({
    this.driverid,
    this.drivername,
    this.vehicletype,
    this.drivernumber,
    this.driverdescription,
  });

  Driver.fromMap(Map<String, dynamic> json) {
    Driver(
      driverid: json['driverid'],
      drivername: json['drivername'],
      vehicletype: json['vehicletype'],
      drivernumber: json['drivernumber'],
      driverdescription: json['driverdescription'],
    );
  }

  Map<String, dynamic> toMap() => {
        'driverid': driverid,
        'drivername': drivername,
        'vehicletype': vehicletype,
        'drivernumber': drivernumber,
        'driverdescription': driverdescription,
      };
}
