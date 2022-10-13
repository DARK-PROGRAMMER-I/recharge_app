import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class  CarouselSliderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  CarouselSlider(
      items: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0.r),
            image: DecorationImage(
              image: AssetImage("assets/recharge_banner.png"),
              scale: 1.3,
              fit: BoxFit.cover,
            ),
          ),
        ),

        //2nd Image of Slider
        Container(
          margin: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0.r),
            image: DecorationImage(
              image: AssetImage("assets/recharge_banner.png"),
              scale: 1.3,
              fit: BoxFit.cover,
            ),
          ),
        ),

        //3rd Image of Slider
        Container(
          margin: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0.r),
            image: DecorationImage(
              image: AssetImage("assets/slide1.jpg"),
              scale: 1.3,
              fit: BoxFit.cover,
            ),
          ),
        ),

        //4th Image of Slider
        Container(
          margin: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0.r),
            image: DecorationImage(
              image: AssetImage("assets/recharge_banner.png"),
              scale: 1.3,
              fit: BoxFit.cover,
            ),
          ),
        ),

        //5th Image of Slider
        Container(
          margin: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0.r),
            image: DecorationImage(
              image: AssetImage("assets/recharge_banner.png"),
              scale: 1.3,
              fit: BoxFit.cover,
            ),
          ),
        ),

      ],

      //Slider Container properties
      options: CarouselOptions(
        height: 150.h,
        enlargeCenterPage: false,
        autoPlay: true,
        aspectRatio: 9 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: false,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 1,
      ),
    );
  }
}