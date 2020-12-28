// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../database/app_database.dart';
import '../features/presentation/bloc/character_bloc.dart';
import '../database/character/character_dao.dart';
import '../features/data/data_source/api/character_service.dart';
import '../features/domain/usecases/get_all_characters.dart';
import '../features/domain/usecases/get_character.dart';
import '../features/data/data_source/local/local_data_source.dart';
import '../features/data/data_source/remote/remote_data_source.dart';
import '../features/data/repository/repository.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<AppDatabase>(() => AppDatabase());
  gh.lazySingleton<CharacterDao>(() => CharacterDao(get<AppDatabase>()));
  gh.lazySingleton<CharacterService>(() => CharacterService.create());
  gh.lazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(dao: get<CharacterDao>()));
  gh.lazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(service: get<CharacterService>()));
  gh.lazySingleton<Repository>(() => RepositoryImpl(
      local: get<LocalDataSource>(), remote: get<RemoteDataSource>()));
  gh.lazySingleton<GetAllCharacter>(
      () => GetAllCharacter(repository: get<Repository>()));
  gh.lazySingleton<GetCharacter>(
      () => GetCharacter(repository: get<Repository>()));
  gh.factory<CharacterBloc>(() => CharacterBloc(
      getAllCharacters: get<GetAllCharacter>(),
      getCharacter: get<GetCharacter>()));
  return get;
}
