import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rickandmorty/core/utils/use_case.dart';
import 'package:rickandmorty/features/data/repository/repository.dart';
import 'package:rickandmorty/features/domain/entities/character.dart';

@lazySingleton
class GetAllCharacter extends UseCase<List<Character>,NoParams> {
  GetAllCharacter({@required this.repository});

  @override
  Future<Either<String, List<Character>>> call(NoParams params) {
    return repository.getAllCharacters();
  }
  
  final Repository repository;
}