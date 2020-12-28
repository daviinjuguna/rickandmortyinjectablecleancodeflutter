import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rickandmorty/core/utils/use_case.dart';
import 'package:rickandmorty/features/data/repository/repository.dart';
import 'package:rickandmorty/features/domain/entities/character.dart';

@lazySingleton
class GetCharacter extends UseCase<Character,ParamsId> {
  GetCharacter({@required this.repository});

  @override
  Future<Either<String, Character>> call(ParamsId p) {
    return repository.getCharacter(p.id);
  }
  
  final Repository repository;
}