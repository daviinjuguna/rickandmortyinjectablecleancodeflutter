import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rickandmorty/features/data/models/origin_model.dart';
import 'package:rickandmorty/features/domain/entities/character.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel extends Character {
  final int id;
  final String name, status, species, gender, image;
  final OriginModel origin, location;

  CharacterModel({
    @required this.id,
    @required this.name,
    @required this.status,
    @required this.species,
    @required this.gender,
    @required this.image,
    @required this.origin,
    @required this.location,
  }) : super(
            id: id,
            name: name,
            status: status,
            species: species,
            gender: gender,
            image: image,
            origin: origin,
            location: location);

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}
