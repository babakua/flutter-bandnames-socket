import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Databasehelper {
  static final _databasename = "cosefi.db";
  static final _databaseversion = 1;

  static final tabla = "usuarios";

  static final columnID = "id";
  static final columName = "nombre";
  static final columnAge = "edad";

  // static Database _database;

  Databasehelper._privateConstructor();
}
