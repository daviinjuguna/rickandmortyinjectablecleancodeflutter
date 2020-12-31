import 'package:flutter/material.dart';
import 'package:rickandmorty/features/domain/entities/character.dart';

//argument holders
class CharacterDetailsPageArguments{
  final Character character;

  CharacterDetailsPageArguments({@required this.character});
}