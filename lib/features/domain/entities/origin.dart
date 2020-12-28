import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Origin extends Equatable {
  final String name, url;

  Origin({@required this.name, @required this.url});

  @override
  List<Object> get props => [name, url];
}
