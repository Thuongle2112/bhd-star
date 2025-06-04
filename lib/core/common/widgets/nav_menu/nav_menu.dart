import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/l10n/locale_keys.g.dart';
import '../../../utils/translations/bloc/language_bloc.dart';
import '../../../utils/translations/language_bottom_sheet.dart';

class NavMenu extends StatelessWidget {
  final Function() onClose;

  const NavMenu({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: double.infinity,
      color: const Color(0xFF171717),
      child: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(child: _buildBody(context)),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/logo/bhd_logo.png',
          width: MediaQuery.of(context).size.width * 0.5,
        ),
        Gap(8),
        Divider(color: const Color(0xFF333333), thickness: 1),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _buildMenuItem(
          icon: Icons.home_outlined,
          title: LocaleKeys.home_1.tr(),
          isSelected: true,
          onTap: () {},
        ),
        Divider(color: const Color(0xFF333333), thickness: 1),
        _buildMenuItem(
          icon: Icons.calendar_month_outlined,
          title: LocaleKeys.showtimes_1.tr(),
          onTap: () {},
        ),
        Divider(color: const Color(0xFF333333), thickness: 1),
        _buildMenuItem(
          icon: Icons.shopping_bag_outlined,
          title: LocaleKeys.store_1.tr(),
          onTap: () {},
        ),
        Divider(color: const Color(0xFF333333), thickness: 1),
        _buildMenuItem(
          icon: Icons.movie_outlined,
          title: LocaleKeys.media.tr(),
          onTap: () {},
        ),
        Divider(color: const Color(0xFF333333), thickness: 1),
        _buildMenuItem(
          icon: Icons.local_offer_outlined,
          title: LocaleKeys.promotions.tr(),
          onTap: () {},
        ),
        Divider(color: const Color(0xFF333333), thickness: 1),
        _buildMenuItem(
          icon: Icons.info_outline,
          title: LocaleKeys.account_information.tr(),
          onTap: () {},
        ),
        Divider(color: const Color(0xFF333333), thickness: 1),
        _buildMenuItem(
          icon: Icons.work_outline,
          title: LocaleKeys.careers.tr(),
          onTap: () {},
        ),
        Divider(color: const Color(0xFF333333), thickness: 1),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFooterItem(title: LocaleKeys.about_bhd_star.tr(), onTap: () {}),
          const SizedBox(height: 16),
          _buildFooterItem(
            title: LocaleKeys.terms_and_conditions.tr(),
            onTap: () {},
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_buildLanguageSwitcher(context)],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${LocaleKeys.version.tr()} 1.0.0',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    bool isSelected = false,
    required Function() onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? const Color(0xFF8BC34A) : Colors.white70,
        size: 22,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? const Color(0xFF8BC34A) : Colors.white,
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      onTap: onTap,
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }

  Widget _buildFooterItem({required String title, required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }

  Widget _buildLanguageSwitcher(BuildContext context) {
    final selectedLanguage = context
        .watch<LanguageBloc>()
        .getLanguageOptions()
        .firstWhere(
          (option) =>
              option.locale ==
              context.watch<LanguageBloc>().getSelectedLanguage(),
        );

    return GestureDetector(
      onTap: () {
        showLanguageBottomSheet(context); // Gọi hàm showBottomSheet
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white38),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.language, color: Colors.white, size: 14),
            const SizedBox(width: 8),
            Text(
              selectedLanguage.displayName, // Hiển thị ngôn ngữ đã chọn
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.arrow_drop_down, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
