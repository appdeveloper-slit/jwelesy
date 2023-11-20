import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jewelsy/values/colors.dart';
import 'package:jewelsy/values/dimens.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'manage/static_method.dart';
import 'values/strings.dart';
import 'values/styles.dart';

class OTP extends StatefulWidget {
  final String? sMobile;
  final String? sid;
  final String? sPwdType;
  final String? sPageType;
  final String? sName;
  final String? sAltNumber;
  final String? sEmail;

  const OTP({required this.sMobile, Key? key, this.sPwdType, this.sPageType, this.sName, this.sAltNumber, this.sEmail, this.sid}): super(key: key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  late BuildContext ctx;
  TextEditingController otpCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool again = false;
  String? _pinCode;

  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    ctx = context;

    return Scaffold(
      backgroundColor: Clr().white,
      resizeToAvoidBottomInset: true,
      // extendBodyBehindAppBar: true,
      //
      // appBar: AppBar(
      //   backgroundColor: Clr().transparent,
      //   elevation: 0,
      //   leading: InkWell(
      //     onTap: (){
      //       STM().back2Previous(ctx);
      //     },
      //     child: Padding(
      //       padding:  EdgeInsets.all(12),
      //       child: SvgPicture.asset('assets/back_arrow.svg'),
      //     ),
      //   ),
      // ),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: Dim().d100,
        backgroundColor: Clr().transparent,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            STM().back2Previous(ctx);
          },
          child: Padding(
            padding:  EdgeInsets.all(16),
            child: SvgPicture.asset('assets/backicon.svg'),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/appbackground.png"), fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: Dim().d16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(height:MediaQuery.of(context).size.height /7.5 ,width:MediaQuery.of(context).size.width ,),
                  Image.asset('assets/JewelsyLogo.png',height: 61,width: 255),
                  // SvgPicture.asset('assets/JewelsyLogo.svg',height: 100,width: 80),
                  SizedBox(
                    height: Dim().d36,
                  ),
                  Container(
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.15),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.8, color: Color(0xFFC6C6C6)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Dim().d24,
                        ),
                        Text(
                          'OTP Verification',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF417DB3),
                            fontSize: 24,
                            fontFamily: 'Lora',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: Dim().d12,
                        ),
                        Text(
                          'Code has been sent to +91 ${widget.sMobile}',
                          textAlign: TextAlign.center,
                          style: Sty().mediumText.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Clr().primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: Dim().d32,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: PinCodeTextField(
                            controller: otpCtrl,
                            // errorAnimationController: errorController,
                            appContext: context,
                            enableActiveFill: true,
                            textStyle: Sty().largeText,
                            length: 4,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            animationType: AnimationType.scale,
                            cursorColor: Clr().primaryColor,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(16),
                              fieldWidth: Dim().d56,
                              fieldHeight: Dim().d52,
                              selectedFillColor: Clr().transparent,
                              activeFillColor: Clr().transparent,
                              inactiveFillColor: Clr().transparent,
                              borderWidth: 1,
                              inactiveColor: Clr().grey,
                              activeColor:Clr().primaryColor,
                              selectedColor: Clr().black,
                            ),
                            animationDuration: const Duration(milliseconds: 200),
                            onChanged: (value) {
                              _pinCode = value;
                            },
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'(.{4,})').hasMatch(value)) {
                                return "";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: Dim().d16,
                        ),
                        SizedBox(
                          width: Dim().d300,
                          height: 46,
                          child: ElevatedButton(
                              onPressed: () {
                                STM().finishAffinity(ctx, Home());
                                // print('${widget.sPageType == 'register'}');
                                // if(widget.sPageType == 'register'){
                                //   registerOtpVerify();
                                //   // loginOtp();
                                //   // STM().redirect2page(context, Home());
                                // }else {
                                //   if (_formKey.currentState!.validate()) {
                                //     print('${widget.sPwdType == 'ResetPass'}');
                                //     widget.sPwdType == 'ResetPass'
                                //         ? STM().redirect2page(ctx, ResetPass(sPwdType: 'ResetPass',))
                                //         : STM().redirect2page(ctx, ResetPass(sid: widget.sid.toString(),sName: widget.sName,sMobile:widget.sMobile.toString(),sAltNumber: widget.sAltNumber,sEmail: widget.sEmail,sPageType: 'register',));
                                //         // : STM().redirect2page(ctx, ResetPass());
                                //     // widget.sPageType == 'login'? loginOtp():registerOtp();
                                //   };
                                //     // STM().checkInternet(context, widget).then((value) {
                                //     //   if (value) {
                                //     //
                                //     //   }
                                //     // });
                                // }
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Clr().primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  )),
                              child: Center(
                                child: Text(
                                  'Verify',
                                  style: Sty().mediumText.copyWith(color: Clr().white),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: Dim().d20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '',
                              style: Sty().smallText.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Clr().textcolor),
                            ),
                            Visibility(
                              visible: !again,
                              child: TweenAnimationBuilder<Duration>(
                                  duration: const Duration(seconds: 20),
                                  tween: Tween(
                                      begin: const Duration(seconds: 20),
                                      end: Duration.zero),
                                  onEnd: () {
                                    // ignore: avoid_print
                                    // print('Timer ended');
                                    setState(() {
                                      again = true;
                                    });
                                  },
                                  builder: (BuildContext context, Duration value,
                                      Widget? child) {
                                    final minutes = value.inMinutes;
                                    final seconds = value.inSeconds % 60;
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5),
                                      child: Text(
                                        "0$minutes:$seconds",
                                        textAlign: TextAlign.center,
                                        style: Sty().smallText.copyWith(
                                            color: Clr().primaryColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    );
                                  }),
                            ),
                            // Visibility(
                            //   visible: !isResend,
                            //   child: Text("I didn't receive a code! ${(  sTime  )}",
                            //       style: Sty().mediumText),
                            // ),
                            Visibility(
                              visible: again,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    again = false;
                                  });
                                  // resendOtp();
                                  // STM.checkInternet().then((value) {
                                  //   if (value) {
                                  //     sendOTP();
                                  //   } else {
                                  //     STM.internetAlert(ctx, widget);
                                  //   }
                                  // });
                                },
                                child: Text(
                                  'Resend Code',
                                  style: Sty().smallText.copyWith(
                                      color: Clr().primaryColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Dim().d24,
                        ),
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
  void resendOTP() async {
    //Input
    FormData body = FormData.fromMap({
      // 'phone': widget.smobile,
    });
    //Output
    var result = await STM().post(ctx, Str().sendingOtp, "resend_otp", body);
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (!mounted) return;
    var success = result['success'];
    var message = result['message'];
    if (success) {
      STM().displayToast(message);
    } else {
      STM().errorDialog(ctx,message);
      // _showSuccessDialog(ctx,message);
    }
  }

  void registerOtpVerify() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    FormData body = FormData.fromMap({
      'phone': widget.sMobile,
      'type': widget.sPageType,
      'otp': otpCtrl.text,
    });
    var result = await STM().post(ctx, Str().verifying, 'otp-verify', body);
    var success = result['success'];
    var message = result['message'];
    if (success == false) {
      STM().errorDialog(ctx, message);
    } else {
      setState(() {
        // _showSuccessDialog(ctx, message, Home());
        STM().displayToast(message);
        // STM().redirect2page(ctx, ResetPass(sid: widget.sid.toString(),sName: widget.sName,sMobile:widget.sMobile.toString(),sAltNumber: widget.sAltNumber,sEmail: widget.sEmail,sPageType: 'register',));
        // sp.setString('user_id', result['data']['id'].toString());
        // sp.setString('token', result['data']['token'].toString());
        // sp.setBool('login', true);
        // STM().displayToast(message);
        // STM().redirect2page(ctx, Home());
        // STM().finishAffinity(ctx, MyPetDetails());
      });
    }
  }

  // void sendLogin() async {
  //   FormData body = FormData.fromMap({
  //     'phone': loginCtrl.text,
  //     'password': passwordCtrl.text,
  //     'page_type': 'login',
  //   });
  //   var result = await STM().post(ctx, Str().sendingOtp, 'login', body);
  //   var success = result['success'];
  //   var message = result['message'];
  //   if (success) {
  //     STM().displayToast(message);
  //     // STM().errorDialog(ctx, message);
  //     STM().redirect2page(ctx, OTP( sMobile:loginCtrl.text,));
  //   } else {
  //     STM().errorDialog(ctx, message);
  //   }
  // }
}
