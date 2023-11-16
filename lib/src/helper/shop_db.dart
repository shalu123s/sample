import 'package:pagination_app/src/models/shop.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class ShopDb{
    final dbName ='shopdb';
   static const table = 'shop_table';

  static const shopid = 'id';
  static const shopname = 'name';
  static const shopcategory = 'shopcategory';
  static const shopnumber ='shopnumber';
  static const shopdescription ='shopdescription';

  ShopDb._privateConstructor();
  static ShopDb instance =ShopDb._privateConstructor();
  factory ShopDb()=> instance;

ShopDb.internal();
Future<Database>intiDB()async{
 final dbpath =await getDatabasesPath();
   final path = join(dbpath,dbName);
   return openDatabase(path,version: 1,onCreate: _onCreate,);
}

 Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $shopid INTEGER PRIMARY KEY AUTOINCREMENT,
            $shopname TEXT NOT NULL,
            $shopcategory TEXT NOT NULL,
            $shopnumber TEXT NOT NULL UNIQUE,
            $shopdescription TEXT NOT NULL,
          )
          '''
    );}

  static Database? _database;
  Future<Database?> get shopdatabase async {
    if (_database != null) return _database;
    _database = await intiDB();
    return _database;
  }

Future<int?>insert(Shop shop)async{
Database? db =await instance.shopdatabase;
return await db?.insert(table, {
    shopid : shop.shopid ,
    shopname : shop.shopname ,
    shopcategory : shop.shopcategory ,
    shopnumber : shop.shopnumber,
    shopdescription:shop..shopdescription,
});

}

}