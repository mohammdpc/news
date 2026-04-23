import 'package:flutter/cupertino.dart';


double screenWidth(BuildContext context)=>MediaQuery.of(context).size.width;
double screenHeight(BuildContext context)=>MediaQuery.of(context).size.height;

double widthOf(double width,BuildContext context)=>screenWidth(context)*(width/393);
double heightOf(double height,BuildContext context)=>screenHeight(context)*(height/852);


//icons
String themeIcon = 'assets/icons/roller-paint-brush.png';
String languageIcon = 'assets/icons/globe-alt.png';

//images paths
List<String> categoriesDark  = [
  'assets/images/general.png',
  'assets/images/busniess.png',
  'assets/images/sport.png',
  'assets/images/technology.png',
  'assets/images/entertainment.png',
  'assets/images/helth.png',
  'assets/images/science.png'
];

List<String> categoriesLight = [
  'assets/images/general_dark.png',
  'assets/images/busniess_dark.png',
  'assets/images/sport_dark.png',
  'assets/images/technology_dark.png',
  'assets/images/entertainment_dark.png',
  'assets/images/helth_dark.png',
  'assets/images/science_dark.png'
];

List<String> categoryText =[
  'General',
  'Business',
  'Sport',
  'Technology',
  'Entertainment',
  'Health',
  'Science'
];