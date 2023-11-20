import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jewelsy/sign_in.dart';
import 'package:jewelsy/values/colors.dart';
import 'package:jewelsy/values/demo.dart';
import 'package:jewelsy/values/dimens.dart';
import 'manage/static_method.dart';
import 'otp.dart';
import 'sign_up.dart';
import 'values/strings.dart';
import 'values/styles.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late BuildContext ctx;

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController mobileCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();


  final _formKey = GlobalKey<FormState>();
  bool isFocused = false;
  bool isFocused2 = false;
  bool isFocused3 = false;

  @override
  Widget build(BuildContext context) {
    ctx = context;

    return Scaffold(
      backgroundColor: Clr().white,
      extendBodyBehindAppBar: true,
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: Dim().d100,
        backgroundColor: Clr().transparent,
        elevation: 0,
        // leading: InkWell(
        //   onTap: (){
        //     STM().back2Previous(ctx);
        //   },
        //   child: Padding(
        //     padding:  EdgeInsets.all(16),
        //     child: SvgPicture.asset('assets/backicon.svg',),
        //   ),
        // ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/appbackground.png"), fit: BoxFit.cover),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Dim().d16),
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
                              const Text(
                                'Sign Up',
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
                                'Fill the detail to create account',
                                style: Sty().mediumText.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Clr().primaryColor,
                                ),
                              ),
                              SizedBox(
                                height: Dim().d20,
                              ),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 16.0),
                                child: SizedBox(
                                  height: 46,
                                  child: Focus(
                                    onFocusChange: (hasFocus) {
                                      setState(() {
                                        isFocused = hasFocus;
                                      });
                                    },
                                    child: TextFormField(
                                      controller: nameCtrl,
                                      onTapOutside:(event){
                                        FocusScope.of(context).unfocus();
                                      } ,

                                      cursorColor: Clr().textcolorsgray,
                                      style: Sty().mediumText,
                                      keyboardType: TextInputType.name,
                                      textInputAction: TextInputAction.done,
                                      obscureText: false,

                                      decoration: Sty().textFieldOutlineStyle.copyWith(

                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(width: 0.3),
                                              borderRadius: BorderRadius.circular(18)),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                              color: nameCtrl.text.isNotEmpty || isFocused ? Clr().primaryColor
                                                  : Clr().textForm,
                                            ),
                                          ),
                                          hintStyle: Sty().smallText.copyWith(
                                            color: Clr().grey,
                                          ),
                                          hintText: "Enter Full Name",
                                          counterText: "",
                                            contentPadding: EdgeInsets.symmetric(
                                              horizontal: Dim().d0,
                                              vertical: Dim().d14,
                                            ),
                                            prefixIconConstraints:BoxConstraints(minWidth: 23, maxHeight: 20),
                                            prefixIcon: Padding(
                                              padding: const EdgeInsets.only(right: 8,left: 12),
                                            child: SvgPicture.asset('assets/profilesignup.svg',color: nameCtrl.text.isNotEmpty || isFocused ? Clr().primaryColor
                                                : Clr().textForm,),
                                          )),
                                      maxLength: 10,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return Str().invalidUsername;
                                        } else {
                                          return null;
                                        }
                                      },

                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Dim().d16,
                              ), Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 16.0),
                                child: SizedBox(
                                  height: 46,
                                  child: Focus(
                                    onFocusChange: (hasFocus) {
                                      setState(() {
                                        isFocused2 = hasFocus;
                                      });
                                    },
                                    child: TextFormField(
                                      controller: mobileCtrl,
                                      onTapOutside:(event){
                                        FocusScope.of(context).unfocus();
                                      } ,

                                      cursorColor: Clr().textcolorsgray,
                                      style: Sty().mediumText,
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.done,
                                      obscureText: false,

                                      decoration: Sty().textFieldOutlineStyle.copyWith(

                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(width: 0.3),
                                              borderRadius: BorderRadius.circular(18)),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                              color: mobileCtrl.text.isNotEmpty || isFocused2 ? Clr().primaryColor
                                                  : Clr().textForm,
                                            ),
                                          ),
                                          hintStyle: Sty().smallText.copyWith(
                                            color: Clr().grey,
                                          ),
                                          hintText: "Enter Mobile Number",
                                          counterText: "",
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: Dim().d0,
                                            vertical: Dim().d14,
                                          ),
                                          prefixIconConstraints:BoxConstraints(minWidth: 23, maxHeight: 20),
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.only(right: 8,left: 12),
                                            child: SvgPicture.asset('assets/phoneic.svg',color: mobileCtrl.text.isNotEmpty || isFocused2 ? Clr().primaryColor
                                                : Clr().textForm,),
                                          )),
                                      maxLength: 10,
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            !RegExp(r'([5-9]{1}[0-9]{9})').hasMatch(value)) {
                                          return Str().invalidMobile;
                                        } else {
                                          return null;
                                        }
                                      },

                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Dim().d16,
                              ), Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 16.0),
                                child: SizedBox(
                                  height: 46,
                                  child: Focus(
                                    onFocusChange: (hasFocus) {
                                      setState(() {
                                        isFocused3 = hasFocus;
                                      });
                                    },
                                    child: TextFormField(
                                      controller: emailCtrl,
                                      onTapOutside:(event){
                                        FocusScope.of(context).unfocus();
                                      } ,

                                      cursorColor: Clr().textcolorsgray,
                                      style: Sty().mediumText,
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.done,
                                      obscureText: false,

                                      decoration: Sty().textFieldOutlineStyle.copyWith(

                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(width: 0.3),
                                              borderRadius: BorderRadius.circular(18)),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                              color: emailCtrl.text.isNotEmpty || isFocused3 ? Clr().primaryColor
                                                  : Clr().textForm,
                                            ),
                                          ),
                                          hintStyle: Sty().smallText.copyWith(
                                            color: Clr().grey,
                                          ),
                                          hintText: "Enter Email Address",
                                          counterText: "",
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: Dim().d0,
                                            vertical: Dim().d14,
                                          ),
                                          prefixIconConstraints:BoxConstraints(minWidth: 23, maxHeight: 20),
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.only(right: 8,left: 12),
                                            child: SvgPicture.asset('assets/mailsignup.svg',color:  emailCtrl.text.isNotEmpty || isFocused3 ? Clr().primaryColor
                                                : Clr().textForm,),
                                          )),
                                      maxLength: 10,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'This field is required';
                                        }
                                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                          return "Please enter a valid email address";
                                        }
                                        return null;
                                      },

                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Dim().d28,
                              ),



                              SizedBox(
                                width: Dim().d300,
                                height: 46,
                                child: ElevatedButton(
                                    onPressed: () {
                                      STM().redirect2page(ctx, OTP(sMobile:mobileCtrl.text.toString(),sPageType: 'register',));
                                      // if (_formKey.currentState!.validate()) {
                                      //   // STM().checkInternet(context, widget).then((value) {
                                      //   //   if (value) {
                                      //   //
                                      //   //   }
                                      //   // });
                                      // };
                                    },
                                    style: ElevatedButton.styleFrom(
                                        elevation: 2,
                                        backgroundColor: Clr().primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18),
                                        )),
                                    child: Center(
                                      child: Text(
                                        'Submit',
                                        style: Sty().mediumText.copyWith(color: Clr().white,fontSize: 16,
                                          fontFamily: 'Lora',
                                          fontWeight: FontWeight.w500,),
                                      ),
                                    )),
                              ),
                              // SizedBox(
                              //   height: Dim().d16,
                              // ),
                              // Row(
                              //   children: <Widget>[
                              //     Expanded(
                              //         child: Divider(
                              //       color: Clr().primaryColor,
                              //       endIndent: 20,
                              //       indent: 20,
                              //     )),
                              //     Text("or sign in with", style: Sty().smallText.copyWith()),
                              //     Expanded(
                              //       child: Divider(
                              //         color: Clr().primaryColor,
                              //         endIndent: 20,
                              //         indent: 20,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: Dim().d32,
                              // ),
                              // SizedBox(
                              //   width: Dim().d300,
                              //   height: 46,
                              //   child: ElevatedButton(
                              //       onPressed: () {
                              //
                              //         // STM().redirect2page(ctx, Home());
                              //         // if (_formKey.currentState!.validate()) {
                              //         //   STM().checkInternet(context, widget).then((value) {
                              //         //     if (value) {
                              //         //       loginOtp();
                              //         //     }
                              //         //   });
                              //         // }
                              //         // if (_formKey.currentState!.validate()) {
                              //         //   // STM().checkInternet(context, widget).then((value) {
                              //         //   //   if (value) {
                              //         //   //
                              //         //   //   }
                              //         //   // });
                              //         // };
                              //       },
                              //       style: ElevatedButton.styleFrom(
                              //           backgroundColor: Clr().white,
                              //           shape: RoundedRectangleBorder(
                              //               borderRadius: BorderRadius.circular(15),
                              //               side: BorderSide(color: Clr().borderColor))),
                              //       child: Center(
                              //         child: Row(
                              //           mainAxisAlignment: MainAxisAlignment.center,
                              //           children: [
                              //             SvgPicture.asset('assets/google.svg'),
                              //             SizedBox(
                              //               width: Dim().d12,
                              //             ),
                              //             Text(
                              //               'Continue with Google',
                              //               style: Sty()
                              //                   .mediumText
                              //                   .copyWith(color: Clr().textcolor),
                              //             ),
                              //           ],
                              //         ),
                              //       )),
                              // ),
                              SizedBox(
                                height: Dim().d40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Already have an Account?',
                                      style: Sty().smallText.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Clr().textcolor)),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  InkWell(
                                    onTap: (){
                                      STM().redirect2page(ctx, SignIn());
                                    },
                                    child: Text(
                                      "Sign In",
                                      textAlign: TextAlign.center,
                                      style: Sty().mediumText.copyWith(
                                          color: Clr().yellowdark,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
// void sendLogin() async {
//   FormData body = FormData.fromMap({
//     'phone': loginCtrl.text,
//     'password': passwordCtrl.text,
//     'type': 'login',
//   });
//   var result = await STM().post(ctx, Str().sendingOtp, 'otp-send', body);
//   var success = result['success'];
//   var message = result['message'];
//   if (success) {
//     STM().displayToast(message);
//     // STM().errorDialog(ctx, message);
//     STM().redirect2page(ctx, OTP( sMobile:loginCtrl.text,sPwdType: passwordCtrl.text,sPageType: 'login',));
//   } else {
//     STM().errorDialog(ctx, message);
//   }
// }


}
