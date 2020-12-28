import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:http/io_client.dart' as http;

part 'character_service.chopper.dart';

@lazySingleton
@ChopperApi(baseUrl: "/")
abstract class CharacterService extends ChopperService {
  @factoryMethod
  static CharacterService create() {
    final client = ChopperClient(
        baseUrl: "https://rickandmortyapi.com/api",
        services: [_$CharacterService()],
        converter: JsonConverter(),
        errorConverter: JsonConverter(),
        client: http.IOClient(
            HttpClient()..connectionTimeout = const Duration(seconds: 60)),
        interceptors: [
          HeadersInterceptor({'Accept': 'application/json'}),
          HttpLoggingInterceptor(),
        ]);
    return _$CharacterService(client);
  }

  @Get(path: "character")
  Future<Response> getAllCharacters();

  @Get(path: "character/{id}")
  Future<Response> getCharacter(
    @Path("id") int id,
  );
}
