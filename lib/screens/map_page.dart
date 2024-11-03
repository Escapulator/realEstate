import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app/utils/custom_form.dart';

class MapPage extends StatelessWidget {
  MapPage({super.key});

  final TextEditingController controller = TextEditingController();
  final FocusNode focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
              top: kToolbarHeight,
              left: 20.w,
              right: 20.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomForm(
                      height: 50.h,
                      width: 270.w,
                      radius: 50.r,
                      controller: controller,
                      focus: focus,
                      hintColor: Colors.grey,
                      icon: Icons.search,
                      hintText: 'Saint Petersbug'),
                  Container(
                    height: 50.r,
                    width: 50.r,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Icon(
                      Icons.swap_horiz,
                      color: Colors.grey,
                      size: 20.sp,
                    ),
                  )
                ],
              )),
          Positioned(
              top: 630.h,
              left: 20.w,
              right: 20.w,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50.r,
                      width: 50.r,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF6C6E6F).withOpacity(.5)),
                      child: Icon(Icons.money_sharp,
                          color: Colors.white, size: 18.sp),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PopupMenuButton(
                          position: PopupMenuPosition.under,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r)),
                          itemBuilder: (_) => [
                            PopupMenuItem(
                              value: 'Cosy areas',
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.security,
                                    color: Colors.grey,
                                    size: 12.sp,
                                  ),
                                  SizedBox(width: 3.w),
                                  Text(
                                    'Cosy areas',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 'Price',
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.wallet,
                                    color: Colors.grey,
                                    size: 12.sp,
                                  ),
                                  SizedBox(width: 3.w),
                                  Text(
                                    'Price',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 'Infrastructure',
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.query_builder,
                                    color: Colors.grey,
                                    size: 12.sp,
                                  ),
                                  SizedBox(width: 3.w),
                                  Text(
                                    'Infrastructure',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 'Without any layer',
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.layers,
                                    color: Colors.grey,
                                    size: 12.sp,
                                  ),
                                  SizedBox(width: 3.w),
                                  Text(
                                    'Without any layer',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          onSelected: (value) {
                            switch (value) {
                              case 'Cosy areas':
                                break;
                              case 'Price':
                                break;
                              case 'Without any layer':
                                break;
                              case 'Infrastructure':
                                break;
                              default:
                            }
                          },
                          icon: Container(
                            height: 50.r,
                            width: 50.r,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFF6C6E6F).withOpacity(.5)),
                            child: Icon(Icons.near_me_outlined,
                                color: Colors.white, size: 18.sp),
                          ),
                        ),
                        Container(
                          height: 50.r,
                          width: 150.w,
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          decoration: BoxDecoration(
                              color: const Color(0xFF6C6E6F).withOpacity(.5),
                              borderRadius: BorderRadius.circular(50.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.format_align_left,
                                  color: Colors.white, size: 18.sp),
                              Text(
                                'List of variants',
                                style: GoogleFonts.montserrat(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ]))
        ],
      ),
    );
  }
}
