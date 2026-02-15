# effective_mobile_task

## Описание проекта
`effective_mobile_task` — Flutter-приложение для просмотра персонажей Rick and Morty с возможностью:
- добавлять персонажей в избранное;
- переключаться между вкладками персонажей и избранного;
- использовать фильтры (поиск, статус, пол);
- работать с локальным кэшем и отображать офлайн-данные.

## Требования
- Flutter SDK `3.41.1`
- Dart SDK `3.11.0`

## Сборка и запуск
Установить пакетов:
```bash
flutter pub get
```

Запуск на Android:
```bash
flutter run -d android
```

Запуск на iOS:
```bash
flutter run -d ios
```

Запуск на Windows:
```bash
flutter run -d windows
```

## Зависимости и версии

### Основные зависимости (`dependencies`)
- `flutter` (sdk)
- `flutter_bloc: ^9.1.1`
- `hive: ^2.2.3`
- `hive_flutter: ^1.1.0`
- `json_annotation: 4.9.0`
- `freezed_annotation: 2.4.1`
- `shared_preferences: ^2.5.2`

### Dev-зависимости (`dev_dependencies`)
- `flutter_test` (sdk)
- `build_runner: ^2.4.6`
- `json_serializable: ^6.8.0`
- `freezed: 2.4.1`
- `flutter_lints: ^6.0.0`
