import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/di/injection.dart';
import 'package:rickandmorty/features/domain/entities/character.dart';
import 'package:rickandmorty/features/presentation/bloc/character_bloc.dart';

class CharacterDetailsPage extends StatefulWidget {
  final Character character;

  const CharacterDetailsPage({Key key, @required this.character})
      : super(key: key);
  @override
  _CharacterDetailsPageState createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  CharacterBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<CharacterBloc>();
    _bloc.add(GetSingleCharacter(id: widget.character.id));
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Character Details"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
          child: BlocProvider<CharacterBloc>(
            create: (_) => _bloc,
            child: BlocBuilder<CharacterBloc, CharacterState>(
              builder: (context, state) {
                if (state is Loading) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                if (state is Error) {
                  return Center(
                    child: Container(
                      child: Expanded(
                        child: Text(
                          "Error: " + state.message,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  );
                }
                if (state is SuccessSingle) {
                  Character character = state.character;

                  return Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            character.image),
                        radius: 110,
                      ),
                      SizedBox(height: 10),
                      Text(
                        character.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Species:"), Text(character.species)],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Status:"), Text(character.status)],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Gender:"), Text(character.gender)],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
