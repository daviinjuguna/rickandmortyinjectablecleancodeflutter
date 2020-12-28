import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rickandmorty/core/errors/exceptions.dart';
import 'package:rickandmorty/features/data/data_source/api/character_service.dart';
import 'package:rickandmorty/features/data/models/character_model.dart';

abstract class RemoteDataSource {
  Future<List<CharacterModel>> getAllCharacters();
  Future<CharacterModel> getCharacter(int id);
}

@LazySingleton(as: RemoteDataSource)
class RemoteDataSourceImpl implements RemoteDataSource {
  final CharacterService service;

  RemoteDataSourceImpl({@required this.service});
  @override
  Future<List<CharacterModel>> getAllCharacters() async {
    final response = await service.getAllCharacters();

    if (response.statusCode == 200) {
      List<CharacterModel> character = [];

      try {
        character = (response.body["results"] as List)
            .map((e) => CharacterModel.fromJson(e))
            .toList();
      } catch (e) {
        print(e.toString());
        throw ServerException();
      }

      return character;
    } else {
      // print(e.toString());
      throw ServerException();
    }
  }

  @override
  Future<CharacterModel> getCharacter(int id) async{
    final response = await service.getCharacter(id);

    if (response.statusCode == 200) {
      return CharacterModel.fromJson(response.body);
    } else {
      throw ServerException();
    }
  }
}
