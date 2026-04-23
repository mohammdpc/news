import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/app utils/util.dart';
import 'package:news/app utils/app_colors.dart';
import 'package:news/blocks/settings_block.dart';
import 'package:news/screens/Main%20Screen/mian_screen_view_model.dart';
import 'package:news/widgits/drop_down_menu_button.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.darkBackground,
      width: widthOf(269, context),
      //shape: RoundedRectangleBorder(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: AppColors.lightBackground),
            child: Center(
              child: Text(
                'News App',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: AppColors.darkBackground,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthOf(16, context)),
            child: Column(
              children: [
                SizedBox(height: heightOf(8, context)),
                ListTile(
                  onTap: (){
                    context.read<MianScreenViewModel>().goHome();
                    Navigator.pop(context);
                  },
                  leading: Icon(
                    Icons.home_outlined,
                    weight: widthOf(24, context),
                    color: AppColors.lightBackground,
                  ),
                  title: Text(
                    'Go To Home',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: AppColors.lightBackground,
                    ),
                  ),
                ),
                SizedBox(height: heightOf(24, context)),
                Divider(color: AppColors.lightBackground),
                SizedBox(height: heightOf(24, context)),
                ListTile(
                  dense: true,
                  visualDensity: VisualDensity.compact,
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: widthOf(8, context),
                  leading: Image.asset(
                    themeIcon,
                    width: widthOf(24, context),
                  ),
                  title: Text(
                    'Theme',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: AppColors.lightBackground,
                    ),
                  ),
                ),
                SizedBox(height: heightOf(8, context)),
                DropDownMenuButton(
                  labels: ['Light', 'Dark'],
                  initialValue: context.watch<SettingsBlock>().state.theme,
                  action: (v) {
                    if (!v!) {
                      context.read<SettingsBlock>().themeToLight();
                    } else if (v) {
                      context.read<SettingsBlock>().themeToDark();
                    }
                  },
                ),
                SizedBox(height: heightOf(24, context)),
                Divider(color: AppColors.lightBackground),
                SizedBox(height: heightOf(24, context)),
                ListTile(
                  dense: true,
                  visualDensity: VisualDensity.compact,
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: widthOf(8, context),
                  leading: Image.asset(
                    languageIcon,
                    width: widthOf(24, context),
                  ),
                  title: Text(
                    'Language',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: AppColors.lightBackground,
                    ),
                  ),
                ),
                SizedBox(height: heightOf(8, context)),
                DropDownMenuButton(
                  labels: ['English', 'Arabic'],
                  initialValue: context.watch<SettingsBlock>().state.language,
                  action: (v) {
                    if (!v!) {
                      context.read<SettingsBlock>().switchLanguage();
                    } else if (v) {
                      context.read<SettingsBlock>().switchLanguage();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
