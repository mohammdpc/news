import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/app utils/app_colors.dart';
import 'package:news/app utils/app_styles.dart';
import 'package:news/app utils/util.dart';
import 'package:news/models/news_data.dart';
import 'package:news/models/sources_model.dart';
import 'package:news/screens/Main%20Screen/mian_screen_view_model.dart';
import 'package:news/widgits/news_card.dart';

class NewsScreen extends StatefulWidget {
  final NewsData? newsData;
  final List<Sources> sources;
  final String? error;
  const NewsScreen({super.key, this.newsData, required this.sources, this.error});
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: widthOf(16, context)),
        child: DefaultTabController(
          length: widget.sources.length,
          child: Column(
            children: [
              TabBar(
                dividerColor: Colors.transparent,
                indicatorColor: AppColors.mainText(context),
                padding: EdgeInsets.symmetric(vertical: heightOf(15, context)),
                tabs: widget.sources
                    .map(
                      (e) => Tab(
                        child: Text(
                          '${e.name}',
                          style: AppStyles.bold16.copyWith(
                            color: AppColors.mainText(context),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                tabAlignment: TabAlignment.center,
                isScrollable: true,
                onTap: (index) =>
                    context.read<MianScreenViewModel>().changeSource(index),
              ),
              Expanded(
                child: Builder(builder: (context){
                  debugPrint('error: ${widget.error}');
                  if(widget.newsData?.articles == null){
                    debugPrint('error: ${widget.error}');
                    return Center(child: Text(widget.error == null?'No Data':widget.error!));
                  }
                  else if(widget.newsData!.articles!.isEmpty){
                    return Center(child: Text('No Data'));
                  }
                  else {
                    return ListView.separated(
                      shrinkWrap: true,
                      //physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          NewsCard(article: widget.newsData!.articles![index]),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: heightOf(16, context)),
                      itemCount: widget.newsData!.articles!.length,
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      );
  }
}
