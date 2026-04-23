import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news/app utils/util.dart';
import 'package:news/app utils/app_colors.dart';
import 'package:news/app utils/app_styles.dart';
import 'package:news/models/news_data.dart';
import 'package:news/widgits/expanded_news_card.dart';

class NewsCard extends StatelessWidget {
  final Articles article;
  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            opaque: false,
            pageBuilder: (context, a, b) => ExpandedNewsCard(article: article),
            transitionsBuilder: (context, animation, _, child) =>
                FadeTransition(opacity: animation, child: child),
          ),
        );
      },
      child: Hero(
        tag: article.url!,
        flightShuttleBuilder: (context, animation, direction, start, end) =>
            Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: EdgeInsetsGeometry.all(widthOf(8, context)),
                decoration: BoxDecoration(
                  color: AppColors.backgroundReversed(context),
                  borderRadius: BorderRadiusGeometry.all(Radius.circular(16)),
                ),
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    spacing: heightOf(10, context),
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        height: heightOf(220, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: '${article.urlToImage}',
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                                child: SizedBox(
                                  child: CircularProgressIndicator(
                                    value: downloadProgress.progress,
                                  ),
                                ),
                              ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          fit: BoxFit.fill,
                        ),
                      ),
                      FadeTransition(
                        //from expanded to new card
                        opacity: animation,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          spacing: heightOf(10, context),
                          children: [
                            Text(
                              '${article.content}',
                              overflow: TextOverflow.fade,
                              style: AppStyles.bold16.copyWith(
                                color: AppColors.mainTextReversed(context),
                              ),
                            ),
                            FilledButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                ),
                                padding: WidgetStatePropertyAll(
                                  EdgeInsets.all(heightOf(16, context)),
                                ),
                                backgroundColor: WidgetStatePropertyAll(
                                  AppColors.background(context),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'View Full Article',
                                  style: AppStyles.bold16.copyWith(
                                    color: AppColors.mainText(context),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      FadeTransition(
                        opacity: Tween<double>(
                          begin: 1.0,
                          end: 0.0,
                        ).animate(animation),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          spacing: heightOf(10, context),
                          children: [
                            Text(
                              '${article.title}',
                              overflow: TextOverflow.fade,
                              style: AppStyles.bold16.copyWith(
                                color: AppColors.mainText(context),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'By:${article.author}',
                                    style: AppStyles.medium12.copyWith(
                                      color: AppColors.secTextColor,
                                    ),
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                                Text(
                                  'By:${article.publishedAt}',
                                  style: AppStyles.medium12.copyWith(
                                    color: AppColors.secTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        child: Container(
          padding: EdgeInsetsGeometry.all(widthOf(8, context)),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusGeometry.all(Radius.circular(16)),
            border: BoxBorder.all(color: AppColors.stroke(context)),
          ),
          child: Column(
            spacing: heightOf(10, context),
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                height: heightOf(220, context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: CachedNetworkImage(
                  imageUrl: '${article.urlToImage}',
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                        child: SizedBox(
                          child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                          ),
                        ),
                      ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                '${article.title}',
                overflow: TextOverflow.fade,
                style: AppStyles.bold16.copyWith(
                  color: AppColors.mainText(context),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'By:${article.author}',
                      style: AppStyles.medium12.copyWith(
                        color: AppColors.secTextColor,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Text(
                    'By:${article.publishedAt}',
                    style: AppStyles.medium12.copyWith(
                      color: AppColors.secTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
