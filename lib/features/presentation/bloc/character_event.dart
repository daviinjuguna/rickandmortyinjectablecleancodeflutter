part of 'character_bloc.dart';

abstract class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object> get props => [];
}
class GetAllCharacters extends CharacterEvent{}

class GetSingleCharacter extends CharacterEvent{
  final int id;

  GetSingleCharacter({@required this.id});

  @override
  List<Object> get props => [id];
}