import 'package:expenses_tracker/data/local/db/app_db.dart';
import 'package:flutter/material.dart';

class AppDatabaseProvider with ChangeNotifier {
  AppDatabaseProvider() {
    _db = AppDb();
  }
  late final AppDb _db;

  AppDb get db => _db;

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }
}
