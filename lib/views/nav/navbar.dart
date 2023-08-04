import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:smapur/shared/const.dart';
import 'package:smapur/views/nav/screen_index.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  late PageController _pageController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 500), curve: Curves.easeOutQuad);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: ScreenIndex().buildPageView(),
          ),
        ),
        bottomNavigationBar: DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, -10),
                  blurRadius: 8.0)
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: SlidingClippedNavBar(
              backgroundColor: ConstantsValue.primaryBgColor,
              iconSize: 30,
              barItems: <BarItem>[
                BarItem(
                  title: "Home",
                  icon: Icons.home,
                ),
                BarItem(
                  title: "Aktivitas",
                  icon: Icons.history_edu,
                ),
                BarItem(
                  title: "Iuran",
                  icon: Icons.monetization_on,
                ),
                BarItem(
                  title: "Pengaturan",
                  icon: Icons.settings,
                )
              ],
              selectedIndex: selectedIndex,
              onButtonPressed: onButtonPressed,
              activeColor: ConstantsValue.primaryText,
              inactiveColor: Colors.blue[300],
            ),
          ),
        ),
      ),
    );
  }
}
