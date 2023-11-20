import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism/glassmorphism.dart';

import 'manage/static_method.dart';
import 'values/colors.dart';
import 'values/dimens.dart';
import 'values/styles.dart';

class productDeatils extends StatefulWidget {
  const productDeatils({super.key});

  @override
  State<productDeatils> createState() => _productDeatilsState();
}

class _productDeatilsState extends State<productDeatils> {
  late BuildContext ctx;
  int currentIndexPage = 0;
  List<String> imgList = [
    'assets/Mask_group.png',
    'assets/Mask_group.png',
    'assets/Mask_group.png',
    'assets/Mask_group.png',
    'assets/Mask_group.png',
    'assets/Mask_group.png',
  ];
  List<String> imageList = [
    'assets/c1.png',
    'assets/c2.png',
    'assets/c3.png',
    'assets/c1.png',
    'assets/c3.png',
  ];

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: STM().buttonBar(5, ctx),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Clr().white,
        leading: InkWell(
            onTap: () {
              STM().back2Previous(ctx);
            },
            child: Icon(Icons.arrow_back_ios, color: Clr().primaryblue)),
        title: Text('Titanium Diam...',
            style: Sty().mediumText.copyWith(
                color: Clr().primaryblue,
                fontWeight: FontWeight.w600,
                fontSize: 18.0)),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              albumLyt();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dim().d14, vertical: Dim().d16),
              child: Image.asset(
                'assets/like_icon.png',
                height: Dim().d20,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Dim().d16),
            child: Image.asset(
              'assets/share_icon.png',
              height: Dim().d20,
            ),
          ),
          SizedBox(width: Dim().d12),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: imgList.map((e) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(e.toString()), fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(Dim().d28),
                          bottomRight: Radius.circular(Dim().d28))),
                );
              }).toList(),
              options: CarouselOptions(
                  height: Dim().d350,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  aspectRatio: 3.0,
                  onPageChanged: (i, v) {
                    setState(() {
                      currentIndexPage = i;
                    });
                  }),
            ),
            SizedBox(height: Dim().d12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DotsIndicator(
                  dotsCount: imgList.length,
                  position: currentIndexPage,
                  mainAxisSize: MainAxisSize.min,
                  decorator: DotsDecorator(
                    spacing: EdgeInsets.symmetric(horizontal: Dim().d2),
                    color: Color(0xffBADDFF),
                    activeSize: Size(6.0, 6.0),
                    size: Size(6.0, 6.0),
                    activeColor: Color(0xff417DB3),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ],
            ),
            contentLay()
          ],
        ),
      ),
    );
  }

  Widget contentLay() {
    return Padding(
      padding: EdgeInsets.only(
          bottom: Dim().d120,
          left: Dim().d20,
          right: Dim().d20,
          top: Dim().d20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Titanium Diamond Ring',
            style: Sty().mediumText.copyWith(
                color: Color(0xff001011),
                fontWeight: FontWeight.w600,
                fontSize: 18.0),
          ),
          Padding(
            padding: EdgeInsets.only(top: Dim().d12, bottom: Dim().d8),
            child: Text(
              'Description:-',
              style: Sty().mediumText.copyWith(
                    color: Color(0xff656565),
                    fontSize: Dim().d16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'SourceSans3',
                  ),
            ),
          ),
          Text(
            "Lorem ipsum dolor sit amet consectetur. Mauris porta dapibus sem viverra nulla viverra praesent sit. Duis a donec amet nec rutrum elementum a. Eget facilisis sagittis tortor quis dictumst turpis.",
            style: Sty().mediumText.copyWith(
                color: Color(0xff272932),
                fontWeight: FontWeight.w400,
                fontFamily: 'SourceSans3',
                fontSize: Dim().d14),
          ),
          Padding(
            padding: EdgeInsets.only(top: Dim().d12, bottom: Dim().d20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Company Name',
                        style: Sty().smallText.copyWith(
                            color: Color(0xff656565),
                            fontFamily: 'SourceSans3',
                            fontSize: Dim().d12,
                            fontWeight: FontWeight.w400)),
                    Text('SOS Gold pvt. ltd',
                        style: Sty().mediumText.copyWith(
                            fontSize: Dim().d14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff272932)))
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: Dim().d52,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 30,
                            spreadRadius: 1)
                      ]),
                      child: SvgPicture.asset(
                        'assets/dialer_icon.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: Dim().d52,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 30,
                            spreadRadius: 1)
                      ]),
                      child: Image.asset(
                        'assets/whatsapp_icon.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Text(
            'Similar Images:-',
            style: Sty().mediumText.copyWith(
                  color: Color(0xff001011),
                  fontWeight: FontWeight.w600,
                  fontSize: Dim().d16,
                ),
          ),
          SizedBox(
              height: Dim().d160,
              child: ListView.builder(
                  itemCount: imageList.length,
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: Dim().d140,
                      width: Dim().d140,
                      margin: EdgeInsets.only(right: Dim().d4),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(imageList[index].toString()),
                              fit: BoxFit.cover)),
                    );
                  }))
        ],
      ),
    );
  }

  albumLyt() {
    return showDialog(
        context: context,
        builder: (context) {
          return Center(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dim().d12),
            child: GlassmorphicContainer(
              width: double.infinity,
              height: Dim().d180,
              borderRadius: 20,
              blur: 7,
              alignment: Alignment.bottomCenter,
              border: 2,
              linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFF0F0F0).withOpacity(0.1),
                  Color(0xFFF6F6F6).withOpacity(0.3),
                ],
              ),
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFF0F0F0).withOpacity(0.1),
                  Color((0xFFF6F6F6)).withOpacity(0.1),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(Dim().d20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              albumLyt1();
                            },
                            child: Text('Create New Album',
                                textAlign: TextAlign.end,
                                style: Sty().mediumText.copyWith(
                                    color: Color(0xffFEDF63),
                                    fontWeight: FontWeight.w500,
                                    fontSize: Dim().d12,
                                    decoration: TextDecoration.none)))
                      ],
                    ),
                    SizedBox(height: Dim().d12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipOval(
                                child: Image.asset(
                              'assets/e1.png',
                              height: Dim().d52,
                            )),
                            SizedBox(width: Dim().d12),
                            Text('My Album',
                                style: Sty().mediumText.copyWith(
                                    color: Clr().white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: Dim().d16,
                                    decoration: TextDecoration.none)),
                          ],
                        ),
                        Image.asset('assets/tick.png', height: Dim().d24)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ));
        });
  }

  albumLyt1() {
    return showDialog(
        context: context,
        builder: (context) {
          return Center(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dim().d12),
            child: GlassmorphicContainer(
              width: double.infinity,
              height: Dim().d260,
              borderRadius: 20,
              blur: 7,
              alignment: Alignment.bottomCenter,
              border: 2,
              linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFF0F0F0).withOpacity(0.1),
                  Color(0xFFF6F6F6).withOpacity(0.3),
                ],
              ),
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFF0F0F0).withOpacity(0.1),
                  Color((0xFFF6F6F6)).withOpacity(0.1),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(Dim().d20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('New Album',
                        style: Sty().mediumBoldText.copyWith(
                            decoration: TextDecoration.none,
                            color: Clr().white,
                            fontWeight: FontWeight.w600,
                            fontSize: Dim().d24)),
                    SizedBox(
                      height: Dim().d8,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: SizedBox(
                        width: Dim().d350,
                        height: Dim().d56,
                        child: TextFormField(
                          decoration: Sty().textFieldOutlineStyle.copyWith(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Color(0xffD0D0D0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Color(0xffD0D0D0),
                                  ),
                                ),
                                fillColor: Colors.transparent,
                                filled: true,
                                hintText: 'Enter Album Name',
                                hintStyle: Sty().smallText.copyWith(
                                      color: Color(0xffD0D0D0),
                                      fontSize: Dim().d14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'SourceSans3',
                                    ),
                              ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                STM().back2Previous(ctx);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Clr().white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(Dim().d14))),
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: Dim().d16),
                                child: Center(
                                    child: Text('Discard',
                                        style: Sty().mediumText.copyWith(
                                            color: Clr().primaryblue,
                                            fontSize: Dim().d16,
                                            fontWeight: FontWeight.w500))),
                              )),
                        ),
                        SizedBox(width: Dim().d12),
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                STM().back2Previous(ctx);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Clr().primaryblue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(Dim().d14))),
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: Dim().d16),
                                child: Center(
                                    child: Text('Save',
                                        style: Sty().mediumText.copyWith(
                                            color: Clr().white,
                                            fontSize: Dim().d16,
                                            fontWeight: FontWeight.w500))),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ));
        });
  }
}
