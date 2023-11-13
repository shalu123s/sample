import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
  final dbName ='localdb';
  
  Future<Database> intiDB()async{
   final dbpath =await getDatabasesPath();
   final path = join(dbpath,dbName);
   return openDatabase(path,version: 1,onCreate: (db, version) { },);
  }

}