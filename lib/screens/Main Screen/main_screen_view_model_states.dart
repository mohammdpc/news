import 'package:news/models/news_data.dart';
import 'package:news/models/sources_model.dart';

abstract class MainScreenViewModelStates {}

class OnCategory extends MainScreenViewModelStates{
  String title = 'Home';
}
class Loading extends MainScreenViewModelStates{}
class OnNews extends MainScreenViewModelStates{
  String title;
  List<Sources> sourcesList;
  NewsData newsData;
  OnNews({required this.title,required this.sourcesList,required this.newsData});
}
class Searching extends MainScreenViewModelStates{
  NewsData? newsData;
  Searching(this.newsData);
}
class SourcesError extends MainScreenViewModelStates{
  String error;
  SourcesError(this.error);
}
class NewsError extends MainScreenViewModelStates{
  String error;
  List<Sources> sourcesList;
  NewsError(this.error,this.sourcesList);
}