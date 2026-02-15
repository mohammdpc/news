import 'package:flutter/cupertino.dart';


double screenWidth(BuildContext context)=>MediaQuery.of(context).size.width;
double screenHeight(BuildContext context)=>MediaQuery.of(context).size.height;

double widthOf(double width,BuildContext context)=>screenWidth(context)*(width/375);
double heightOf(double height,BuildContext context)=>screenHeight(context)*(height/812);

//general
Color secTextColor = Color(0xffA0A0A0);

//light
Color lightMainText = Color(0xff1C1C1C);
Color lightBackground = Color(0xffffffff);
Color lightStroke = Color(0xff171717);
Color red = Color(0xffFF3232);

//dark

Color darkMainText = Color(0xffFFFFFF);
Color darkBackground = Color(0xff171717);
Color darkStroke = Color(0xffffffff);

//icons
String themeIcon = 'assets/icons/roller-paint-brush.svg';
String languageIcon = 'assets/icons/globe-alt.svg';

//images paths