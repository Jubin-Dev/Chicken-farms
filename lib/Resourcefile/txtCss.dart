import 'package:flutter/material.dart';
import 'dart:ui';

class TxtCss{

  String _fntRoboto = 'roboto';

  txtRoboStyle(double fntSize)
  {

     return TextStyle(
       fontFamily: _fntRoboto,
       fontSize: fntSize, 
       fontWeight: FontWeight.normal,
       color: Color(0xff7f8c8d));
  }
  // #7f8c8d is color code copied from https://flatuicolors.com/palette/defo
  // to use it in flutter replace # with 0xff (eg: 0xff7f8c8d)

  txtRoboBoldStyle(double fntSize)
  {
     return TextStyle(
       fontFamily: _fntRoboto,
       fontSize: fntSize, 
       fontWeight: FontWeight.bold,
       color: Color(0xff7f8c8d)); //(0xffbdc3c7));
  }

  txtRoboBoldHiLightColor(double fntSize, Color highlightcolor)
  {
     return TextStyle(
       fontFamily: _fntRoboto,
       fontSize: fntSize, 
       fontWeight: FontWeight.bold,
       decoration: TextDecoration.underline,
       color: highlightcolor); //(0xffbdc3c7));
  }

  btnTxtRoboStyle(double fntSize)
  {
     return TextStyle(
       fontFamily: _fntRoboto,
       fontSize: fntSize, 
       fontWeight: FontWeight.normal,
       color: Color(0xffecf0f1)); 
  }  

}