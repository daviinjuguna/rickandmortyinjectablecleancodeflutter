import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty/features/domain/entities/origin.dart';

class Character extends Equatable {
  final int id;
  final String name, status, species, gender, image;
  final Origin origin, location;

  Character({
    @required this.id,
    @required this.name,
    @required this.status,
    @required this.species,
    @required this.gender,
    @required this.image,
    @required this.origin,
    @required this.location,
  });

  @override
  List<Object> get props => [
        id,
        name,
        status,
        species,
        gender,
        image,
        origin,
        location,
      ];
}
