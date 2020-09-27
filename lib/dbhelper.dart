import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Databasehelper {
  static final _databasename = "cosefi.db";
  static final _databaseversion = 1;

//--------------------------------------------------------------------
  static final tblUsuarios = "usuarios"; //TABLA
  static final columnIdInstitucionU = "idInstitucion"; //int
  static final columnNombreU = "nombre"; //TEXT
  static final columnApellidoU = "apellido"; //TEXT
  static final columnUsuarioU = "usuario"; //TEXT
  static final columnClaveU = "clave"; //int
  static final columntipoDeUsuarioU = "tipoDeUsuario"; //int
  static final columnidComercioU = "idComercio"; //TEXT
//---------------------------------------------------------------------
  static final tblInstitucion = "INSTITUCION"; //TABLA
  static final columnIdInstitucionI = "idInstitucion"; //int
  static final columnNombreI = "nombre"; //TEXT
//----------------------------------------------------------------------
  static final tblProductos = "PRODUCTOS"; //TABLA
  static final columnIdInstitucionP = "idInstitucion"; //int
  static final columnDescripcionP = "descripcion"; //TEXT
  static final columnidDocumentoP = "idDocumento"; //TEXT
  static final columnidProductoP = "idProducto"; //TEXT
  static final columnNombreSocioP = "nombreSocio"; //TEXT
//---------------------------------------------------------------------
  static final tblToken = "TOKEN"; //TABLA
  static final columnIdIT = "id"; //int
  static final columnTokenT = "token"; //TEXT
//----------------------------------------------------------------------
  static final tblTerminal = "TERMINAL"; //TABLA
  static final columnIdTerminal = "id"; //TEXT
//----------------------------------------------------------------------

  static Database _database;

  Databasehelper._privateConstructor();
  static final Databasehelper instance = Databasehelper._privateConstructor();

  Future<void> leerTablas() async {
    var tableNames = (await _database
            .query('sqlite_master', where: 'type = ?', whereArgs: ['table']))
        .map((row) => row['name'] as String)
        .toList(growable: false)
          ..sort();
    print('Tablas creadas:' + tableNames.toString());
  }

  Future<Database> get database async {
    print('Pasando por get database');
    //Si la base de datos ya existe retorna la db
    if (_database != null) {
      leerTablas();

      return _database;
    }

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
    CREATE TABLE $tblInstitucion
      (
        $columnIdInstitucionI INTEGER,
        $columnNombreI  TEXT NOT NULL
      )

    ''');

    await db.execute('''
    CREATE TABLE $tblUsuarios
    (
      $columnIdInstitucionU INTEGER,
      $columnNombreU  TEXT NOT NULL,
      $columnApellidoU TEXT NOT NULL,
      $columnUsuarioU  TEXT NOT NULL,
      $columnClaveU  TEXT NOT NULL,
      $columntipoDeUsuarioU  TEXT NOT NULL,
      $columnidComercioU  INTEGER
    )

''');

    await db.execute('''
    CREATE TABLE $tblProductos
    (
      $columnIdInstitucionP INTEGER,
      $columnDescripcionP  TEXT NOT NULL,
      $columnidDocumentoP  TEXT NOT NULL,
      $columnidProductoP  TEXT NOT NULL,
      $columnNombreSocioP  TEXT NOT NULL
    )

''');

    await db.execute('''
    CREATE TABLE $tblToken
    (
      $columnIdIT INTEGER,
      $columnTokenT  TEXT NOT NULL
    )

''');

    await db.execute('''
    CREATE TABLE $tblTerminal
    (
      $columnIdTerminal  TEXT NOT NULL
    )

''');
  }

  // functions to insert, query , update and delete
  //Insertar registro

  Future<int> grabarInstitucion(Map<String, dynamic> row) async {
    try {
      Database db = await instance.database;

      await db.insert(tblUsuarios, row);
      print('-----------------Se grabo la institucion!!!!!---------------');
      leerTablas();
      return 1;
    } catch (e) {
      print('Metodo:dbhelper.dart--grabarInstitucion ||' + e.toString());
      return 0;
    }
  }

  Future<int> grabarUsuario(Map<String, dynamic> row) async {
    try {
      Database db = await instance.database;

      await db.insert(tblUsuarios, row);
      print('-----------------Se grabo el Usuario!!!!!---------------');
      leerTablas();
      return 1;
    } catch (e) {
      print('Metodo:dbhelper.dart--grabarUsuario ||' + e.toString());
      return 0;
    }
  }

  Future<int> grabarProductos(Map<String, dynamic> row) async {
    try {
      Database db = await instance.database;

      await db.insert(tblProductos, row);
      print('-----------------Se grabo el producto!!!!!---------------');
      leerTablas();
      return 1;
    } catch (e) {
      print('Metodo:dbhelper.dart--grabarProductos ||' + e.toString());
      return 0;
    }
  }

//Consulta para todos los registros
  Future<List<Map<String, dynamic>>> queryall() async {
    try {
      Database db = await instance.database;
      return await db.query(tblUsuarios);
    } catch (e) {
      print('Metodo:dbhelper.dart--queryall ||' + e.toString());
    }
  }

  Future<List<Map<String, dynamic>>> queryspecific(int tipoDeUsuario) async {
    try {
      Database db = await instance.database;
      var res = await db.query(tblUsuarios,
          where: "tipoDeUsuario=?", whereArgs: [tipoDeUsuario]);
      return res;
    } catch (e) {
      print('Metodo:dbhelper.dart--queryspecific ||' + e.toString());
    }
  }

  Future<int> deletedata(int tipoDeUsuario) async {
    Database db = await instance.database;
    var res = await db.delete(tblUsuarios,
        where: "tipoDeUsuario = ?", whereArgs: [tipoDeUsuario]);

    return res;
  }

  Future<int> updatedata(int id) async {
    Database db = await instance.database;
    // var res = await db.update(tabla, {"nombre": "ramon"}, whereArgs: [id]);
    String sql =
        "UPDATE usuarios set nombre='" + "ramon' where tipoDeUsuario=3";
    print(sql);
    await db.execute(sql);

    return 1;
  }

  Future<String> borrarBaseDeDatos() async {
    Directory documentdirectory = await getApplicationDocumentsDirectory();
    //var path2 = documentdirectory.path;
    String path = join(documentdirectory.path, _databasename);
    // Database db = await instance.database;
    Database db = await instance.database;
    try {
      if (db.isOpen) {
        print('La base de datos esta abierta');
        await db.close();
      } else {
        print('La base de datos esta CERRADA!!');
      }
    } catch (e) {
      print('ERROR al verificar si esta abierta la db');
    }

    await deleteDatabase(path);
    return "Base de datos eliminada!!!";
  }

  Future<int> borrarInstitucion() async {
    //Borra  la tabla de productos para insertar las de API
    final db = await database;
    final respuesta = await db.delete('INSTITUCION');
    return respuesta;
  }

  Future<int> borrarProductos() async {
    //Borra  la tabla de productos para insertar las de API
    final db = await database;
    final respuesta = await db.delete('PRODUCTOS');
    return respuesta;
  }
}
