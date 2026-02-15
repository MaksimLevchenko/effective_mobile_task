import 'package:hive_flutter/hive_flutter.dart';

class LocalDatabaseService {
  LocalDatabaseService({this.databaseName = 'effective_mobile_task_box'});

  final String databaseName;
  Box<Map>? _box;

  Future<Box<Map>> open() async {
    if (_box != null && _box!.isOpen) {
      return _box!;
    }

    await Hive.initFlutter();
    if (Hive.isBoxOpen(databaseName)) {
      _box = Hive.box<Map>(databaseName);
      return _box!;
    }

    _box = await Hive.openBox<Map>(databaseName);
    return _box!;
  }

  Future<void> close() async {
    if (_box != null && _box!.isOpen) {
      await _box!.close();
    }
    _box = null;
  }
}
