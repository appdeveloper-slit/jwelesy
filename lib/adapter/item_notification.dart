import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../values/colors.dart';
import '../values/dimens.dart';
import '../values/styles.dart';

Widget itemNotification(ctx, v) {
  return Container(
    margin: EdgeInsets.symmetric(
      vertical: Dim().d8,
    ),
    decoration: BoxDecoration(
        color: Clr().white,
      borderRadius: BorderRadius.all(Radius.circular(10))
    ),
    padding: EdgeInsets.all(
      Dim().d16,
    ),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${v['message']}',
          style: Sty().mediumText,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: Dim().d8,
        ),
        // Html(
        //   data: list[index]['description'],
        //   shrinkWrap: true,
        //   style: {
        //     "body": Style(
        //       margin: Margins.all(0),
        //       padding: EdgeInsets.zero,
        //       fontFamily: 'Poppins',
        //       letterSpacing: 0.5,
        //       color: Clr().grey,
        //       fontSize: FontSize(16.0),
        //     ),
        //   },
        //   onLinkTap: (url, context, attrs, element) {
        //     STM().openWeb(url!);
        //   },
        // ),
        Text(
          '${v['desc']}',
          style: Sty().smallText.copyWith(
            color: Clr().textGrey,
            fontSize: 13,
          ),
        ),
        SizedBox(
          height: Dim().d8,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            '${v['date']}',
            style: Sty().smallText.copyWith(
              fontSize: 12,
                  color: Clr().textGrey,
                ),
          ),
        ),
      ],
    ),
  );
}
