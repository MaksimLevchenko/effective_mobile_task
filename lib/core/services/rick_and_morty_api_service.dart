import 'dart:convert';
import 'dart:io';

import '../models/api/api_characters_page.dart';

class RickAndMortyApiException implements Exception {
  RickAndMortyApiException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;

  @override
  String toString() => 'RickAndMortyApiException(statusCode: $statusCode, message: $message)';
}

class RickAndMortyApiService {
  RickAndMortyApiService({
    this.baseUrl = 'https://rickandmortyapi.com/api',
    HttpClient? httpClient,
  }) : _httpClient = httpClient ?? HttpClient();

  final String baseUrl;
  final HttpClient _httpClient;

  Future<ApiCharactersPage> fetchCharactersPage({
    int page = 1,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
  }) async {
    final query = <String, String>{
      'page': '$page',
      if (name != null && name.trim().isNotEmpty) 'name': name.trim(),
      if (status != null && status.trim().isNotEmpty) 'status': status.trim(),
      if (species != null && species.trim().isNotEmpty) 'species': species.trim(),
      if (type != null && type.trim().isNotEmpty) 'type': type.trim(),
      if (gender != null && gender.trim().isNotEmpty) 'gender': gender.trim(),
    };

    final uri = Uri.parse('$baseUrl/character').replace(queryParameters: query);

    HttpClientResponse response;
    try {
      final request = await _httpClient.getUrl(uri);
      response = await request.close();
    } on SocketException catch (error) {
      throw RickAndMortyApiException('Ошибка сети: $error');
    } on HttpException catch (error) {
      throw RickAndMortyApiException('HTTP ошибка: $error');
    }

    final body = await utf8.decodeStream(response);
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw RickAndMortyApiException(
        'Неожиданный код статуса ${response.statusCode}. Тело ответа: $body',
        statusCode: response.statusCode,
      );
    }

    final decoded = jsonDecode(body);
    if (decoded is! Map<String, dynamic>) {
      throw RickAndMortyApiException('Неожиданный формат ответа.');
    }

    return ApiCharactersPage.fromJson(decoded);
  }

  void dispose() {
    _httpClient.close(force: true);
  }
}
