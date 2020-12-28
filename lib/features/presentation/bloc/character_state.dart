part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}

class CharacterInitial extends CharacterState {}

class Loading extends CharacterState {}

class SuccessAll extends CharacterState {
  final List<Character> character;

  SuccessAll({@required this.character});

  @override
  List<Object> get props => [character];
}

class SuccessSingle extends CharacterState {
  final Character character;
  SuccessSingle({@required this.character});

  @override
  List<Object> get props => [character];
}

class Error extends CharacterState{
  final String message;

  Error({@required this.message});
  @override
  List<Object> get props => [message];
}
