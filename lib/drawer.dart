import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jewelsy/profile.dart';
import 'package:jewelsy/sign_in.dart';
import 'package:jewelsy/values/colors.dart';
import 'package:jewelsy/values/dimens.dart';
import 'package:jewelsy/values/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'account.dart';
import 'collectionPage.dart';
import 'manage/static_method.dart';
import 'marketleaders.dart';
import 'notification.dart';

Widget navBar(context, key, usertype) {
  var ctx = context;

  return SafeArea(
    child: ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
      child: Drawer(
        width: MediaQuery.of(context).size.width * 0.75,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/slider.png'))),
          child: WillPopScope(
            onWillPop: () async {
              if (key.currentState.isDrawerOpen) {
                key.currentState.openEndDrawer();
              }
              return true;
            },
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: Dim().d80,
                ),
                Image.asset('assets/JewelsyLogo.png', height: 45, width: 182),
                SizedBox(
                  height: Dim().d36
                  ,
                ),
                InkWell(onTap: (){
                  STM().redirect2page(ctx, marketLeaders());
                },
                  child: Padding(
                    padding: EdgeInsets.only(left: Dim().d20,bottom: Dim().d16,right: Dim().d12),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/s1.png',
                              height: Dim().d20,
                            ),
                            SizedBox(
                              width: Dim().d12,
                            ),
                            Text(
                              'Market Leaders',
                              style: Sty().mediumText.copyWith(
                                  color: Clr().primaryblue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: Dim().d14),
                            )
                          ],
                        ),
                        Image.asset('assets/s8.png',height: Dim().d28,)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    STM().redirect2page(ctx, accountPage());
                  },
                  child: Padding(
                    padding:  EdgeInsets.only(left: Dim().d20,bottom: Dim().d16,right: Dim().d12),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/s2.png',
                              height: Dim().d24,
                            ),
                            SizedBox(
                              width: Dim().d12,
                            ),
                            Text(
                              'Account Details',
                              style: Sty().mediumText.copyWith(
                                  color: Clr().primaryblue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: Dim().d14),
                            )
                          ],
                        ),
                        Image.asset('assets/s8.png',height: Dim().d28,)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    STM().redirect2page(ctx, collectionPage());
                  },
                  child: Padding(
                    padding:  EdgeInsets.only(left: Dim().d20,bottom: Dim().d16,right: Dim().d12),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/s3.png',
                              height: Dim().d24,
                            ),
                            SizedBox(
                              width: Dim().d12,
                            ),
                            Text(
                              'My Album',
                              style: Sty().mediumText.copyWith(
                                  color: Clr().primaryblue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: Dim().d14),
                            )
                          ],
                        ),
                        Image.asset('assets/s8.png',height: Dim().d28,)
                      ],
                    ),
                  ),
                ),
                InkWell(onTap: (){
                  STM().redirect2page(ctx, NotificationPage());
                },
                  child: Padding(
                    padding:  EdgeInsets.only(left: Dim().d20,bottom: Dim().d16,right: Dim().d12),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/s4.png',
                              height: Dim().d24,
                            ),
                            SizedBox(
                              width: Dim().d12,
                            ),
                            Text(
                              'Notifications',
                              style: Sty().mediumText.copyWith(
                                  color: Clr().primaryblue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: Dim().d14),
                            )
                          ],
                        ),
                        Image.asset('assets/s8.png',height: Dim().d28,)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: Dim().d20,bottom: Dim().d16,right: Dim().d12),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/s5.png',
                            height: Dim().d24,
                          ),
                          SizedBox(
                            width: Dim().d12,
                          ),
                          Text(
                            'Contact Us',
                            style: Sty().mediumText.copyWith(
                                color: Clr().primaryblue,
                                fontWeight: FontWeight.w600,
                                fontSize: Dim().d14),
                          )
                        ],
                      ),
                      Image.asset('assets/s8.png',height: Dim().d28,)
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: Dim().d20,bottom: Dim().d16,right: Dim().d12),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/s6.png',
                            height: Dim().d24,
                          ),
                          SizedBox(
                            width: Dim().d12,
                          ),
                          Text(
                            'Terms & Conditions',
                            style: Sty().mediumText.copyWith(
                                color: Clr().primaryblue,
                                fontWeight: FontWeight.w600,
                                fontSize: Dim().d14),
                          )
                        ],
                      ),
                      Image.asset('assets/s8.png',height: Dim().d28,)
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: Dim().d20,bottom: Dim().d16,right: Dim().d12),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/s7.png',
                            height: Dim().d24,
                          ),
                          SizedBox(
                            width: Dim().d12,
                          ),
                          Text(
                            'Privacy Policy',
                            style: Sty().mediumText.copyWith(
                                color: Clr().primaryblue,
                                fontWeight: FontWeight.w600,
                                fontSize: Dim().d14),
                          )
                        ],
                      ),
                      Image.asset('assets/s8.png',height: Dim().d28,)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

void close(key) {
  key.currentState.openEndDrawer();
}
