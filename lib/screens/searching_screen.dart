import 'package:flutter/material.dart';
import 'package:news/app%20utils/util.dart';
import 'package:news/models/news_data.dart';
import 'package:news/widgits/news_card.dart';

class SearchingScreen extends StatelessWidget {
  final NewsData? newsData;
  const SearchingScreen({super.key,this.newsData});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context){
      if(newsData?.articles == null || newsData!.articles!.isEmpty ){
        return Center(child: Text('No Data'));
      }
      else {
        return ListView.separated(
          shrinkWrap: true,
          //physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) =>
              NewsCard(article: newsData!.articles![index]),
          separatorBuilder: (context, index) =>
              SizedBox(height: heightOf(16, context)),
          itemCount: newsData!.articles!.length,
        );
      }
    });
  }
}
