import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/app utils/app_assets.dart';
import 'package:news/app utils/app_colors.dart';
import 'package:news/app utils/util.dart';
import 'package:news/screens/Main%20Screen/mian_screen_view_model.dart';

import 'package:news/widgits/category_card.dart';
import 'package:news/models/sources_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widthOf(15, context)),
      child: ListView(
        children: [
          Text(
            'Good Morning\nHere is Some News For You',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
              color: AppColors.mainText(context),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: AppAssets.categoryList.length,
            itemBuilder: (context, index) {
              return CategoryCard(
                index: index,
                action: ()  {
                  context.read<MianScreenViewModel>().getNews(index);
                },
              );
            },
            separatorBuilder: (context, index) =>
                SizedBox(height: heightOf(16, context)),
          ),
        ],
      ),
    );
  }
}
