import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  // Initialize the SharedPreferences instance
  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // Retrieve a string value from SharedPreferences
  String? getDataString({required String key}) {
    return sharedPreferences.getString(key);
  }

  // Save data to SharedPreferences based on value type
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  // Retrieve data from SharedPreferences based on key
  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  // Remove data from SharedPreferences using key
  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  // Check if SharedPreferences contains a specific key
  Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

  // Clear all data from SharedPreferences except 'isVisited'
  Future<bool> clearDataExceptIsVisited() async {
    Set<String> keys = sharedPreferences.getKeys();
    List<Future<bool>> futures = [];

    for (String key in keys) {
      if (key != 'isVisited') {
        futures.add(sharedPreferences.remove(key));
      }
    }

    // Wait for all removal operations to complete
    List<bool> results = await Future.wait(futures);
    // Check if all removals were successful
    return results.every((result) => result);
  }

  // Clear all data from SharedPreferences, including 'isVisited'
  Future<bool> clearAllData() async {
    return await sharedPreferences.clear();
  }

  // Save data to SharedPreferences based on value type
  Future<dynamic> put({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setInt(key, value);
    }
  }

  // Retrieve all data from SharedPreferences
  Map<String, dynamic> getAllData() {
    Map<String, dynamic> allData = {};
    Set<String> keys = sharedPreferences.getKeys();

    for (String key in keys) {
      allData[key] = sharedPreferences.get(key);
    }

    return allData;
  }
}
