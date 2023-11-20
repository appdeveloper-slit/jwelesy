
import 'package:flutter/material.dart';
import 'package:jewelsy/values/dimens.dart';
import '../manage/static_method.dart';
import '../values/colors.dart';

Widget bottomBarLayout(ctx, index, {b = false}) {
  return BottomNavigationBar(
    elevation: 0,
    // selectedItemColor: Clr().black,
    // unselectedItemColor: Clr().black,
    backgroundColor: Colors.transparent,
    type: BottomNavigationBarType.shifting,
    selectedItemColor: Clr().red,
    unselectedItemColor: Clr().white,
    showSelectedLabels: false,
    selectedFontSize: 0,
    currentIndex: index,
    onTap: (i) async {
      switch (i) {
        case 0:
        //   STM().finishAffinity(ctx, HomePage());
        //   break;
        // case 1:
        //   index == 1 ?  STM().replacePage(ctx,MyCart()) : STM().redirect2page(ctx,MyCart());
        //   break;
        // case 2:
        //   index == 2 ?  STM().replacePage(ctx, Notifications()) : STM().redirect2page(ctx,Notifications());
        //   break;
        // case 3:
        //   index == 3 ? STM().replacePage(ctx, MyProfile()): STM().redirect2page(ctx,MyProfile());
        //   break;
      }
    },
    items: STM().getBottomList(index, b),
  );
}
