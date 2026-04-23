import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/app utils/util.dart';
import 'package:news/app utils/app_colors.dart';
import 'package:news/screens/App%20Drawer/app_drawer.dart';
import 'package:news/screens/Home Screen/home_screen.dart';
import 'package:news/screens/Main%20Screen/main_screen_view_model_states.dart';
import 'package:news/screens/Main%20Screen/mian_screen_view_model.dart';
import 'package:news/screens/News%20Screen/news_screen.dart';
import 'package:news/screens/searching_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MianScreenViewModel(),
      child: BlocBuilder<MianScreenViewModel, MainScreenViewModelStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              forceMaterialTransparency: true,
              title: state is Searching?TextFormField(
                onChanged: (v){
                  context.read<MianScreenViewModel>().search(v);
                },

              ):Text(
                state is OnCategory
                    ? state.title
                    : state is OnNews
                    ? state.title
                    : 'home',
              ),
              centerTitle: true,
              actions:state is Searching?null: [
                SizedBox(
                  width: widthOf(24, context),
                  child: InkWell(
                    onTap: (){
                      context.read<MianScreenViewModel>().search('');
                    },
                    child: Icon(
                      Icons.search_rounded,
                      color: AppColors.mainText(context),
                    ),
                  ),
                ),
              ],
            ),

            drawer: AppDrawer(),

            body: Builder(builder: (context){
              if(state is OnCategory){
                return HomeScreen();
              }
              else if(state is Loading){
                return Center(child: SizedBox(child: CircularProgressIndicator()));
              }
              else if(state is OnNews){
                return NewsScreen(
                    newsData: state.newsData,
                    sources: state.sourcesList,
                  );
              }
              else if(state is NewsError){
                return NewsScreen(sources: state.sourcesList,error: state.error,);
              }
              else if(state is Searching){
                return SearchingScreen(newsData: state.newsData,);
              }
              else{
                return Placeholder();
              }
              // state is OnCategory
              //     ? HomeScreen()
              //     : State is Loading
              //     ? Center(child: SizedBox(child: CircularProgressIndicator()))
              //     : state is OnNews
              //     ? NewsScreen(
              //   newsData: state.newsData,
              //   sources: state.sourcesList,
              // )
              //     : state is NewsError
              //     ? NewsScreen(sources: state.sourcesList)
              //     : Placeholder()
            }),
          );
        },
      ),
    );
  }
}
