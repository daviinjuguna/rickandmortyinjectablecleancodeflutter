import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:rickandmorty/core/errors/exceptions.dart';
import 'package:rickandmorty/database/app_database.dart';
import 'package:rickandmorty/database/character/character_dao.dart';
import 'package:rickandmorty/features/data/models/character_model.dart';

abstract class LocalDataSource {
  Future<void> cacheCharacter(List<CharacterModel> model);
  Future<List<CharacterModel>> getCachedCharacters();
  Future<CharacterModel> getCachedSingleCharacter(int id);
}

@LazySingleton(as: LocalDataSource)
class LocalDataSourceImpl implements LocalDataSource {
  final CharacterDao dao;

  LocalDataSourceImpl({@required this.dao});

  @override
  Future<void> cacheCharacter(model) async {
    await dao.deleteAll();
    for (var i = 0; i < model.length; i++) {
      try {
        CharacterModel e = model[i];
        await dao.insertCharacter(
          CharacterTable(
            id: e.id,
            name: e.name,
            status: e.status,
            species: e.species,
            gender: e.gender,
            image: e.image,
            origin: json.encode(e.origin),
            location: json.encode(e.location),
          ),
        );
      } catch (e) {
        print(e.toString());
        throw CacheException();
      }
    }
  }

  @override
  Future<List<CharacterModel>> getCachedCharacters() async {
    try {
      List<CharacterTable> data = await dao.getCharacters();
      List<CharacterModel> model = [];
      for (var i = 0; i < model.length; i++) {
        CharacterTable e = data[i];
        model.add(
          CharacterModel(
            id: e.id,
            name: e.name,
            status: e.status,
            species: e.species,
            gender: e.gender,
            image: e.image,
            origin: json.decode(e.origin),
            location: json.decode(e.location),
          ),
        );
      }
      return model;
    } catch (e) {
      print(e.toString());
      throw CacheException();
    }
  }

  @override
  Future<CharacterModel> getCachedSingleCharacter(int id) async {
    try {
      List<CharacterTable> data = await dao.getCharacter(id);
      CharacterTable e = data.first;

      return CharacterModel(
        id: e.id,
        name: e.name,
        status: e.status,
        species: e.species,
        gender: e.gender,
        image: e.name,
        origin: json.decode(e.origin),
        location: json.decode(e.location),
      );
    } catch (e) {
      print(e.toString());
      throw CacheException();
    }
  }
}
