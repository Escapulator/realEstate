import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_app/screens/home_page.dart';
import 'package:real_estate_app/screens/map_page.dart';
import 'package:real_estate_app/widgets/nav_icons.dart';

import '../utils/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int select = 2;

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  toggleTab(int value) {
    select = value;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    _controller.forward().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
                position: _offsetAnimation,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  curve: Curves.linear,
                  child: Container(
                    height: 65.h,
                    width: 300.w,
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    margin: EdgeInsets.only(bottom: 15.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: AppColors.navBlack),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkResponse(
                              splashColor: Colors.transparent,
                              onTap: () {
                                toggleTab(0);
                              },
                              child: NavIcons(
                                  isSelected: select == 0, icon: Icons.search)),
                          InkResponse(
                              splashColor: Colors.transparent,
                              onTap: () {
                                toggleTab(1);
                              },
                              child: NavIcons(
                                  isSelected: select == 1,
                                  icon: Icons.message)),
                          InkResponse(
                              splashColor: Colors.transparent,
                              onTap: () {
                                toggleTab(2);
                              },
                              child: NavIcons(
                                  isSelected: select == 2, icon: Icons.home)),
                          InkResponse(
                              splashColor: Colors.transparent,
                              onTap: () {
                                toggleTab(3);
                              },
                              child: NavIcons(
                                  isSelected: select == 3,
                                  icon: Icons.favorite)),
                          InkResponse(
                              splashColor: Colors.transparent,
                              onTap: () {
                                toggleTab(4);
                              },
                              child: NavIcons(
                                  isSelected: select == 4, icon: Icons.person))
                        ]),
                  ),
                ))),
        body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 1000),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: select == 2
                ? const HomePage()
                : select == 0
                    ? MapPage()
                    : const Placeholder()));
  }
}
