import '../api/api_character.dart';

class CharacterEntity {
  CharacterEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.species,
    required this.gender,
    required this.originName,
    required this.locationName,
    required this.episodeUrls,
    required this.remoteUrl,
    required this.created,
    this.type,
    this.isFavorite = false,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  int id;

  String name;

  String status;

  String species;
  String? type;
  String gender;
  String originName;
  String locationName;
  String image;
  List<String> episodeUrls;
  String remoteUrl;
  String created;
  bool isFavorite;
  DateTime? updatedAt;

  static CharacterEntity fromApi(ApiCharacter api, {bool isFavorite = false}) {
    return CharacterEntity(
      id: api.id,
      name: api.name,
      image: api.image,
      status: api.status,
      species: api.species,
      type: api.type.isEmpty ? null : api.type,
      gender: api.gender,
      originName: api.origin.name,
      locationName: api.location.name,
      episodeUrls: api.episode,
      remoteUrl: api.url,
      created: api.created,
      isFavorite: isFavorite,
    );
  }

  CharacterEntity copyWith({
    String? name,
    String? image,
    String? status,
    String? species,
    String? type,
    String? gender,
    String? originName,
    String? locationName,
    List<String>? episodeUrls,
    String? remoteUrl,
    String? created,
    bool? isFavorite,
    DateTime? updatedAt,
  }) {
    return CharacterEntity(
      id: id,
      name: name ?? this.name,
      image: image ?? this.image,
      status: status ?? this.status,
      species: species ?? this.species,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      originName: originName ?? this.originName,
      locationName: locationName ?? this.locationName,
      episodeUrls: episodeUrls ?? List<String>.from(this.episodeUrls),
      remoteUrl: remoteUrl ?? this.remoteUrl,
      created: created ?? this.created,
      isFavorite: isFavorite ?? this.isFavorite,
      updatedAt: updatedAt ?? this.updatedAt ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toUiMap() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'originName': originName,
      'locationName': locationName,
      'image': image,
      'episodeUrls': episodeUrls,
      'remoteUrl': remoteUrl,
      'created': created,
      'isFavorite': isFavorite,
      'updatedAt': (updatedAt ?? DateTime.now()).toIso8601String(),
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'originName': originName,
      'locationName': locationName,
      'image': image,
      'episodeUrls': List<String>.from(episodeUrls),
      'remoteUrl': remoteUrl,
      'created': created,
      'isFavorite': isFavorite,
      'updatedAt': (updatedAt ?? DateTime.now()).toIso8601String(),
    };
  }

  static CharacterEntity fromMap(Map<String, dynamic> map) {
    return CharacterEntity(
      id: (map['id'] as num).toInt(),
      name: map['name'] as String,
      image: map['image'] as String,
      status: map['status'] as String,
      species: map['species'] as String,
      type: map['type'] as String?,
      gender: map['gender'] as String,
      originName: map['originName'] as String,
      locationName: map['locationName'] as String,
      episodeUrls: List<String>.from(map['episodeUrls'] as List<dynamic>),
      remoteUrl: map['remoteUrl'] as String,
      created: map['created'] as String,
      isFavorite: (map['isFavorite'] as bool?) ?? false,
      updatedAt: map['updatedAt'] != null
          ? DateTime.tryParse(map['updatedAt'] as String)
          : null,
    );
  }
}
