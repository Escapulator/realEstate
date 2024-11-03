import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomForm extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  final FocusNode focus;
  final TextEditingController controller;
  final String hintText;
  final Color hintColor;
  final IconData icon;
  const CustomForm(
      {super.key,
      required this.height,
      required this.width,
      required this.radius,
      required this.controller,
      required this.focus,
      required this.hintColor,
      required this.hintText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        padding: EdgeInsets.only(left: 8.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(radius)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon),
              SizedBox(width: 5.w),
              Flexible(
                  child: TextFormField(
                      onTapOutside: (event) {
                        focus.unfocus();
                      },
                      controller: controller,
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                        hintStyle: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: hintColor,
                            fontWeight: FontWeight.w600),
                      ),
                      focusNode: focus))
            ]));
  }
}
