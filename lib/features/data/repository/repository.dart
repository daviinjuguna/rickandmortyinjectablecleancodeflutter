import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rickandmorty/core/errors/exceptions.dart';
import 'package:rickandmorty/core/errors/failures.dart';
import 'package:rickandmorty/features/data/data_source/local/local_data_source.dart';
import 'package:rickandmorty/features/data/data_source/remote/remote_data_source.dart';
import 'package:rickandmorty/features/domain/entities/character.dart';

abstract class Repository {
  Future<Either<String, List<Character>>> getAllCharacters();
  Future<Either<String, Character>> getCharacter(int id);
}

@LazySingleton(as: Repository)
class RepositoryImpl implements Repository {
  final LocalDataSource local;
  final RemoteDataSource remote;

  RepositoryImpl({@required this.local, @required this.remote});

  @override
  Future<Either<String, List<Character>>> getAllCharacters() async {
    try {
      final cached = await local.getCachedCharacters();
      if (cached.isEmpty) {
        final character = await remote.getAllCharacters();
        if (character.isNotEmpty) {
          await local.cacheCharacter(character);
        }
        return Right(character);
      } else {
        return Right(cached);
      }
    } catch (e) {
      print(e.toString());
      final failure = _returnFailure(e);
      return Left(failure);
    }
  }

  @override
  Future<Either<String, Character>> getCharacter(int id) async {
    try {
      final cached = await local.getCachedCharacters();
      if (cached.isEmpty) {
        return Right(await remote.getCharacter(id));
      } else {
        return Right(await local.getCachedSingleCharacter(id));
      }
    } catch (e) {
      print(e.toString());
      final failure = _returnFailure(e);
      return Left(failure);
    }
  }

  //Failure message checker
  String _returnFailure(final exception) {
    if (exception is ServerException) {
      return SERVER_FAILURE_MESSAGE;
    } else if (exception is CacheException) {
      return CACHE_FAILURE_MESSAGE;
    } else if (exception is SocketException) {
      return SOCKET_FAILURE_MESSAGE;
    } else {
      return SERVER_FAILURE_MESSAGE;
    }
  }
}
