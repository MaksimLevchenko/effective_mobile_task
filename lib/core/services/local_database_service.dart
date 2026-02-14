import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/entities/character_entity.dart';

class LocalDatabaseService {
  LocalDatabaseService({this.databaseName = 'effective_mobile_task'});

  final String databaseName;
  Isar? _isar;

  Future<Isar> open() async {
    if (_isar != null && _isar!.isOpen) {
      return _isar!;
    }

    final existing = Isar.getInstance(databaseName);
    if (existing != null && existing.isOpen) {
      _isar = existing;
      return existing;
    }

    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      <CollectionSchema>[CharacterEntitySchema],
      name: databaseName,
      directory: dir.path,
    );
    return _isar!;
  }

  Future<void> close() async {
    if (_isar != null && _isar!.isOpen) {
      await _isar!.close();
    }
    _isar = null;
  }
}
