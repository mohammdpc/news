import 'package:flutter/material.dart';
import 'package:news/app utils/util.dart';
import 'package:news/app utils/app_styles.dart';
import 'package:news/app utils/app_colors.dart';


class DropDownMenuButton extends StatelessWidget {
  final List<String> labels;
  final void Function(bool?) action;
  final bool initialValue;
  const DropDownMenuButton({
    super.key,
    required this.labels,
    required this.action,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      onSelected: action,
      initialSelection: initialValue,
      width: widthOf(237, context),
      textStyle: AppStyles.medium20White,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: AppColors.mainText(context)),
        ),
      ),
      dropdownMenuEntries: [
        DropdownMenuEntry(value: false, label: labels[0]),
        DropdownMenuEntry(value: true, label: labels[1]),
      ],
    );
  }
}