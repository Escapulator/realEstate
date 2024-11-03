import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_app/utils/colors.dart';

class NavIcons extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  const NavIcons({super.key, required this.isSelected, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isSelected ? 60.r : 50.r,
      width: isSelected ? 60.r : 50.r,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? AppColors.primaryColor : AppColors.iconBgBlack),
      child: Center(
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
