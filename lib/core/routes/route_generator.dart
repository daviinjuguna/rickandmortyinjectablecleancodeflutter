import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rickandmorty/core/routes/argument_holders.dart';
import 'package:rickandmorty/features/presentation/pages/character_details_page.dart';
import 'package:rickandmorty/features/presentation/pages/character_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => CharacterPage());
      case '/details':
        //validate arguments
        if (args is CharacterDetailsPageArguments) {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => CharacterDetailsPage(character: args.character),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: FadeTransition(opacity: animation, child: child),
              );
            },
            transitionDuration: const Duration(milliseconds: 25),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Error Page"),
        ),
        body: Center(
          child: FlatButton(
            onPressed: () =>
                SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
            child: Text("Exit"),
          ),
        ),
      );
    });
  }
}
