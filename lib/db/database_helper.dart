import 'dart:io';

import 'package:sbbwu_session14_sqlite/models/product.dart';
import 'package:sbbwu_session14_sqlite/utility/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';


class DatabaseHelper {

  // database
  DatabaseHelper._privateConstructor(); // Name constructor to create instance of database
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  // getter for database

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS
    // to store database

    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}/sbbwu.db';

    // open/ create database at a given path
    var shoppingDB = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );

    return shoppingDB;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('''Create TABLE $tableProducts (
                  $colId INTEGER PRIMARY KEY AUTOINCREMENT,
                  $colTitle TEXT,
                  $colBrand TEXT UNIQUE,
                  $colPrice TEXT,
                  $colColor TEXT,
                  $colSize TEXT
                   ); ''');

  }

  Future<int> saveProduct(Product product ) async {

    // Logic for saving data to table
    Database db = await instance.database;

    int result = await db.insert(tableProducts, product.toMap());

    return result;
  }

  Future<List<Product>> getAllProducts() async {

    List<Product> list = [];

    Database db = await instance.database;

   List<Map<String,dynamic>> listMaps = await db.rawQuery('SELECT * from $tableProducts');

   for( var map in listMaps){

     Product product = Product.fromMap(map);
     list.add(product);
   }

   await Future.delayed(const Duration(seconds: 3));
   return list;
  }
}