import 'package:flutter/material.dart';

import 'manage/static_method.dart';
import 'values/colors.dart';
import 'values/dimens.dart';
import 'values/styles.dart';

class marketLeaders extends StatefulWidget {
  const marketLeaders({super.key});

  @override
  State<marketLeaders> createState() => _marketLeadersState();
}

class _marketLeadersState extends State<marketLeaders> {
  late BuildContext ctx;
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
        title: Text('Market Leaders',
            style: Sty().mediumText.copyWith(
                color: Clr().primaryblue,
                fontWeight: FontWeight.w600,
                fontSize: 18.0)),
        centerTitle: true,
      ),
      body: Container(
        height: Dim().d900,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/appbackground.png"),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(Dim().d16),
              child: TextFormField(
                // controller: searchCtrl,
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
                  hintText: 'Search by Company name',
                  hintStyle: Sty().mediumText.copyWith(
                    color: Clr().hintColor,
                    fontFamily: 'SourceSans3',
                  ),
                  // suffix: Image.asset('assets/cancel.png',
                  //     height: Dim().d12,
                  //     width: Dim().d12,
                  //     fit: BoxFit.fill),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
