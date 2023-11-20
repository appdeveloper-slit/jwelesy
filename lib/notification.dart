import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jewelsy/toolbar/toolbar.dart';
import 'package:jewelsy/values/strings.dart';
import 'package:readmore/readmore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bottom_navigation/bottom_navigation.dart';
import 'home.dart';
import 'manage/static_method.dart';
import 'values/colors.dart';
import 'values/dimens.dart';
import 'values/styles.dart';


class NotificationPage extends StatefulWidget {
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late BuildContext ctx;
  String? sUserid;
  // List<dynamic> NotificationList = [];
  List<dynamic> NotificationList = [
    {
      'title': 'Malad Enterprise Boq applications',
      'description': 'Lorem ipsum dolor sit amet consectetur. Amet erat ac auctor tellus sed sed velit urna. Morbi pellentesque dignissim mus porfsisat',
      'created_at': '07 oct 2023 / 12:45:01 pm',
      'img': 'assets/redtabbg.png'
    },
    {
      'title': 'Malad Enterprise Boq applications',
      'description': 'Lorem ipsum dolor sit amet consectetur. Amet erat ac auctor tellus sed sed velit urna. Morbi pellentesque dignissim mus porfsisat',
      'created_at': '07 oct 2023 / 12:45:01 pm',
      'img': 'assets/redtabbg.png'
    },
    {
      'title': 'Malad Enterprise Boq applications',
      'description': 'Lorem ipsum dolor sit amet consectetur. Amet erat ac auctor tellus sed sed velit urna. Morbi pellentesque dignissim mus porfsisat Amet erat ac auctor tellus sed sed velit urna. Morbi pellentesque dignissim mus porfsisat',
      'created_at': '07 oct 2023 / 12:45:01 pm',
      'img': 'assets/redtabbg.png'
    }

  ];



  getSession() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      sUserid = sp.getString('userid') ?? '';
      sp.setString('date', '${DateTime.now()}');
    });
    STM().checkInternet(ctx, widget).then((value) {
      if (value) {
        // getNotification();
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

    return WillPopScope(
      onWillPop: () async {
        STM().finishAffinity(ctx, Home());
        return false;
      },
      child: Scaffold(
        backgroundColor: Clr().white,

        bottomNavigationBar: bottomBarLayout(ctx, 0,b: true),
        //   appBar :AppBar(
        //   backgroundColor: Clr().background,
        //   elevation: 1,
        //   // shadowColor:  Clr().background,
        //   // centerTitle: true,
        //   leading: InkWell(
        //     onTap: (){
        //       STM().finishAffinity(ctx, Home());
        //       // STM().back2Previous(ctx);
        //     },
        //     child: Padding(
        //       padding:  EdgeInsets.all(18),
        //       child: SvgPicture.asset('assets/back_arrow.svg'),
        //     ),
        //   ),
        //   centerTitle: true,
        //   title: Text('Notifications',style:Sty().mediumText.copyWith(
        //       fontSize: 18,
        //       fontWeight: FontWeight.w400,
        //       color: Clr().textcolorall,
        //       fontFamily: 'PlayfairDisplay'),
        //   ),
        // ),
        // appBar: titleToolbarLayout(context, 'Notifications'),
        appBar: titleToolbarLayout(context, 'Notifications'),

        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(Dim().d16),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(  ),
                  itemCount: NotificationList.length,
                  itemBuilder: (context, index) {
                    var v = NotificationList[index];
                    return Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Clr().borderColor.withOpacity(0.7),
                            spreadRadius: 0.1,
                            blurRadius: 8,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Card(
                        elevation: 0,
                        margin: EdgeInsets.symmetric(horizontal: Dim().d0, vertical: Dim().d8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Dim().d16),side: BorderSide(
                            color: Color(0xffECECEC)
                        )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 12, left: 20,right: 20),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset('assets/notidiamond.png',height: 60,width: 60),
                                  SizedBox(width: Dim().d12,),
                                  Expanded(
                                    child: Text(
                                      'Titanium braided pearl ring is now uploaded',
                                      style: Sty().mediumText.copyWith(
                                          color: Clr().black,
                                          fontWeight: FontWeight.w400,fontSize: 16
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(),


                              SizedBox(
                                height: Dim().d8,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                // child: Text( '${v['description']}',
                                //   style: TextStyle(
                                //     fontWeight: FontWeight.w400,
                                //     fontSize: 15,
                                //     color: Color(0xff747688),
                                //   ),),
                                child: ReadMoreText(
                                  '${v['description']}',
                                  trimLines: 3,
                                  colorClickableText: Colors.pink,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: 'Read More',
                                  trimExpandedText: ' Show less',
                                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'SourceSans3',),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color(0xff181621),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16,),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Text('${v['created_at']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                        color: Color(0xFF646464),
                                    ),))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
  void getNotification() async {
    FormData body = FormData.fromMap({
      'user_id': sUserid,
      // 'tap_id': id,
    });
    var result = await STM().post(ctx, Str().loading, 'notifications', body);
    var success = result['success'];
    var message = result['message'];
    if (success) {
      setState(() {
        NotificationList = result['notifications'];
      });

    } else {
      STM().errorDialog(ctx, message);
    }
  }
}
