import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jewelsy/sign_in.dart';
import 'package:jewelsy/toolbar/toolbar.dart';
import 'package:jewelsy/values/colors.dart';
import 'package:jewelsy/values/dimens.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom_navigation/bottom_navigation.dart';
import 'manage/static_method.dart';
import 'values/strings.dart';
import 'values/styles.dart';

class MyProfile extends StatefulWidget {
  // final String? sPwdType;
  final String? sType;
  const MyProfile({super.key, this.sType, });
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  late BuildContext ctx;

  TextEditingController mobileCtrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  dynamic profileData;
  File? imageFile;
  var profile;
  String? profilebaselist;
  String? sProfileImage;
  var logo;
  int _currentTabIndex = 0;


  List<dynamic> imageList = [];
  List<String> base64List = [];

  List<File> resultList = [];
  String? usertoken ;
  getSession() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      usertoken = sp.getString('token') ?? '';
    });
    STM().checkInternet(context, widget).then((value) {
      if (value) {
        print('${usertoken}vwergr');
        getCategaory();

      }
    });
  }

  @override
  void initState() {
    getSession();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ctx = context;
     var v = profileData;
    return Scaffold(
      backgroundColor: Clr().background,
      resizeToAvoidBottomInset: false,
      // extendBodyBehindAppBar: true,
      bottomNavigationBar: bottomBarLayout(ctx, 3),
      // appBar: AppBar(
      //   backgroundColor: Clr().background,
      //   elevation: 2,
      //   shadowColor: Clr().black.withOpacity(0.3),
      //   // shadowColor:  Clr().background,
      //   // centerTitle: true,
      //   leading: InkWell(
      //     onTap: (){
      //       STM().back2Previous(ctx);
      //     },
      //     child: Padding(
      //       padding:  EdgeInsets.all(18),
      //       child: SvgPicture.asset('assets/back_arrow.svg'),
      //     ),
      //   ),
      //   centerTitle: true,
      //   title: Text('My Profile',style:Sty().mediumText.copyWith(
      //       fontSize: 18,
      //       fontWeight: FontWeight.w400,
      //       color: Clr().textcolorall,
      //       fontFamily: 'PlayfairDisplay'),
      //   ),
      // ),
      appBar: titleToolbarLayout(context, 'My Profile'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal:Dim().d16),
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
         SizedBox(
           height: Dim().d52,
         ),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity, // A
                     decoration: ShapeDecoration(
                              color: Color(0xFFF4F4F4),
                              // color: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),// djust the width of the card as needed
                  height: Dim().d350, // Adjust the height of the card as needed
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[

                     SizedBox(height: Dim().d36,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/profilefilled.svg',height: 18,width: 20),
                            SizedBox(width: Dim().d12,),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Full Name:',
                                  style: TextStyle(
                                    color: Color(0xFF526272),
                                    fontSize: 12,
                                    fontFamily: 'SourceSans3',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: 0.24,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Row(
                                  children: [
                                    Text(
                                      '${v['name']}',
                                      // 'Darshan Jadhav',
                                      style: TextStyle(
                                        color: Color(0xFF181621),
                                        fontSize: 14,
                                        fontFamily: 'SourceSans3',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                        letterSpacing: 0.24,
                                      ),
                                    ),
                                    SizedBox(width: Dim().d8,),
                                    SvgPicture.asset('assets/blueMark.svg',width: 15,height: 15,)
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                          Container(

                            height: 20,
                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                            decoration: ShapeDecoration(
                              color: Color(0xFF5CB833),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // const SizedBox(width: 5),
                                SvgPicture.asset('assets/star.svg'),
                                SizedBox(width: 5),
                                Text(
                                  '4.5',
                                  style: TextStyle(
                                    color: Color(0xFFFCFCFC),
                                    fontSize: 12,
                                    fontFamily: 'SourceSans3',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                    letterSpacing: 0.24,
                                  ),
                                ),
                              ],
                            ),
                          )

                      ],),
                      SizedBox(height: Dim().d28,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/phoneicon.svg',height: 18,width: 20),
                              SizedBox(width: Dim().d12,),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mobile Number:',
                                    style: TextStyle(
                                      color: Color(0xFF526272),
                                      fontSize: 12,
                                      fontFamily: 'SourceSans3',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                      letterSpacing: 0.24,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    '${v['phone']}',
                                    // '+91 8934559234',
                                    style: TextStyle(
                                      color: Color(0xFF181621),
                                      fontSize: 14,
                                      fontFamily: 'SourceSans3',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                      letterSpacing: 0.24,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                          SvgPicture.asset('assets/editprofile.svg'),


                        ],),
                      SizedBox(height: Dim().d28,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/phoneicon.svg',height: 18,width: 20),
                              SizedBox(width: Dim().d12,),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Altrnate Mobile Number:',
                                    style: TextStyle(
                                      color: Color(0xFF526272),
                                      fontSize: 12,
                                      fontFamily: 'SourceSans3',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                      letterSpacing: 0.24,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    '${v['alt_phone']??''}',
                                    // '+91 8934559234',
                                    style: TextStyle(
                                      color: Color(0xFF181621),
                                      fontSize: 14,
                                      fontFamily: 'SourceSans3',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                      letterSpacing: 0.24,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),

                          SvgPicture.asset('assets/editprofile.svg'),

                        ],),
                      SizedBox(height: Dim().d28,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/mailic.svg',height: 12,width: 12),
                              SizedBox(width: Dim().d12,),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Email Address:',
                                    style: TextStyle(
                                      color: Color(0xFF526272),
                                      fontSize: 12,
                                      fontFamily: 'SourceSans3',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                      letterSpacing: 0.24,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    '${v['email']??''}',
                                    // 'dummy11real@gmail.com',
                                    style: TextStyle(
                                      color: Color(0xFF181621),
                                      fontSize: 14,
                                      fontFamily: 'SourceSans3',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                      letterSpacing: 0.24,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),

                          SvgPicture.asset('assets/editprofile.svg'),

                        ],),  SizedBox(height: Dim().d28,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/locknew.svg',height: 16,width: 16),
                              SizedBox(width: Dim().d12,),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Password:',
                                    style: TextStyle(
                                      color: Color(0xFF526272),
                                      fontSize: 12,
                                      fontFamily: 'SourceSans3',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                      letterSpacing: 0.24,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    '***************',
                                    style: TextStyle(
                                      color: Color(0xFF181621),
                                      fontSize: 14,
                                      fontFamily: 'SourceSans3',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                      letterSpacing: 0.24,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),

                          SvgPicture.asset('assets/editprofile.svg'),

                        ],),

                    ],
                  ),
                ),
                Positioned(
                  top:-40 ,
                  child:  SvgPicture.asset('assets/myprofileic.svg'),
                ),
              ],
            ),
            SizedBox(height: Dim().d24,),
            InkWell(
              onTap: (){
                // STM().redirect2page(context, OnBoarding());
              },
              child: Container(
                height: Dim().d100,
                width: MediaQuery.of(context).size.width, // Make the container take the full width

                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Clr().greyborder,
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                  image: DecorationImage(

                    image: AssetImage('assets/goldTabhome.png'), // Replace with your image path
                    fit: BoxFit.fill, // Adjust the fit as needed
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ELEMANTRA Verification',
                        style: TextStyle(
                          color: Color(0xFF7E5E04),
                          fontSize: 18,
                          fontFamily: 'TT Chocolates Trl',
                          fontWeight: FontWeight.w700,
                          height: 0.07,
                          letterSpacing: 0.25,
                        ),
                      ),
                      SizedBox(
                        height: Dim().d16,
                      ),

                      SizedBox(
                        width: 226,
                        child: Text(
                          'Get verified by Elemantra for more benefits',
                          style: TextStyle(
                            color: Color(0xFF936D00),
                            fontSize: 14,
                            fontFamily: 'TT Chocolates Trl',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: Dim().d24,),
            Container(
              width: double.infinity, // A
              decoration: ShapeDecoration(
                color: Color(0xFFF4F4F4),
                // color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),// djust the width of the card as needed
              height:208, // Adjust the height of the card as needed
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[


                  // SizedBox(height: Dim().d4,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Row(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Company Details',
                                style: TextStyle(
                                  color: Color(0xFF181621),
                                  fontSize: 16,
                                  fontFamily: 'PlayfairDisplay',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.50,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'Fill out your professional information',
                                style: TextStyle(
                                  color: Color(0xFF526272),
                                  fontSize: 12,
                                  fontFamily: 'SourceSans3',
                                  fontWeight: FontWeight.w400,

                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SvgPicture.asset('assets/arrow.svg'),

                    ],),
                  SizedBox(height: Dim().d6,),
                  Divider(thickness: 1,color:  Color(0xFFC7CAD3)),
                  SizedBox(height: Dim().d6,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Row(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Work Preferences',
                                style: TextStyle(
                                  color: Color(0xFF181621),
                                  fontSize: 16,
                                  fontFamily: 'PlayfairDisplay',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.50,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'Get personalized projects according to your needs',
                                style: TextStyle(
                                  color: Color(0xFF526272),
                                  fontSize: 12,
                                  fontFamily: 'SourceSans3',
                                  fontWeight: FontWeight.w400,

                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SvgPicture.asset('assets/arrow.svg'),

                    ],),
                  SizedBox(height: Dim().d6,),
                  Divider(thickness: 1,color:  Color(0xFFC7CAD3)),
                  SizedBox(height: Dim().d6,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Row(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Work Sample',
                                style: TextStyle(
                                  color: Color(0xFF181621),
                                  fontSize: 16,
                                  fontFamily: 'PlayfairDisplay',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.50,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'Upload your past projects, Let client knows your work',
                                style: TextStyle(
                                  color: Color(0xFF526272),
                                  fontSize: 12,
                                  fontFamily: 'SourceSans3',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SvgPicture.asset('assets/arrow.svg'),

                    ],),
                  SizedBox(height: Dim().d6,),


                ],
              ),
            ),
            SizedBox(height: Dim().d32,),
            Column(
              children: [
                Center(
                  child: SizedBox(
                    width: Dim().d300,
                    height: Dim().d48,
                    child: ElevatedButton(
                        onPressed: () {
                          // Navigator.of(context).pop();
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title:
                                  Text('Log Out', style: Sty().mediumBoldText),
                                  content: Text('Are you sure want to Log Out?',
                                      style: Sty().mediumText),
                                  actions: [
                                    TextButton(
                                        onPressed: () async{

                                          SharedPreferences sp =
                                          await SharedPreferences
                                              .getInstance();
                                          sp.setBool('login', false);
                                          sp.clear();
                                          STM().finishAffinity(ctx, SignIn());

                                          // deleteProfile();
                                        },
                                        child: Text('Yes',
                                            style: Sty().smallText.copyWith(
                                                color: Colors.red,
                                                fontWeight: FontWeight.w600))),
                                    TextButton(
                                        onPressed: () {
                                          STM().back2Previous(context);
                                        },
                                        child: Text('No',
                                            style: Sty().smallText.copyWith(
                                                fontWeight: FontWeight.w600))),
                                  ],
                                );
                              });
                          // deleteData();
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Clr().white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1,color: Clr().btncolor),
                              borderRadius: BorderRadius.circular(15),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/logout.svg',height: 18,width: 20),
                            SizedBox(width: Dim().d8),
                            Text(
                              'Logout',
                              style: Sty().mediumText.copyWith(color: Clr().btncolor),
                            ),
                          ],
                        )),
                  ),
                ),
                // SizedBox(
                //   height: Dim().d12,
                // ),

                TextButton(
                  onPressed: () {
                    // Navigator.of(context).pop();
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title:
                            Text('Delete Account', style: Sty().mediumBoldText),
                            content: Text('Are you sure want to delete account?',
                                style: Sty().mediumText),
                            actions: [
                              TextButton(
                                  onPressed: () async{

                                    SharedPreferences sp =
                                    await SharedPreferences
                                        .getInstance();
                                    sp.setBool('login', false);
                                    sp.clear();
                                    STM().finishAffinity(ctx, SignIn());

                                    // deleteProfile();
                                  },
                                  child: Text('Yes',
                                      style: Sty().smallText.copyWith(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w600))),
                              TextButton(
                                  onPressed: () {
                                    STM().back2Previous(context);
                                  },
                                  child: Text('No',
                                      style: Sty().smallText.copyWith(
                                          fontWeight: FontWeight.w600))),
                            ],
                          );
                        });
                    // deleteData();
                  },
                  child: Text(
                    'Delete my account',
                    style: TextStyle(
                      color: Color(0xFFEA0104),
                      fontSize: 12,
                      fontFamily: 'SourceSans3',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.24,
                    ),
                  ),
                ),

                SizedBox(
                  height: Dim().d24,
                ),


              ],
            ),

          ],
        ),
      ),
    );
  }

  Widget imageLayout(ctx, index2, list) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Clr().borderColor.withOpacity(0.4),
                  spreadRadius: 0.1,
                  blurRadius: 4,
                  offset: const Offset(2, 5), // changes position of shadow
                ),
              ],
              border: Border.all(color: Clr().borderColor),
              borderRadius: BorderRadius.circular(Dim().d8)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: list[index2]['type'] == 'url'
                  ? STM().imageView(list[index2]['image'])
                  : Image.file(list[index2]['image'])),
        ),
        Positioned(
          top: 2,
          right: 8,
          child: InkWell(
            onTap: () {
              if(list[index2]['type'] == 'url'){
                // delete(index2);
                // print(resultData['product_images'][index2]['id']);
                setState(() {
                  imageList.removeAt(index2);
                });
                // deleteImg(proId: resultData['product_images'][index2]['id'] );
              }else{
                setState(() {
                  imageList.removeAt(index2);
                });
              }
            },
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  color: Clr().primaryColor,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Clr().borderColor)),
              child: Icon(
                Icons.close,
                size: 18,
                color: Clr().white,
              ),
            ),
          ),
        )
      ],
    );
  }
  void addProduct() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    //Input
    FormData body = FormData.fromMap({
      // 'name': nameCtrl.text,
      // 'price': priceCtrl.text,
      // 'label1': label1Ctrl.text,
      // 'label2': label2Ctrl.text,
      // 'description1': desc1Ctrl.text,
      // 'description2': desc2Ctrl.text,
      // 'product_category_id': 4,
      // // 'product_category_id': categoryID,
      // 'vendor_id': vendorId,
      // 'image': jsonEncode(base64List),
      // 'image': resultList,
    });
    //Output
    var result = await STM().postWithToken(ctx, Str().uploading, "add_product", body, usertoken);
    // if (!mounted) return;
    var message = result['message'];
    var success = result['success'];
    if (success) {
      // STM().replacePage(ctx, AddEditProduct());
      STM().displayToast(message);
    } else {
      var message = result['message'];
      STM().errorDialog(ctx, message);
    }
  }

  void editProduct() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    //Input
    FormData body = FormData.fromMap({
      // 'id': widget.data!['id'].toString(),
      // 'name': nameCtrl.text,
      // 'price': priceCtrl.text,
      // 'label1': label1Ctrl.text,
      // 'label2': label2Ctrl.text,
      // 'description1': desc1Ctrl.text,
      // 'description2': desc2Ctrl.text,
      // 'product_category_id': categoryID,
      // 'vendor_id': vendorId,
      // // 'category id':resultData['product_category_id'].toString(),
      // 'category id': 1,
      // 'image': jsonEncode(base64List),
      // 'image': resultList,
    });
    //Output
    var result = await STM()
        .postWithToken(ctx, Str().uploading, "update_product", body, usertoken);
    // if (!mounted) return;
    // print(widget.data!['id'].toString());
    print('${base64List.length.toString()}fhjgfjsgfjsdg');
    var message = result['message'];
    var success = result['success'];
    if (success) {
      STM().successDialog(ctx, message, widget);
      // STM().redirect2page(ctx, AddEditProduct2());
      STM().displayToast(message);
    } else {
      var message = result['message'];
      STM().errorDialog(ctx, message);
    }
  }
  _getProfile(source) async {
    final pickedFile = await ImagePicker().getImage(
      source: source,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path.toString());
        STM().back2Previous(ctx);
        var image = imageFile!.readAsBytesSync();
        profile = base64Encode(image);
      });
      // if( widget.stype == 'edit') editImageMyPet();
    }

  }
  void getCategaory() async {
    var result = await STM().getcat(ctx, Str().loading, 'profile',usertoken);
    var success = result['success'];
    var message = result['message'];
    if (success) {
      setState(() {
        // List<dynamic> categoryList = [];
        profileData = result['data']['user'];
        // workTypeList = result['data']['workTypes'];
        // categoryList = result['data'];
      });
    } else {
      STM().displayToast(message);
    }
  }
}
