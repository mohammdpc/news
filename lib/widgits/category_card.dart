import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/app%20utils/app_colors.dart';
import 'package:news/app%20utils/app_styles.dart';
import 'package:news/blocks/settings_block.dart';
import '../app utils/util.dart';
import '../app utils/app_assets.dart';

class CategoryCard extends StatelessWidget {
  final VoidCallback action;
  final int index;
  const CategoryCard({super.key, required this.index,required this.action});

  @override
  Widget build(BuildContext context) {
    bool theme = context.watch<SettingsBlock>().state.theme;
    return Container(
      height: heightOf(198, context),
      padding: EdgeInsetsGeometry.all(widthOf(16, context)),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            theme
                ? AppAssets.darkCategoryImages[index]
                : AppAssets.categoryImages[index],
          ),
          fit: BoxFit.fill
        ),
        borderRadius: BorderRadiusGeometry.all(Radius.circular(24)),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: !(index%2 == 0)?CrossAxisAlignment.start:CrossAxisAlignment.end,
        children: [
          Text(AppAssets.categoryList[index],style: AppStyles.medium35white.copyWith(color: AppColors.mainTextReversed(context)),),
          FilledButton(
            onPressed: action,
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColors.secTextColor),
              padding: WidgetStatePropertyAll(EdgeInsets.zero),
              fixedSize: WidgetStatePropertyAll(
                Size(widthOf(167, context), heightOf(54, context)),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.all(
                    Radius.circular(heightOf(54, context)),
                  ),
                ),
              ),
            ),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: !(index%2 == 0)?TextDirection.ltr:TextDirection.rtl,
              children: [
                Container(
                  width: heightOf(54, context),
                  height: heightOf(54, context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.all(Radius.circular(heightOf(54, context))),
                    color: AppColors.background(context),
                  ),
                  child: Icon(!(index%2 == 0)?Icons.arrow_back_ios_rounded:Icons.arrow_forward_ios_rounded,color: AppColors.stroke(context),),
                ),
                Spacer(),
                Text('View All',style:AppStyles.medium24white.copyWith(color: AppColors.mainText(context)),),
                SizedBox(width: widthOf(16, context),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
