import 'package:pagination_app/src/models/driver.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DriverDb{
    final dbName ='shopdb';
   static const table = 'shop_table';

  static const driverid = 'id';
  static const drivername = 'name';
  static const vehicletype = 'vehicletype';
  static const drivernumber ='drivernumber';
  static const driverdescription ='driverdescription';

  DriverDb._privateConstructor();
  static DriverDb instance =DriverDb._privateConstructor();
  factory DriverDb()=> instance;

DriverDb.internal();
Future<Database>intiDB()async{
 final dbpath =await getDatabasesPath();
   final path = join(dbpath,dbName);
   return openDatabase(path,version: 1,onCreate: _onCreate,);
}

 Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $driverid INTEGER PRIMARY KEY AUTOINCREMENT,
            $drivername TEXT NOT NULL,
            $vehicletype TEXT NOT NULL,
            $drivernumber TEXT NOT NULL UNIQUE,
            $driverdescription TEXT NOT NULL,
          )
          '''
    );}

  static Database? _database;
  Future<Database?> get shopdatabase async {
    if (_database != null) return _database;
    _database = await intiDB();
    return _database;
  }

Future<int?>insert(Driver driver)async{
Database? db =await instance.shopdatabase;
return await db?.insert(table, {
    driverid : driver.driverid ,
    drivername : driver.drivername ,
    vehicletype : driver.vehicletype ,
    drivernumber : driver.drivernumber,
    driverdescription:driver..driverdescription,
});

}

}