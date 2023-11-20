import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jewelsy/home.dart';
import 'package:jewelsy/manage/static_method.dart';
import 'package:jewelsy/values/colors.dart';
import 'package:jewelsy/values/dimens.dart';

import 'values/styles.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late BuildContext ctx;
  TextEditingController searchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return WillPopScope(
      onWillPop: () async {
        STM().finishAffinity(ctx, Home());
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: STM().buttonBar(1, ctx),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Clr().white,
          leading: InkWell(
              onTap: () {
                STM().finishAffinity(ctx, Home());
              },
              child: Icon(Icons.arrow_back_ios, color: Clr().primaryblue)),
          title: Text('Search Designs',
              style: Sty().mediumText.copyWith(
                  color: Clr().primaryblue,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0)),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dim().d12),
              child: SvgPicture.asset('assets/insta.svg'),
            ),
          ],
        ),
        body: Container(
          height: Dim().d900,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/appbackground.png"),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(Dim().d16),
                  child: TextFormField(
                    controller: searchCtrl,
                    decoration: Sty().textFieldOutlineStyle.copyWith(
                          filled: true,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(Dim().d8),
                            child: Image.asset('assets/after_selecting.png',
                                height: Dim().d12,
                                width: Dim().d12,
                                fit: BoxFit.fill),
                          ),
                          fillColor: Clr().white,
                          hintText: 'Search any designs...',
                          hintStyle: Sty().mediumText.copyWith(
                                color: Clr().hintColor,
                                fontFamily: 'SourceSans3',
                              ),
                          suffix: Image.asset('assets/cancel.png',
                              height: Dim().d12,
                              width: Dim().d12,
                              fit: BoxFit.fill),
                        ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
