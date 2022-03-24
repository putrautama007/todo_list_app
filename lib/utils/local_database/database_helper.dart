import 'package:sqflite/sqflite.dart';
import 'package:todo_list_app/utils/strings/app_strings.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/todo_list.db';

    final Database db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database database, int version) async {
    await database.execute('''
      CREATE TABLE  ${AppStrings.todoListDatabase} (
        id INTEGER PRIMARY KEY,
        title TEXT,
        description TEXT
      );
    ''');
  }

}
