import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rickandmorty/core/utils/use_case.dart';
import 'package:rickandmorty/features/domain/entities/character.dart';
import 'package:rickandmorty/features/domain/usecases/get_all_characters.dart';
import 'package:rickandmorty/features/domain/usecases/get_character.dart';

part 'character_event.dart';
part 'character_state.dart';

@injectable
class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc({
    @required this.getAllCharacters,
    @required this.getCharacter,
  }) : super(CharacterInitial());

  final GetAllCharacter getAllCharacters;
  final GetCharacter getCharacter;

  @override
  Stream<CharacterState> mapEventToState(
    CharacterEvent event,
  ) async* {
    if (event is GetAllCharacters) {
      yield Loading();
      final allEither = await getAllCharacters.call(NoParams());
      yield* allEither.fold(
        (l)async*{
          yield Error(message: l);
        },
        (character) async*{
          yield SuccessAll(character: character);
        },
      );
    }
    if (event is GetSingleCharacter) {
      yield Loading();
      final singleEither = await getCharacter.call(ParamsId(id: event.id));
      yield* singleEither.fold(
        (l)async*{
          yield Error(message: l);
        },
        (character) async*{
          yield SuccessSingle(character: character);
        },
      );
    }
  }
}
