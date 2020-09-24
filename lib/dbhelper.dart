import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Databasehelper {
  static final _databasename = "cosefi.db";
  static final _databaseversion = 1;

  static final tabla = "usuarios";

  static final columnID = "id";
  static final columNombre = "nombre";
  static final columnEdad = "edad";

  static Database _database;

  Databasehelper._privateConstructor();
  static final Databasehelper instance = Databasehelper._privateConstructor();

  Future<Database> get database async {
    print('Pasando por get database');
    //Si la base de datos ya existe retorna la db
    if (_database != null) return _database;

    //De no existir la base de datos entonces procede a su creación.
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    print('Pasando por _initDatabase');
    Directory documentdirectory = await getApplicationDocumentsDirectory();
    //var path2 = documentdirectory.path;
    String path = join(documentdirectory.path, _databasename);
    return await openDatabase(path,
        version: _databaseversion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
 CREATE TABLE $tabla 
    (
          $columnID INTEGER PRIMARY KEY,
          $columNombre  TEXT NOT NULL,
          $columnEdad INTEGER NOT NULL 
    )

''');
  }

  // functions to insert, query , update and delete
  //Insertar registro
  Future<int> insert(Map<String, dynamic> row) async {
    // try {
    Database db = await instance.database;
    return await db.insert(tabla, row);
    // } catch (e) {
    //  print('Metodo:dbhelper.dart--insert ||' + e.toString());
    // }
  }

//Consulta para todos los registros
  Future<List<Map<String, dynamic>>> queryall() async {
    try {
      Database db = await instance.database;
      return await db.query(tabla);
    } catch (e) {
      print('Metodo:dbhelper.dart--queryall ||' + e.toString());
    }
  }

  Future<List<Map<String, dynamic>>> queryspecific(int edad) async {
    try {
      Database db = await instance.database;
      var res = await db.query(tabla, where: "edad=?", whereArgs: [edad]);
      return res;
    } catch (e) {
      print('Metodo:dbhelper.dart--queryspecific ||' + e.toString());
    }
  }

  Future<int> deletedata(int edad) async {
    Database db = await instance.database;
    var res = await db.delete(tabla, where: "edad = ?", whereArgs: [edad]);

    return res;
  }

  Future<int> updatedata(int id) async {
    Database db = await instance.database;
    // var res = await db.update(tabla, {"nombre": "ramon"}, whereArgs: [id]);
    String sql = "UPDATE usuarios set nombre='" + "ramon' where edad=20";
    print(sql);
    db.execute(sql);

    return 1;
  }

  Future<String> borrarBaseDeDatos() async {
    Directory documentdirectory = await getApplicationDocumentsDirectory();
    //var path2 = documentdirectory.path;
    String path = join(documentdirectory.path, _databasename);
    // Database db = await instance.database;
    await deleteDatabase(path);
    return "Base de datos eliminada!!!";
  }
}
