import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:news/app utils/util.dart';
import 'package:news/app utils/app_colors.dart';
import 'package:news/app utils/app_styles.dart';
import 'package:news/models/news_data.dart';
import 'package:news/screens/news_details.dart';

class ExpandedNewsCard extends StatefulWidget {
  final Articles article;
  const ExpandedNewsCard({super.key, required this.article});

  @override
  State<ExpandedNewsCard> createState() => _ExpandedNewsCardState();
}

class _ExpandedNewsCardState extends State<ExpandedNewsCard> {
  @override
  Widget build(BuildContext context) {
    String? content = widget.article.content;
    return GestureDetector(
      onTap: () {
        setState(() {
          content = widget.article.title;
        });
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.black45,
        body: Align(
          alignment: AlignmentGeometry.bottomCenter,
          child: Hero(
            tag: widget.article.url!,
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  margin: EdgeInsets.only(bottom: heightOf(16, context)),
                  width: widthOf(361, context),
                  padding: EdgeInsetsGeometry.all(widthOf(8, context)),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundReversed(context),
                    borderRadius: BorderRadiusGeometry.all(Radius.circular(16)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    spacing: heightOf(10, context),
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        height: heightOf(220, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: '${widget.article.urlToImage}',
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                    value: downloadProgress.progress,
                                  ),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(
                        '$content',
                        overflow: TextOverflow.fade,
                        style: AppStyles.bold16.copyWith(
                          color: AppColors.mainTextReversed(context),
                        ),
                      ),
                      FilledButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetails(
                              url: widget.article.url!,
                              title: widget.article.title!,
                            ),
                          ),
                        ),
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(16)),
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
