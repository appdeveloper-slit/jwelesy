import 'dart:convert';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jewelsy/values/colors.dart';
import 'package:jewelsy/values/dimens.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'account.dart';
import 'bottom_navigation/bottom_navigation.dart';
import 'drawer.dart';

import 'manage/static_method.dart';
import 'notification.dart';
import 'productdetails.dart';
import 'values/strings.dart';
import 'values/styles.dart';

class Home extends StatefulWidget {
  // final String? sPwdType;
  final String? sType;

  const Home({
    super.key,
    this.sType,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late BuildContext ctx;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

  TextEditingController mobileCtrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  dynamic profileData;
  File? imageFile;
  var profile;
  String? profilebaselist;
  String? sProfileImage;
  var logo;
  String? usertoken;
  int _currentTabIndex = 0;

  List<dynamic> imageList = [];
  List<String> base64List = [];

  List<File> resultList = [];
  List<dynamic> subscriptionList = [
    {
      'text': 'Projects',
      'status': 'Created',
      'price': '49',
      'img': 'assets/redtabbg.png'
    },
    {
      'text': 'Applications ',
      'status': 'Received',
      'price': '15',
      'img': 'assets/greenTab.png'
    },
    {
      'text': 'Applications',
      'status': 'Accepted',
      'price': '10',
      'img': 'assets/bluetabbg.png'
    },
    {
      'text': 'Projects',
      'status': 'Assigned',
      'price': '05',
      'img': 'assets/purpletabbg.png'
    }
  ];
  String? usertype;

  getSession() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      usertype = sp.getString("usertype") ?? "";
      debugPrint(usertype);
    });
    STM().checkInternet(context, widget).then((value) {
      if (value) {
        // getProfile();
        // gethome();
      }
    });
  }

  @override
  void initState() {
    getSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return DoubleBack(
      message: 'Please press back once again!!',
      child: Scaffold(
        key: scaffoldState,
        drawer: navBar(ctx, scaffoldState, usertype),
        backgroundColor: Clr().background,
        resizeToAvoidBottomInset: false,
        floatingActionButton: STM().buttonBar(0, ctx),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // extendBodyBehindAppBar: true,
        // bottomNavigationBar: bottomBarLayout(ctx, 0),
        appBar: AppBar(
          backgroundColor: Clr().background,
          elevation: 2,
          shadowColor: Clr().black.withOpacity(0.3),

          leading: InkWell(
            onTap: () {
              scaffoldState.currentState?.openDrawer();
              // scaffoldState.currentState?.openDrawer();
            },
            child: Padding(
              padding: EdgeInsets.all(12),
              child: SvgPicture.asset('assets/sidebarIc.svg'),
            ),
          ),
          titleSpacing: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Darshan Jadhav',
                style: TextStyle(
                  color: Color(0xFF417DB3),
                  fontSize: 18,
                  fontFamily: 'Lora',
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: 0.54,
                ),
              ),
              Text(
                'Welcome Back',
                style: Sty().mediumText.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Clr().textcolorall,
                      fontFamily: 'SourceSans3',
                    ),
              ),
            ],
          ),
          // flexibleSpace: barGredient(),
          actions: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        // STM().redirect2page(context, NotificationPage());
                      },
                      icon: SvgPicture.asset(
                        'assets/imageSearchicon.svg',
                      )),
                  IconButton(
                      onPressed: () {
                        STM().redirect2page(context, NotificationPage());
                      },
                      icon: SvgPicture.asset(
                        'assets/notificationic.svg',
                      ))
                ],
              ),
            ),
          ],
        ),
        // appBar: AppBar(
        //   backgroundColor: Clr().background,
        //   elevation: 1,
        //   // shadowColor:  Clr().background,
        //   // centerTitle: true,
        //   // leadingWidth: 100,
        //   leading: InkWell(
        //     onTap: (){
        //       STM().back2Previous(ctx);
        //     },
        //
        //     child: Padding(
        //       padding: const EdgeInsets.all(18.0),
        //       child: SvgPicture.asset('assets/menuic.svg',height: 50,width: 50),
        //     ),
        //   ),
        //   title: Text('Hi, Darshan Jadhav',style:Sty().mediumText.copyWith(
        //       fontSize: 18,
        //       fontWeight: FontWeight.w400,
        //       color: Clr().textcolorall,
        //       fontFamily: 'PlayfairDisplay'),
        //
        //   ),
        //   actions: [
        //     SvgPicture.asset('assets/notificationsbell.svg')
        //
        //   ],
        // ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: Dim().d16),
          physics: BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dim().d8,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Experience the fusion in our ',
                        style: TextStyle(
                          color: Color(0xFF272932),
                          fontSize: 24,
                          fontFamily: 'SourceSans3',
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.72,
                        ),
                      ),
                      TextSpan(
                        text: 'latest',
                        style: TextStyle(
                          color: Color(0xFFCEA401),
                          fontSize: 24,
                          fontFamily: 'SourceSans3',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.72,
                        ),
                      ),
                      TextSpan(
                        text: ' jewelry arrivals',
                        style: TextStyle(
                          color: Color(0xFF272932),
                          fontSize: 24,
                          fontFamily: 'SourceSans3',
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.72,
                        ),
                      ),
                    ],
                  ),
                ),

                // StaggeredGridView.countBuilder(
                //   crossAxisCount: 4, // Number of columns
                //   itemCount: 12, // Total number of items
                //   itemBuilder: (BuildContext context, int index) => Container(
                //     color: Colors.blue,
                //     child: Center(
                //       child: Text(
                //         'Item $index',
                //         style: TextStyle(fontSize: 20, color: Colors.white),
                //       ),
                //     ),
                //   ),
                //   staggeredTileBuilder: (int index) =>
                //       StaggeredTile.count(2, index.isEven ? 2 : 1),
                //   mainAxisSpacing: 4.0, // Vertical spacing between tiles
                //   crossAxisSpacing: 4.0, // Horizontal spacing between tiles
                // ),

                SizedBox(
                  height: Dim().d16,
                ),
                MasonryGridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  // <--- add this
                  shrinkWrap: true,
                  // <--- add this
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            STM().redirect2page(ctx, productDeatils());
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "http://source.unsplash.com/random?jewellery=$index",
                              // imageUrl:
                              // 'https://www.famunews.com/wp-content/themes/newsgamer/images/dummy.png',
                              placeholder: (context, url) =>
                                  STM().loadingPlaceHolder(),
                              errorWidget: (context, url, error) => Image.network(
                                  'https://www.famunews.com/wp-content/themes/newsgamer/images/dummy.png'),
                            ),

                            // Image.network(
                            //   "http://source.unsplash.com/random?jewellery=$index",
                            //   // "http://source.unsplash.com/random?sig=$index",
                            // ),
                          ),
                        ),
                        Positioned(
                            right: 5,
                            bottom: 5,
                            child: InkWell(
                              onTap: () {
                                albumLyt();
                              },
                              child: Image.asset('assets/like.png',
                                  height: Dim().d36),
                            )),
                      ],
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dim().d16,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Dim().d16,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: Dim().d100),
                  child: InkWell(
                    onTap: () {
                      STM().redirect2page(ctx, accountPage());
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: Color(0xFFCEA400),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x14000000),
                            blurRadius: 12,
                            offset: Offset(0, 3),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(Dim().d12),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Buy subscription',
                                    style: TextStyle(
                                      color: Color(0xFFCEA400),
                                      fontSize: 18,
                                      fontFamily: 'Source Sans Pro',
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.54,
                                    ),
                                  ),
                                  SizedBox(height: Dim().d12),
                                  Text(
                                    'You’ve reached a limit, to explore more design inspirations purchase plan now.',
                                    style: TextStyle(
                                      color: Color(0xFF272932),
                                      fontSize: 12,
                                      fontFamily: 'Source Sans Pro',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.36,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded,
                                color: Color(0xffCEA501))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       'Hiranandani Residency 3BHK Flat',
                //       style: Sty().mediumText.copyWith(color: Clr().textcolorall,fontSize: 16),
                //     ),
                //     // SizedBox(width: Dim().d4),
                //     Column(
                //       children: [
                //         Text(
                //           'Edit',
                //           style: Sty().mediumText.copyWith(color: Clr().primaryColor,fontSize: 14,height: 1.2, decoration: TextDecoration.underline,),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: Dim().d16,
                ),
                // Container(
                //   width: 161,
                //   height: 120,
                //   decoration: ShapeDecoration(
                //     color: Color(0xFFFFF7D9),
                //     shape: RoundedRectangleBorder(
                //       side: BorderSide(width: 1, color: Color(0xFFD4AD2A)),
                //       borderRadius: BorderRadius.circular(5),
                //     ),
                //   ),
                // )
                SizedBox(
                  height: Dim().d24,
                ),
                // Center(
                //   child: SizedBox(
                //     width: Dim().d300,
                //     height: 46,
                //     child: ElevatedButton(
                //         onPressed: () {
                //           if (_formKey.currentState!.validate()) {
                //             STM().redirect2page(ctx, SignIn());
                //             // STM().redirect2page(ctx, SignIn());
                //             // STM().checkInternet(context, widget).then((value) {
                //             //   if (value) {
                //             //
                //             //   }
                //             // });
                //           };
                //         },
                //         style: ElevatedButton.styleFrom(
                //             elevation: 0,
                //             backgroundColor: Clr().btncolor,
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(15),
                //             )),
                //         child: Center(
                //           child: Text(
                //             'Submit',
                //             style: Sty().mediumText.copyWith(color: Clr().white),
                //           ),
                //         )),
                //   ),
                // ),
                // SizedBox(height: Dim().d20),
                // Center(
                //   child: Text(
                //     'Skip',
                //     style: Sty().smallText.copyWith(
                //       color: Clr().textcolorsgray,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: Dim().d32,
                // ),
              ],
            ),
          ),
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
              if (list[index2]['type'] == 'url') {
                // delete(index2);
                // print(resultData['product_images'][index2]['id']);
                setState(() {
                  imageList.removeAt(index2);
                });
                // deleteImg(proId: resultData['product_images'][index2]['id'] );
              } else {
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
    var result = await STM()
        .postWithToken(ctx, Str().uploading, "add_product", body, usertoken);
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

  _showSuccessDialog(ctx) {
    AwesomeDialog(
      isDense: true,
      context: ctx,
      padding: EdgeInsets.zero,
      bodyHeaderDistance: 0,
      dialogBorderRadius: BorderRadius.circular(20),
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.BOTTOMSLIDE,
      alignment: Alignment.center,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 148,
            decoration: ShapeDecoration(
              color: Color(0xFFFFB3AC),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
            child: SizedBox(
              height: 10,
              width: 10,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Lottie.asset(
                  'animation/cancelanimation.json',
                  height: 10, width: 10,
                  // height: 58, width: 100, repeat: true, fit: BoxFit.cover
                ),
              ),
            ),
          ),
          SizedBox(
            height: Dim().d8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(
                  height: Dim().d16,
                ),
                Text(
                  'Project Cancel',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFEF3C2A),
                    fontSize: 20,
                    fontFamily: 'SourceSans3',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.50,
                  ),
                ),
                SizedBox(
                  height: Dim().d12,
                ),
                Text(
                  'You successfully cancel a project, and you are no longer able to work on it',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF181621),
                    fontSize: 16,
                    fontFamily: 'TT Chocolates Trl',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.50,
                  ),
                ),
                SizedBox(
                  height: Dim().d24,
                ),
                InkWell(
                  onTap: () {
                    STM().back2Previous(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 46,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFEF3C2A)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Okay',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFEF3C2A),
                          fontSize: 16,
                          fontFamily: 'TT Chocolates Trl',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.45,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ListView.separated(
          //   physics: BouncingScrollPhysics(),
          //   itemCount: instructionsList.length,
          //   padding: EdgeInsets.symmetric(horizontal: Dim().d4),
          //   shrinkWrap: true,
          //   itemBuilder: (ctx, index) {
          //     return infoLayout(ctx, index, instructionsList);
          //   },
          //   separatorBuilder: (context, index) {
          //     return SizedBox(
          //       height: Dim().d20,
          //     );
          //   },
          // ),
          SizedBox(
            height: Dim().d24,
          ),
        ],
      ),
    ).show();
  }

  _showSuccessDialog2(ctx) {
    AwesomeDialog(
      isDense: true,
      context: ctx,
      padding: EdgeInsets.zero,
      bodyHeaderDistance: 0,
      dialogBorderRadius: BorderRadius.circular(20),
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.BOTTOMSLIDE,
      alignment: Alignment.center,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 148,
            decoration: ShapeDecoration(
              color: Color(0xFFFFB3AC),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
            child: SizedBox(
              height: 10,
              width: 10,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Lottie.asset(
                  'animation/successanimation.json',
                  height: 10, width: 10,
                  // height: 58, width: 100, repeat: true, fit: BoxFit.cover
                ),
              ),
            ),
          ),
          SizedBox(
            height: Dim().d8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(
                  height: Dim().d16,
                ),
                Text(
                  'Project Cancel',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFEF3C2A),
                    fontSize: 20,
                    fontFamily: 'SourceSans3',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.50,
                  ),
                ),
                SizedBox(
                  height: Dim().d12,
                ),
                Text(
                  'You successfully cancel a project, and you are no longer able to work on it',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF181621),
                    fontSize: 16,
                    fontFamily: 'TT Chocolates Trl',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.50,
                  ),
                ),
                SizedBox(
                  height: Dim().d24,
                ),
                InkWell(
                  onTap: () {
                    STM().back2Previous(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 46,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFEF3C2A)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Okay',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFEF3C2A),
                          fontSize: 16,
                          fontFamily: 'TT Chocolates Trl',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.45,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ListView.separated(
          //   physics: BouncingScrollPhysics(),
          //   itemCount: instructionsList.length,
          //   padding: EdgeInsets.symmetric(horizontal: Dim().d4),
          //   shrinkWrap: true,
          //   itemBuilder: (ctx, index) {
          //     return infoLayout(ctx, index, instructionsList);
          //   },
          //   separatorBuilder: (context, index) {
          //     return SizedBox(
          //       height: Dim().d20,
          //     );
          //   },
          // ),
          SizedBox(
            height: Dim().d24,
          ),
        ],
      ),
    ).show();
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
                            TextButton(
                              onPressed: () {
                                STM().back2Previous(ctx);
                              },
                              child: Text('My Album',
                                  style: Sty().mediumText.copyWith(
                                      color: Clr().white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: Dim().d16,
                                      decoration: TextDecoration.none)),
                            ),
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
