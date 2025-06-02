import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/l10n/locale_keys.g.dart';

class TabSelection extends StatelessWidget {
  final int selectedTabIndex;
  final Function(int) onTabChanged;

  const TabSelection({
    super.key,
    required this.selectedTabIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        children: [
          Expanded(
            child: _buildTabItem(index: 0, title: LocaleKeys.now_showing.tr()),
          ),
          Expanded(
            child: _buildTabItem(index: 1, title: LocaleKeys.coming_soon.tr()),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem({required int index, required String title}) {
    final isSelected = selectedTabIndex == index;

    return GestureDetector(
      onTap: () => onTabChanged(index),
      child: Container(
        padding:  EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF333333) : const Color(0xFF222222),
          border: Border(
            bottom: BorderSide(
              color: isSelected ? Colors.white : Colors.transparent,
              width: 1,
            ),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
