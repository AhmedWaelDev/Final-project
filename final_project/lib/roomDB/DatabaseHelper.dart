import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Medicine {
  final String name;
  final String type;
  final String breakfast;
  final String lunch;
  final String dinner;
  final String breakfastTime;
  final String lunchTime;
  final String dinnerTime;
  final int amount;
  final String cause;
  final DateTime reminderTime;
  final int durationInDays;
  final int capsize;
  final int? id;

  Medicine({
    this.id,
    required this.name,
    required this.type,
    required this.breakfast,
    required this.lunch,
    required this.dinner,
    required this.breakfastTime,
    required this.lunchTime,
    required this.dinnerTime,
    required this.amount,
    required this.cause,
    required this.reminderTime,
    required this.durationInDays,
    required this.capsize,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'breakfast': breakfast,
      'lunch': lunch,
      'dinner': dinner,
      'amount': amount,
      'cause': cause,
      'reminderTime': reminderTime.millisecondsSinceEpoch,
      'durationInDays': durationInDays,
      'capsize': capsize,
      'breakfastTime': breakfastTime,
      'lunchTime': lunchTime,
      'dinnerTime': dinnerTime,
    };
  }
}

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'medicine.db');
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
        CREATE TABLE medicines(
          id INTEGER ,
          name TEXT,
          breakfast TEXT,
          lunch TEXT,
          type TEXT,
          dinner TEXT,
          amount INTEGER,
          cause TEXT,
          reminderTime INTEGER,
          durationInDays INTEGER,
          capsize INTEGER,
          breakfastTime TEXT,
          lunchTime TEXT,
          dinnerTime TEXT
        )
      ''');
  }

  Future<void> insertMedicine(Medicine medicine) async {
    Database db = await database;
    await db.insert('medicines', medicine.toMap());
  }

  Future<List<Medicine>> getMedicines() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('medicines');
    return List.generate(maps.length, (index) {
      return Medicine(
        id: maps[index]['id'],
        name: maps[index]['name'],
        type: maps[index]['type'],
        breakfast: maps[index]['breakfast'],
        lunch: maps[index]['lunch'],
        dinner: maps[index]['dinner'],
        amount: maps[index]['amount'],
        cause: maps[index]['cause'],
        breakfastTime: maps[index]['breakfastTime'],
        lunchTime: maps[index]['lunchTime'],
        dinnerTime: maps[index]['dinnerTime'],
        reminderTime:
            DateTime.fromMillisecondsSinceEpoch(maps[index]['reminderTime']),
        durationInDays: maps[index]['durationInDays'],
        capsize: maps[index]['capsize'],
      );
    });
  }

  Future<void> deleteMedicine(int id) async {
    Database db = await database;
    await db.delete(
      'medicines',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Medicine>> getMedicinesForDateAndId(DateTime date, int id) async {
    Database db = await database;
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = DateTime(date.year, date.month, date.day + 1);
    List<Map<String, dynamic>> maps = await db.query(
      'medicines',
      where: 'reminderTime >= ? AND reminderTime < ? AND id = ?',
      whereArgs: [
        startOfDay.millisecondsSinceEpoch,
        endOfDay.millisecondsSinceEpoch,
        id,
      ],
    );
    return List.generate(maps.length, (index) {
      return Medicine(
        id: maps[index]['id'],
        name: maps[index]['name'],
        type: maps[index]['type'],
        breakfast: maps[index]['breakfast'],
        lunch: maps[index]['lunch'],
        dinner: maps[index]['dinner'],
        amount: maps[index]['amount'],
        cause: maps[index]['cause'],
        breakfastTime: maps[index]['breakfastTime'],
        lunchTime: maps[index]['lunchTime'],
        dinnerTime: maps[index]['dinnerTime'],
        reminderTime:
            DateTime.fromMillisecondsSinceEpoch(maps[index]['reminderTime']),
        durationInDays: maps[index]['durationInDays'],
        capsize: maps[index]['capsize'],
      );
    });
  }

  mydeleteDatabase() async {
    String path = join(await getDatabasesPath(), 'medicine.db');
    await deleteDatabase(path);
  }
}
