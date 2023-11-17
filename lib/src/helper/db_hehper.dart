import 'package:pagination_app/src/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{

  final dbName ='localdb';
   static const table = 'user_table';

  static const columnId = 'id';
  static const columnUser = 'user';
  static const columnPass = 'password';

    DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  factory DatabaseHelper() => instance;

  DatabaseHelper.internal();
  Future<Database> intiDB()async{
   final dbpath =await getDatabasesPath();
   final path = join(dbpath,dbName);
   return openDatabase(path,version: 1,onCreate: _onCreate,);
  }
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnUser TEXT NOT NULL,
            $columnPass TEXT NOT NULL,
          )
          '''
    );}

    static Database? _database;
  Future<Database?> get userdatabase async {
    if (_database != null) return _database;
    _database = await intiDB();
    return _database;
  }

Future<int?>insert(User user)async{
Database? db =await instance.userdatabase;
return await db?.insert(table, {
columnUser:user.usrname,
columnPass:user.usrpass,
});

}

}