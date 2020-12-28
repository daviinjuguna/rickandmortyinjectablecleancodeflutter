import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class UseCase<Type, Params> {
  Future<Either<String, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class ParamsId extends Equatable {
  final int id;

  ParamsId({@required this.id});
  @override
  List<Object> get props => [id];
}

class ParamsInt extends Equatable {
  final int number;

  ParamsInt({@required this.number});
  @override
  List<Object> get props => [number];
}

// class UserModelParams extends Equatable {
//   final UserModel userModel;

//   UserModelParams({@required this.userModel});

//   @override
//   List<Object> get props => [userModel];
// }

class ParamsString extends Equatable {
  final String stringItem;

  ParamsString({@required this.stringItem});
  @override
  List<Object> get props => [stringItem];
}
