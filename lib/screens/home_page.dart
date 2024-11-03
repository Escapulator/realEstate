import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app/widgets/offers_container.dart';

import '../utils/assets.dart';
import '../utils/colors.dart';
import '../utils/custom_form.dart';
import '../widgets/slide_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  bool _startSlideInfo = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));

    _animationController.forward().then((_) {
      setState(() {
        _startSlideInfo = true;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            stops: [0.35, 1],
            colors: [Color(0xFFFAFAFA), AppColors.primaryBgColor],
          ),
        ),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            _buildSearchRow(),
            SizedBox(height: 30.h),
            _buildAnimatedGreetings(),
            _buildOffersRow(),
            _buildSlideTransition(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomForm(
            height: 50.h,
            width: 180.w,
            radius: 12.r,
            controller: _controller,
            focus: _focusNode,
            hintColor: Colors.grey,
            icon: Icons.location_pin,
            hintText: 'Saint Petersburg',
          ),
          CircleAvatar(
            radius: 25.r,
            backgroundImage: const AssetImage(AppAssets.profilePic),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedGreetings() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                'Hi, Marina\n',
                textStyle: GoogleFonts.montserrat(
                  fontSize: 18.sp,
                  color: const Color(0xFFB8A682),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
            totalRepeatCount: 1,
            pause: const Duration(milliseconds: 1000),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
          AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                'let\'s select your\nperfect place',
                textStyle: GoogleFonts.montserrat(
                  fontSize: 24.sp,
                  color: const Color(0xFFB8A682),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
            totalRepeatCount: 1,
            pause: const Duration(milliseconds: 1000),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
        ],
      ),
    );
  }

  Widget _buildOffersRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OffersContainer(
            targetHeight: 170.r,
            targetWidth: 170.r,
            subTitle: '1034\n',
            title: 'BUY',
            textColor: Colors.white,
            circle: true,
            bgColor: AppColors.primaryColor,
          ),
          SizedBox(width: 18.w),
          OffersContainer(
            targetHeight: 170.h,
            targetWidth: 170.w,
            subTitle: '2212\n',
            circle: false,
            title: 'RENT',
            textColor: const Color(0xFFB7A47F),
            bgColor: AppColors.offWhite,
          ),
        ],
      ),
    );
  }

  Widget _buildSlideTransition() {
    return Align(
      alignment: Alignment.center,
      child: SlideTransition(
        position: _slideAnimation,
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          curve: Curves.linear,
          height: 670.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40.r),
          ),
          child: Column(
            children: [
              _buildMainSlideInfo(),
              _buildSideContainers(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainSlideInfo() {
    return Container(
      height: 220.h,
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 130.h,
        bottom: 10.h,
        left: 20.w,
        right: 20.w,
      ),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(AppAssets.furniture),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(40.r),
        border: Border.all(width: 10.w, color: Colors.white),
      ),
      child: SlideInfo(width: 370.w, startNow: _startSlideInfo),
    );
  }

  Widget _buildSideContainers() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildSideContainer(),
        _buildVerticalColumnContainers(),
      ],
    );
  }

  Widget _buildSideContainer() {
    return Container(
      height: 440.h,
      width: 195.w,
      padding: EdgeInsets.only(
        top: 340.h,
        bottom: 20.h,
        left: 5.w,
        right: 5.w,
      ),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(AppAssets.furniture),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(width: 10.w, color: Colors.white),
      ),
      child: SlideInfo(width: 170.w, startNow: _startSlideInfo),
    );
  }

  Widget _buildVerticalColumnContainers() {
    return Column(
      children: [
        _buildVerticalContainer(),
        _buildVerticalContainer(),
      ],
    );
  }

  Widget _buildVerticalContainer() {
    return Container(
      height: 220.h,
      width: 195.w,
      padding: EdgeInsets.only(
        top: 120.h,
        bottom: 20.h,
        left: 5.w,
        right: 5.w,
      ),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(AppAssets.furniture),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(width: 10.w, color: Colors.white),
      ),
      child: SlideInfo(width: 170.w, startNow: _startSlideInfo),
    );
  }
}
