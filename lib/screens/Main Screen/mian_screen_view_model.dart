import 'package:bloc/bloc.dart';
import 'package:news/api/http_api.dart';
import 'package:news/app%20utils/app_assets.dart';
import 'package:news/models/news_data.dart';
import 'package:news/models/sources_model.dart';
import 'main_screen_view_model_states.dart';

class MianScreenViewModel extends Cubit<MainScreenViewModelStates> {
  MianScreenViewModel() : super(OnCategory());

  void getNews(int categoryIndex) async {
    emit(Loading());
    try {
      List<Sources> sourcesList = await HttpApi.getSources(
        AppAssets.categoryList[categoryIndex].toLowerCase(),
      );
      try{
        NewsData newsData = await HttpApi.getNewsData(sourcesList[0]);
        emit(
          OnNews(
              sourcesList: sourcesList,
              title: AppAssets.categoryList[categoryIndex],
              newsData: newsData
          ),
        );
      }catch(e){
        emit(NewsError(e.toString(), sourcesList));
      }
    } catch (e) {
      emit(SourcesError(e.toString()));
    }
  }
  void changeSource(int sourceIndex)async{
    NewsData newsData = await HttpApi.getNewsData((state as OnNews).sourcesList[sourceIndex]);
    emit(
      OnNews(
          sourcesList: (state as OnNews).sourcesList,
          title: (state as OnNews).title,
          newsData: newsData
      ),
    );
  }
  void goHome(){
    emit(OnCategory());
  }
  void search(String searchWord)async{
    NewsData? newsData = await HttpApi.searchNews(searchWord);
    emit(Searching(newsData));
  }
}
