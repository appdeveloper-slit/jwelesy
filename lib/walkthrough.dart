import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'manage/static_method.dart';
import 'sign_in.dart';
import 'values/colors.dart';
import 'values/dimens.dart';
import 'values/styles.dart';

class FirstSlide extends StatefulWidget {
  const FirstSlide({Key? key}) : super(key: key);

  @override
  State<FirstSlide> createState() => _FirstSlideState();
}

class _FirstSlideState extends State<FirstSlide> {
  PageController controller = PageController();
  List<Map<String, dynamic>> pageList = [
    {
      'image': 'assets/onboardingbg1.png',
      'text': 'Where ideas sparkle',
      'subtitle':
          'Indulge in the beauty of unique jewelry designs and kickstart your creative journey on Jewelsy!',
    },
    {
      'image': 'assets/onboardingb2.png',
      'text': 'Create your dream collection',
      'subtitle':
          'Personalize your style by adding favorite jewelry designs to your Jewelsy treasure trove',
    },
    {
      'image': 'assets/onboardingb3.png',
      'text': "Discover what's trending",
      'subtitle':
          "Peek into the portfolios of market leaders and kickstart your design odyssey on Jewelsy's",
    },
  ];
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Clr().white,
      // appBar: titleToolbarLayout(context, 'Elemantra Onboarding'),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/appbackground.png"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            // SizedBox(height: MediaQuery.of(context).size.height/9),
            Expanded(
              child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: controller,
                  onPageChanged: (int index) {
                    setState(() {
                      currentindex = index;
                    });
                  },
                  itemCount: pageList.length,
                  itemBuilder: (context, index) {
                    return pageSlider(context, index, pageList);
                  }),
            ),
            Column(
              children: [
                if( currentindex != 2)   InkWell(
                    onTap: () async {
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();
                      currentindex == 2
                          ? STM().finishAffinity(context, SignIn())
                          : controller.animateToPage(
                              controller.page!.toInt() + 1,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                      currentindex == 2 ? sp.setBool('firstpage', true) : null;
                    },
                    child: SvgPicture.asset('assets/nextbutton.svg', width: 70,
                      height: 70,)),
               if( currentindex == 2)   InkWell(
                 onTap: () async {
                   SharedPreferences sp =
                   await SharedPreferences.getInstance();
                   currentindex == 2
                       ? STM().finishAffinity(context, SignIn())
                       : controller.animateToPage(
                       controller.page!.toInt() + 1,
                       duration: const Duration(milliseconds: 400),
                       curve: Curves.easeIn);
                   currentindex == 2 ? sp.setBool('firstpage', true) : null;
                 },

                 child: Container(
                    width: 190,
                    height: 60,
                    padding: const EdgeInsets.only(top: 7, left: 18, right: 10, bottom: 7),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Color(0xFF417DB3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x1E000000),
                          blurRadius: 12,
                          offset: Offset(0, 3),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 30),
                        Container(
                          width: 46,
                          height: 46,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x1E000000),
                                blurRadius: 12,
                                offset: Offset(0, 3),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: SvgPicture.asset('assets/forwordarrow.svg'),
                        ),
                      ],
                    ),
                  ),
               ),
                SizedBox(height: Dim().d44),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget pageSlider(ctx, index, list) {
    var v = list[index];
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.83,
        // height: 700,
        width: double.infinity,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40)),
          image: DecorationImage(
            image: AssetImage('${v['image']}'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                v['text'].toString(),
                style: Sty().smallText.copyWith(
                      color: Colors.white,
                      fontFamily: 'Lora',
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
              ),
            ),
            SizedBox(
              height: Dim().d8,
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                v['subtitle'].toString(),
                textAlign: TextAlign.start,
                style: Sty().smallText.copyWith(
                      color: Color(0xFFECF6FF),
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                    ),
              ),
            ),
            SizedBox(height: Dim().d48),
            SmoothPageIndicator(
              controller: controller,
              count: pageList.length,
              effect: ExpandingDotsEffect(
                  dotHeight: Dim().d6,
                  dotWidth: Dim().d6,
                  dotColor: const Color(0xffcfe7ff),
                  activeDotColor: Clr().primaryColor,
                  expansionFactor: 6.0,
                  spacing: 2.0),
            ),
                SizedBox(height: 10),
            // Image.asset('${v['image']}',height: 100,width: 100),
          ]),
        ),
      ),
    );
  }
}
