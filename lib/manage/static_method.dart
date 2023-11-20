import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:jewelsy/home.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../account.dart';
import '../categoryPage.dart';
import '../collectionPage.dart';
import '../searchPage.dart';
import '../values/colors.dart';
import '../values/dimens.dart';
import '../values/styles.dart';
import 'app_url.dart';

class STM {
  void redirect2page(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  void replacePage(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => widget,
      ),
    );
  }

  void back2Previous(BuildContext context) {
    Navigator.pop(context);
  }

  void displayToast(String string) {
    Fluttertoast.showToast(msg: string, toastLength: Toast.LENGTH_SHORT);
  }

  openWeb(String url) async {
    await launchUrl(Uri.parse(url.toString()));
  }

  void finishAffinity(final BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => widget,
      ),
      (Route<dynamic> route) => false,
    );
  }

  void successDialog(context, message, widget) {
    AwesomeDialog(
            dismissOnBackKeyPress: false,
            dismissOnTouchOutside: false,
            context: context,
            dialogType: DialogType.SUCCES,
            animType: AnimType.SCALE,
            headerAnimationLoop: true,
            title: 'Success',
            desc: message,
            btnOkText: "OK",
            btnOkOnPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => widget),
              );
            },
            btnOkColor: Clr().successGreen)
        .show();
  }

  AwesomeDialog successWithButton(context, message, function) {
    return AwesomeDialog(
        dismissOnBackKeyPress: false,
        dismissOnTouchOutside: false,
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.SCALE,
        headerAnimationLoop: true,
        title: 'Success',
        desc: message,
        btnOkText: "OK",
        btnOkOnPress: function,
        btnOkColor: Clr().successGreen);
  }

  void successDialogWithAffinity(
      BuildContext context, String message, Widget widget) {
    AwesomeDialog(
            dismissOnBackKeyPress: false,
            dismissOnTouchOutside: false,
            context: context,
            dialogType: DialogType.SUCCES,
            animType: AnimType.SCALE,
            headerAnimationLoop: true,
            title: 'Success',
            desc: message,
            btnOkText: "OK",
            btnOkOnPress: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => widget,
                ),
                (Route<dynamic> route) => false,
              );
            },
            btnOkColor: Clr().successGreen)
        .show();
  }

  void successDialogWithReplace(
      BuildContext context, String message, Widget widget) {
    AwesomeDialog(
            dismissOnBackKeyPress: false,
            dismissOnTouchOutside: false,
            context: context,
            dialogType: DialogType.SUCCES,
            animType: AnimType.SCALE,
            headerAnimationLoop: true,
            title: 'Success',
            desc: message,
            btnOkText: "OK",
            btnOkOnPress: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => widget,
                ),
              );
            },
            btnOkColor: Clr().successGreen)
        .show();
  }

  void errorDialog(BuildContext context, String message) {
    AwesomeDialog(
            context: context,
            dismissOnBackKeyPress: false,
            dismissOnTouchOutside: false,
            dialogType: DialogType.ERROR,
            animType: AnimType.SCALE,
            headerAnimationLoop: true,
            title: 'Note',
            desc: message,
            btnOkText: "OK",
            btnOkOnPress: () {},
            btnOkColor: Clr().errorRed)
        .show();
  }

  void errorDialogWithReplace(
      BuildContext context, String message, Widget widget) {
    AwesomeDialog(
            dismissOnBackKeyPress: false,
            dismissOnTouchOutside: false,
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.SCALE,
            headerAnimationLoop: true,
            title: 'Note',
            desc: message,
            btnOkText: "OK",
            btnOkOnPress: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => widget,
                ),
              );
            },
            btnOkColor: Clr().errorRed)
        .show();
  }

  AwesomeDialog loadingDialog(BuildContext context, String title) {
    AwesomeDialog dialog = AwesomeDialog(
      width: 250,
      context: context,
      dismissOnBackKeyPress: true,
      dismissOnTouchOutside: false,
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.SCALE,
      body: WillPopScope(
        onWillPop: () async {
          displayToast('Something went wrong try again.');
          return true;
        },
        child: Container(
          height: Dim().d160,
          padding: EdgeInsets.all(Dim().d16),
          decoration: BoxDecoration(
            color: Clr().white,
            borderRadius: BorderRadius.circular(Dim().d32),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(Dim().d12),
                child: SpinKitSquareCircle(
                  color: Clr().primaryColor,
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.all(Dim().d4),
              //   child:Lottie.asset('animation/ShrmaAnimation.json',height: 90,
              //       fit: BoxFit.cover),
              // ),
              // SizedBox(
              //   height: Dim().d16,
              // ),
              Text(
                title,
                style: Sty().mediumBoldText,
              ),
            ],
          ),
        ),
      ),
    );
    return dialog;
  }

  Widget sb({
    double? h,
    double? w,
  }) {
    return SizedBox(
      height: h,
      width: w,
    );
  }

  void alertDialog(context, message, widget) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        AlertDialog dialog = AlertDialog(
          title: Text(
            "Confirmation",
            style: Sty().largeText,
          ),
          content: Text(
            message,
            style: Sty().smallText,
          ),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {},
            ),
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
        return dialog;
      },
    );
  }

  AwesomeDialog modalDialog(context, widget, color) {
    AwesomeDialog dialog = AwesomeDialog(
      dialogBackgroundColor: color,
      context: context,
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.SCALE,
      body: widget,
    );
    return dialog;
  }

  void mapDialog(BuildContext context, Widget widget) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.NO_HEADER,
      padding: EdgeInsets.zero,
      animType: AnimType.SCALE,
      body: widget,
      btnOkText: 'Done',
      btnOkColor: Clr().successGreen,
      btnOkOnPress: () {},
    ).show();
  }

  Widget setSVG(name, size, color) {
    return SvgPicture.asset(
      'assets/$name.svg',
      height: size,
      width: size,
      color: color,
    );
  }

  Widget emptyData(message) {
    return Center(
      child: Text(
        message,
        style: Sty().smallText.copyWith(
              color: Clr().primaryColor,
              fontSize: 18.0,
            ),
      ),
    );
  }

  List<BottomNavigationBarItem> getBottomList(index, b) {
    return [
      BottomNavigationBarItem(
        icon: b
            ? SvgPicture.asset(
                "assets/homebn.svg",
              )
            : index == 0
                ? SvgPicture.asset(
                    "assets/homefillbn.svg",
                    // color: index == 0 ? Clr().primaryColor : Clr().white,
                  )
                : SvgPicture.asset(
                    "assets/homebn.svg",
                  ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: index == 1
            ? SvgPicture.asset(
                "assets/cartfillbn.svg",
                // color: index == 1 ? Clr().white : null,
              )
            : SvgPicture.asset(
                "assets/cartbn.svg",
              ),
        label: 'Categories',
      ),
      BottomNavigationBarItem(
        icon: index == 2
            ? SvgPicture.asset(
                "assets/notificationfillbn.svg",
              )
            : SvgPicture.asset(
                "assets/notificationbn.svg",
              ),
        label: 'Offers',
      ),
      BottomNavigationBarItem(
        icon: index == 3
            ? SvgPicture.asset(
                "assets/persionfillbn.svg",
              )
            : SvgPicture.asset(
                "assets/profilebn.svg",
              ),
        label: 'My Profile',
      ),
    ];
  }

  firstBar(index, ctx) {
    return index == 0
        ? InkWell(
            onTap: () {
              STM().finishAffinity(ctx, Home());
            },
            child: Image.asset('assets/home_icon.png', height: Dim().d52))
        : InkWell(
            onTap: () {
              STM().finishAffinity(ctx, Home());
            },
            child: SvgPicture.asset('assets/home.svg'));
  }

  secondBar(index, ctx) {
    return index == 1
        ? InkWell(
            onTap: () {
              STM().replacePage(ctx, SearchPage());
            },
            child: Image.asset('assets/search_icon.png', height: Dim().d52))
        : InkWell(
            onTap: () {
              STM().redirect2page(ctx, SearchPage());
            },
            child: SvgPicture.asset('assets/search.svg'));
  }

  thirdBar(index, ctx) {
    return index == 2
        ? InkWell(
            onTap: () {
              STM().replacePage(ctx, categorPage());
            },
            child: Image.asset('assets/center.png', height: Dim().d52))
        : InkWell(
            onTap: () {
              STM().redirect2page(ctx, categorPage());
            },
            child: SvgPicture.asset('assets/center.svg'));
  }

  fourthBar(index, ctx) {
    return index == 3
        ? InkWell(
            onTap: () {
              STM().replacePage(ctx, collectionPage());
            },
            child: Image.asset('assets/collection_icon.png', height: Dim().d52))
        : InkWell(
            onTap: () {
              STM().redirect2page(ctx, collectionPage());
            },
            child: SvgPicture.asset('assets/collection.svg'));
  }

  fiveBar(index, ctx) {
    return index == 4
        ? InkWell(
            onTap: () {
              STM().replacePage(ctx, accountPage());
            },
            child: Image.asset('assets/percon.png', height: Dim().d52))
        : InkWell(
            onTap: () {
              STM().redirect2page(ctx, accountPage());
            },
            child: SvgPicture.asset('assets/percon.svg'));
  }

  buttonBar(index, ctx) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: Dim().d72 - 3,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(Dim().d20)),
            image: const DecorationImage(
                image: AssetImage('assets/bottom.jpg'), fit: BoxFit.fitWidth)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            firstBar(index, ctx),
            secondBar(index, ctx),
            thirdBar(index, ctx),
            fourthBar(index, ctx),
            fiveBar(index, ctx),
          ],
        ),
      ),
    );
  }

  //Dialer
  Future<void> openDialer(String phoneNumber) async {
    Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(Uri.parse(launchUri.toString()));
  }

  //WhatsApp
  Future<void> openWhatsApp(String phoneNumber) async {
    if (Platform.isIOS) {
      await launchUrl(Uri.parse("whatsapp:wa.me/$phoneNumber"));
    } else {
      await launchUrl(Uri.parse("whatsapp:send?phone=$phoneNumber"));
    }
  }

  Future<bool> checkInternet(context, widget) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      internetAlert(context, widget);
      return false;
    }
  }

  internetAlert(context, widget) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.SCALE,
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      body: Padding(
        padding: EdgeInsets.all(Dim().d20),
        child: Column(
          children: [
            // SizedBox(child: Lottie.asset('assets/no_internet_alert.json')),
            Text(
              'Connection Error',
              style: Sty().largeText.copyWith(
                    color: Clr().primaryColor,
                    fontSize: 18.0,
                  ),
            ),
            SizedBox(
              height: Dim().d8,
            ),
            Text(
              'No Internet connection found.',
              style: Sty().smallText,
            ),
            SizedBox(
              height: Dim().d32,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: Sty().primaryButton,
                onPressed: () async {
                  var connectivityResult =
                      await (Connectivity().checkConnectivity());
                  if (connectivityResult == ConnectivityResult.mobile ||
                      connectivityResult == ConnectivityResult.wifi) {
                    Navigator.pop(context);
                    STM().replacePage(context, widget);
                  }
                },
                child: Text(
                  "Try Again",
                  style: Sty().largeText.copyWith(
                        color: Clr().white,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    ).show();
  }

  String dateFormat(format, date) {
    return DateFormat(format).format(date).toString();
  }

  Future<dynamic> get(ctx, title, name) async {
    //Dialog
    AwesomeDialog dialog = STM().loadingDialog(ctx, title);
    dialog.show();
    Dio dio = Dio(
      BaseOptions(
        contentType: Headers.jsonContentType,
        responseType: ResponseType.plain,
      ),
    );
    String url = AppUrl.mainUrl + name;
    dynamic result;
    try {
      Response response = await dio.get(url);
      if (kDebugMode) {
        print("Url = $url\nResponse = $response");
      }
      if (response.statusCode == 200) {
        dialog.dismiss();
        result = json.decode(response.data.toString());
      }
    } on DioError catch (e) {
      debugPrint(e.message);
    }
    return result;
  }

  Future<dynamic> getWithoutDialog(ctx, name) async {
    Dio dio = Dio(
      BaseOptions(
        contentType: Headers.jsonContentType,
        responseType: ResponseType.plain,
      ),
    );
    String url = AppUrl.mainUrl + name;
    dynamic result;
    try {
      Response response = await dio.get(url);
      if (kDebugMode) {
        print("Url = $url\nResponse = $response");
      }
      if (response.statusCode == 200) {
        result = json.decode(response.data.toString());
      }
    } on DioError catch (e) {
      debugPrint(e.message);
    }
    return result;
  }

  Future<dynamic> postget(ctx, title, name, body, token) async {
    //Dialog
    AwesomeDialog dialog = STM().loadingDialog(ctx, title);
    dialog.show();
    Dio dio = Dio(
      BaseOptions(
        headers: {
          "Content-Type": "application/json",
          "responseType": "ResponseType.plain",
          "Authorization": "Bearer $token",
        },
      ),
    );
    String url = AppUrl.mainUrl + name;
    if (kDebugMode) {
      print("Url = $url\nBody = ${body.fields}");
    }
    dynamic result;
    try {
      Response response = await dio.post(url, data: body);
      if (kDebugMode) {
        print("Response = $response");
      }
      if (response.statusCode == 200) {
        dialog.dismiss();
        result = response.data;
        // result = json.decode(response.data.toString());
      }
    } on DioError catch (e) {
      debugPrint(e.message);
      // dialog.dismiss();
      // STM().errorDialog(ctx, e.message);
    }
    return result;
  }

  Future<dynamic> post(ctx, title, name, body) async {
    //Dialog
    AwesomeDialog dialog = STM().loadingDialog(ctx, title);
    dialog.show();
    Dio dio = Dio(
      BaseOptions(
        contentType: Headers.jsonContentType,
        responseType: ResponseType.plain,
      ),
    );
    String url = AppUrl.mainUrl + name;
    if (kDebugMode) {
      print("Url = $url\nBody = ${body.fields}");
    }
    dynamic result;
    try {
      Response response = await dio.post(url, data: body);
      if (kDebugMode) {
        print("Response = $response");
      }
      if (response.statusCode == 200) {
        dialog.dismiss();
        result = json.decode(response.data.toString());
      }
    } on DioError catch (e) {
      debugPrint(e.message);
      // STM().errorDialog(ctx, e.message);
    }
    return result;
  }

  Future<dynamic> postWithoutDialog(ctx, name, body) async {
    //Dialog
    Dio dio = Dio(
      BaseOptions(
        contentType: Headers.jsonContentType,
        responseType: ResponseType.plain,
      ),
    );
    String url = AppUrl.mainUrl + name;
    dynamic result;
    try {
      Response response = await dio.post(url, data: body);
      if (kDebugMode) {
        print("Url = $url\nBody = ${body.fields}\nResponse = $response");
      }
      if (response.statusCode == 200) {
        result = json.decode(response.data.toString());
      }
    } on DioError catch (e) {
      debugPrint(e.message);
    }
    return result;
  }

  Future<dynamic> postWithToken(ctx, title, name, body, token) async {
    //Dialog
    AwesomeDialog dialog = STM().loadingDialog(ctx, title);
    dialog.show();
    Dio dio = Dio(
      BaseOptions(
        headers: {
          "Content-Type": "application/json",
          "responseType": "ResponseType.plain",
          "Authorization": "Bearer $token",
        },
      ),
    );
    String url = AppUrl.mainUrl + name;
    if (kDebugMode) {
      print("Url = $url\nBody = ${body.fields}");
    }
    dynamic result;
    try {
      Response response = await dio.post(url, data: body);
      if (kDebugMode) {
        print("Response = $response");
      }
      if (response.statusCode == 200) {
        dialog.dismiss();
        result = response.data;
        // result = json.decode(response.data.toString());
      }
    } on DioError catch (e) {
      dialog.dismiss();
      STM().errorDialog(ctx, e.message);
    }
    return result;
  }

  Future<dynamic> getcat(ctx, title, name, token) async {
    Dio dio = Dio(
      BaseOptions(
        headers: {
          "Content-Type": "application/json",
          "responseType": "ResponseType.plain",
          "Authorization": "Bearer $token",
        },
      ),
    );
    String url = AppUrl.mainUrl + name;
    if (kDebugMode) {
      // print("Url = $url\nBody = ${body.fields}");
    }
    dynamic result;
    try {
      Response response = await dio.get(url);
      if (kDebugMode) {
        print("Response = $response");
      }
      if (response.statusCode == 200) {
        result = response.data;
      }
    } on DioError catch (e) {
      STM().errorDialog(ctx, e.message);
    }
    return result;
  }

  Widget loadingPlaceHolder() {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 0.6,
        color: Clr().primaryColor,
      ),
    );
  }

  Widget imageView(Map<String, dynamic> v) {
    return v['url'].toString().contains('assets')
        ? Image.asset(
            '${v['url']}',
            width: v['width'],
            height: v['height'],
            fit: v['fit'] ?? BoxFit.fill,
          )
        : CachedNetworkImage(
            width: v['width'],
            height: v['height'],
            fit: v['fit'] ?? BoxFit.fill,
            imageUrl: v['url'] ??
                'https://www.famunews.com/wp-content/themes/newsgamer/images/dummy.png',
            placeholder: (context, url) => STM().loadingPlaceHolder(),
          );
  }

  CachedNetworkImage networkimg(url) {
    return url == null
        ? CachedNetworkImage(
            imageUrl:
                'https://liftlearning.com/wp-content/uploads/2020/09/default-image.png',
            fit: BoxFit.cover,
            imageBuilder: (context, imageProvider) => Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Clr().lightGrey),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
          )
        : CachedNetworkImage(
            imageUrl: '$url',
            fit: BoxFit.cover,
            imageBuilder: (context, imageProvider) => Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                // borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
          );
  }
}
