import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app/widgets/animated_number.dart';

class OffersContainer extends StatefulWidget {
  final double targetHeight;
  final double targetWidth;
  final String title;
  final String subTitle;
  final Color textColor;
  final Color bgColor;
  final bool circle;

  const OffersContainer({
    super.key,
    required this.targetHeight,
    required this.targetWidth,
    required this.subTitle,
    required this.title,
    required this.textColor,
    required this.bgColor,
    required this.circle,
  });

  @override
  State<OffersContainer> createState() => _OffersContainerState();
}

class _OffersContainerState extends State<OffersContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _widthAnimation = Tween<double>(begin: 0, end: widget.targetWidth)
        .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _heightAnimation = Tween<double>(begin: 0, end: widget.targetHeight)
        .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            alignment: Alignment.center,
            width: _widthAnimation.value,
            height: _heightAnimation.value,
            padding: EdgeInsets.only(top: 20.h),
            decoration: widget.circle
                ? BoxDecoration(shape: BoxShape.circle, color: widget.bgColor)
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(24.r),
                    color: widget.bgColor,
                  ),
            child: _controller.isCompleted
                ? Column(
                    children: [
                      Text(
                        widget.title,
                        style: GoogleFonts.montserrat(
                          fontSize: 14.sp,
                          color: widget.textColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      AnimatedNumber(
                        targetNumber: int.parse(widget.subTitle),
                        duration: const Duration(seconds: 3),
                        style: GoogleFonts.montserrat(
                          fontSize: 30.sp,
                          color: widget.textColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'offers',
                        style: GoogleFonts.montserrat(
                          fontSize: 18.sp,
                          color: widget.textColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                    ],
                  )
                : null,
          );
        },
      ),
    );
  }
}
