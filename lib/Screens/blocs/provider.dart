import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/blocs/bloc.dart';

class Provider extends InheritedWidget
{
  final bloc = Bloc();

  Provider({Key key,Widget child}) :super(key:key, child: child);

  bool updateShouldNotify(_) => true;

  static Bloc of(BuildContext context)
  {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;    
  }
}