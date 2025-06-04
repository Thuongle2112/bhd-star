import 'package:bhd_star/core/l10n/locale_keys.g.dart';
import 'package:bhd_star/presentation/pages/home/home_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../core/common/widgets/nav_menu/nav_menu.dart';
import '../../core/utils/constants/app_assets_svg.dart';
import '../pages/profile_page/profile_page.dart';
import '../pages/shop_page/shop_page.dart';
import '../pages/show_time_page/show_time_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentTabIndex = 0;
  bool _isNavMenuOpen = false;

  late List<Widget> pages;
  late HomePage homePage;
  late ShowTimePage showTimePage;
  late ShopPage shopPage;
  late ProfilePage profilePage;

  @override
  void initState() {
    homePage = HomePage(
      onMenuPressed: () {
        setState(() {
          _isNavMenuOpen = true;
        });
      },
    );
    showTimePage = const ShowTimePage();
    shopPage = const ShopPage();
    profilePage = const ProfilePage();
    pages = [homePage, showTimePage, shopPage, profilePage];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const Color activeColor = Color(0xFF7FBF43);
    const Color inactiveColor = Color(0xFF8D8D8D);
    const Color backgroundColor = Color(0xFF181818);

    const double iconSize = 24.0;

    return Stack(
      children: [
        Scaffold(
          body: pages[_currentTabIndex],
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: backgroundColor,
              border: Border(
                top: BorderSide(color: Colors.black26, width: 0.5),
              ),
            ),
            child: BottomNavigationBar(
              currentIndex: _currentTabIndex,
              onTap: (int index) {
                setState(() {
                  _currentTabIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: backgroundColor,
              selectedItemColor: activeColor,
              unselectedItemColor: inactiveColor,
              selectedLabelStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
              unselectedLabelStyle: const TextStyle(fontSize: 12, height: 1.5),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedIconTheme: const IconThemeData(size: iconSize),
              unselectedIconTheme: const IconThemeData(size: iconSize),
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: SvgPicture.asset(
                      AppAssets.homeIcon,
                      colorFilter: ColorFilter.mode(
                        _currentTabIndex == 0 ? activeColor : inactiveColor,
                        BlendMode.srcIn,
                      ),
                      height: iconSize,
                      width: iconSize,
                    ),
                  ),
                  label: LocaleKeys.home.tr(),
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: SvgPicture.asset(
                      AppAssets.filmIcon,
                      colorFilter: ColorFilter.mode(
                        _currentTabIndex == 1 ? activeColor : inactiveColor,
                        BlendMode.srcIn,
                      ),
                      height: iconSize,
                      width: iconSize,
                    ),
                  ),
                  label: LocaleKeys.showtimes.tr(),
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: SvgPicture.asset(
                      AppAssets.shopIcon,
                      colorFilter: ColorFilter.mode(
                        _currentTabIndex == 2 ? activeColor : inactiveColor,
                        BlendMode.srcIn,
                      ),
                      height: iconSize,
                      width: iconSize,
                    ),
                  ),
                  label: LocaleKeys.store.tr(),
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: SvgPicture.asset(
                      AppAssets.profileIcon,
                      colorFilter: ColorFilter.mode(
                        _currentTabIndex == 3 ? activeColor : inactiveColor,
                        BlendMode.srcIn,
                      ),
                      height: iconSize,
                      width: iconSize,
                    ),
                  ),
                  label: LocaleKeys.personal.tr(),
                ),
              ],
            ),
          ),
        ),
        if (_isNavMenuOpen)
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isNavMenuOpen = false;
                        });
                      },
                      child: Container(color: Colors.black.withOpacity(0.5)),
                    ),
                  ),

                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    child: NavMenu(
                      onClose: () {
                        setState(() {
                          _isNavMenuOpen = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
