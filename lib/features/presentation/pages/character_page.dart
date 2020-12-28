import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/features/domain/entities/character.dart';
import 'package:rickandmorty/features/presentation/bloc/character_bloc.dart';
import 'package:rickandmorty/features/presentation/pages/character_details_page.dart';
import 'package:rickandmorty/injection.dart';

class CharacterPage extends StatefulWidget {
  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  CharacterBloc _bloc;
  List<Character> character;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<CharacterBloc>();
    _bloc.add(GetAllCharacters());
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
        title: Text("Characters"),
      ),
      body: BlocProvider<CharacterBloc>(
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
            if (state is SuccessAll) {
              character = state.character;
              return new ListView.builder(
                itemCount: character.length,
                padding: EdgeInsets.only(left: 10, top: 20),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CharacterDetailsPage(character: character[index],)),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    // height: 50,
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              character[index].image),
                          radius: 40,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              character[index].name,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(character[index].species)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
            return Container(
              color: Colors.white,
            );
          },
        ),
      ),
    );
  }
}
