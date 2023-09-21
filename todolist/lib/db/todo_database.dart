import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todolist/db/todo_table.dart';

class TodoDatabase{
  static const DB_NAME = 'todo.db';
  static const DB_VERSION = 1;
  static late Database _database;

  //tranh truong new Tododatabse trong class kh se tao ra object moi

  TodoDatabase._internal();
  static final TodoDatabase instance = TodoDatabase._internal();

  Database get database => _database;

  static const initScript = [TodoTable.CREATE_TABLE_QUERY];
  static const mirgationScript = [TodoTable.CREATE_TABLE_QUERY];

  init() async {
    _database = await openDatabase(
      // tao ra duong dan den database
      join(await getDatabasesPath(), DB_NAME),
      onCreate: (db, version) {
          initScript.forEach((script) async => await db.execute(script));
      },
      //khi version tang len > 1
      onUpgrade: (db, oldVersion, newVersion) {
        mirgationScript.forEach((script) async => await db.execute(script));
      }, version: DB_VERSION
    );
  }
}