import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rickandmorty/features/domain/entities/origin.dart';

part 'origin_model.g.dart';

@JsonSerializable()
class OriginModel extends Origin {
  final String name, url;

  OriginModel({@required this.name, @required this.url})
      : super(name: name, url: url);

  factory OriginModel.fromJson(Map<String, dynamic> json) =>
      _$OriginModelFromJson(json);

  Map<String, dynamic> toJson() => _$OriginModelToJson(this);
}
