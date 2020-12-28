// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class CharacterTable extends DataClass implements Insertable<CharacterTable> {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final String origin;
  final String location;
  CharacterTable(
      {@required this.id,
      @required this.name,
      @required this.status,
      @required this.species,
      @required this.gender,
      @required this.image,
      @required this.origin,
      @required this.location});
  factory CharacterTable.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return CharacterTable(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      status:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
      species:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}species']),
      gender:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}gender']),
      image:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}image']),
      origin:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}origin']),
      location: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}location']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || species != null) {
      map['species'] = Variable<String>(species);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || origin != null) {
      map['origin'] = Variable<String>(origin);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    return map;
  }

  CharactersTableCompanion toCompanion(bool nullToAbsent) {
    return CharactersTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      species: species == null && nullToAbsent
          ? const Value.absent()
          : Value(species),
      gender:
          gender == null && nullToAbsent ? const Value.absent() : Value(gender),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      origin:
          origin == null && nullToAbsent ? const Value.absent() : Value(origin),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
    );
  }

  factory CharacterTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CharacterTable(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      status: serializer.fromJson<String>(json['status']),
      species: serializer.fromJson<String>(json['species']),
      gender: serializer.fromJson<String>(json['gender']),
      image: serializer.fromJson<String>(json['image']),
      origin: serializer.fromJson<String>(json['origin']),
      location: serializer.fromJson<String>(json['location']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'status': serializer.toJson<String>(status),
      'species': serializer.toJson<String>(species),
      'gender': serializer.toJson<String>(gender),
      'image': serializer.toJson<String>(image),
      'origin': serializer.toJson<String>(origin),
      'location': serializer.toJson<String>(location),
    };
  }

  CharacterTable copyWith(
          {int id,
          String name,
          String status,
          String species,
          String gender,
          String image,
          String origin,
          String location}) =>
      CharacterTable(
        id: id ?? this.id,
        name: name ?? this.name,
        status: status ?? this.status,
        species: species ?? this.species,
        gender: gender ?? this.gender,
        image: image ?? this.image,
        origin: origin ?? this.origin,
        location: location ?? this.location,
      );
  @override
  String toString() {
    return (StringBuffer('CharacterTable(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('species: $species, ')
          ..write('gender: $gender, ')
          ..write('image: $image, ')
          ..write('origin: $origin, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              status.hashCode,
              $mrjc(
                  species.hashCode,
                  $mrjc(
                      gender.hashCode,
                      $mrjc(image.hashCode,
                          $mrjc(origin.hashCode, location.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CharacterTable &&
          other.id == this.id &&
          other.name == this.name &&
          other.status == this.status &&
          other.species == this.species &&
          other.gender == this.gender &&
          other.image == this.image &&
          other.origin == this.origin &&
          other.location == this.location);
}

class CharactersTableCompanion extends UpdateCompanion<CharacterTable> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> status;
  final Value<String> species;
  final Value<String> gender;
  final Value<String> image;
  final Value<String> origin;
  final Value<String> location;
  const CharactersTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.status = const Value.absent(),
    this.species = const Value.absent(),
    this.gender = const Value.absent(),
    this.image = const Value.absent(),
    this.origin = const Value.absent(),
    this.location = const Value.absent(),
  });
  CharactersTableCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String status,
    @required String species,
    @required String gender,
    this.image = const Value.absent(),
    @required String origin,
    @required String location,
  })  : name = Value(name),
        status = Value(status),
        species = Value(species),
        gender = Value(gender),
        origin = Value(origin),
        location = Value(location);
  static Insertable<CharacterTable> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> status,
    Expression<String> species,
    Expression<String> gender,
    Expression<String> image,
    Expression<String> origin,
    Expression<String> location,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status,
      if (species != null) 'species': species,
      if (gender != null) 'gender': gender,
      if (image != null) 'image': image,
      if (origin != null) 'origin': origin,
      if (location != null) 'location': location,
    });
  }

  CharactersTableCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> status,
      Value<String> species,
      Value<String> gender,
      Value<String> image,
      Value<String> origin,
      Value<String> location}) {
    return CharactersTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      origin: origin ?? this.origin,
      location: location ?? this.location,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (species.present) {
      map['species'] = Variable<String>(species.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (origin.present) {
      map['origin'] = Variable<String>(origin.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharactersTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('species: $species, ')
          ..write('gender: $gender, ')
          ..write('image: $image, ')
          ..write('origin: $origin, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }
}

class $CharactersTableTable extends CharactersTable
    with TableInfo<$CharactersTableTable, CharacterTable> {
  final GeneratedDatabase _db;
  final String _alias;
  $CharactersTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedTextColumn _status;
  @override
  GeneratedTextColumn get status => _status ??= _constructStatus();
  GeneratedTextColumn _constructStatus() {
    return GeneratedTextColumn(
      'status',
      $tableName,
      false,
    );
  }

  final VerificationMeta _speciesMeta = const VerificationMeta('species');
  GeneratedTextColumn _species;
  @override
  GeneratedTextColumn get species => _species ??= _constructSpecies();
  GeneratedTextColumn _constructSpecies() {
    return GeneratedTextColumn(
      'species',
      $tableName,
      false,
    );
  }

  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  GeneratedTextColumn _gender;
  @override
  GeneratedTextColumn get gender => _gender ??= _constructGender();
  GeneratedTextColumn _constructGender() {
    return GeneratedTextColumn(
      'gender',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imageMeta = const VerificationMeta('image');
  GeneratedTextColumn _image;
  @override
  GeneratedTextColumn get image => _image ??= _constructImage();
  GeneratedTextColumn _constructImage() {
    return GeneratedTextColumn('image', $tableName, false,
        defaultValue: Constant(""));
  }

  final VerificationMeta _originMeta = const VerificationMeta('origin');
  GeneratedTextColumn _origin;
  @override
  GeneratedTextColumn get origin => _origin ??= _constructOrigin();
  GeneratedTextColumn _constructOrigin() {
    return GeneratedTextColumn(
      'origin',
      $tableName,
      false,
    );
  }

  final VerificationMeta _locationMeta = const VerificationMeta('location');
  GeneratedTextColumn _location;
  @override
  GeneratedTextColumn get location => _location ??= _constructLocation();
  GeneratedTextColumn _constructLocation() {
    return GeneratedTextColumn(
      'location',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, status, species, gender, image, origin, location];
  @override
  $CharactersTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'characters_table';
  @override
  final String actualTableName = 'characters_table';
  @override
  VerificationContext validateIntegrity(Insertable<CharacterTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status'], _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('species')) {
      context.handle(_speciesMeta,
          species.isAcceptableOrUnknown(data['species'], _speciesMeta));
    } else if (isInserting) {
      context.missing(_speciesMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender'], _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image'], _imageMeta));
    }
    if (data.containsKey('origin')) {
      context.handle(_originMeta,
          origin.isAcceptableOrUnknown(data['origin'], _originMeta));
    } else if (isInserting) {
      context.missing(_originMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location'], _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CharacterTable map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CharacterTable.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CharactersTableTable createAlias(String alias) {
    return $CharactersTableTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CharactersTableTable _charactersTable;
  $CharactersTableTable get charactersTable =>
      _charactersTable ??= $CharactersTableTable(this);
  CharacterDao _characterDao;
  CharacterDao get characterDao =>
      _characterDao ??= CharacterDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [charactersTable];
}
