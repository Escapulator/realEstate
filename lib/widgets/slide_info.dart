import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app/utils/colors.dart';

class SlideInfo extends StatefulWidget {
  final double width;
  final bool startNow;

  const SlideInfo({super.key, required this.width, required this.startNow});

  @override
  State<SlideInfo> createState() => _SlideInfoState();
}

class _SlideInfoState extends State<SlideInfo> {
  double _currentWidth = 0;

  @override
  void initState() {
    super.initState();
    _checkStartAnimation();
  }

  @override
  void didUpdateWidget(covariant SlideInfo oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.startNow && !oldWidget.startNow) {
      _checkStartAnimation();
    }
  }

  void _checkStartAnimation() {
    if (widget.startNow) {
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _currentWidth = widget.width;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
        width: _currentWidth,
        height: 55.h,
        decoration: BoxDecoration(
          color: AppColors.offWhite.withOpacity(0.8),
          borderRadius: BorderRadius.circular(60.r),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Text(
                'GladKova St., 25',
                style: GoogleFonts.montserrat(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              right: 8.w,
              child: Container(
                height: 50.r,
                width: 50.r,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                  size: 24.r,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
