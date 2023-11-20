import 'package:flutter/material.dart';
import 'manage/static_method.dart';
import 'values/colors.dart';
import 'values/dimens.dart';
import 'values/styles.dart';

class accountPage extends StatefulWidget {
  const accountPage({super.key});

  @override
  State<accountPage> createState() => _accountPageState();
}

class _accountPageState extends State<accountPage> {
  late BuildContext ctx;
  bool check = true;

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: STM().buttonBar(4, ctx),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Clr().white,
        leading: InkWell(
            onTap: () {
              STM().back2Previous(ctx);
            },
            child: Icon(Icons.arrow_back_ios, color: Clr().primaryblue)),
        title: Text('Account Details',
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Dim().d16),
              personalLayout(),
              SizedBox(height: Dim().d20),
              subuscrpLayout(),
              SizedBox(height: Dim().d32),
              logLayout(),
            ],
          ),
        ),
      ),
    );
  }

  personalLayout() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dim().d16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Color(0xff02111E).withOpacity(0.2),
              blurRadius: 12,
              spreadRadius: 0)
        ], color: Clr().white, borderRadius: BorderRadius.circular(Dim().d14)),
        child: Padding(
          padding: EdgeInsets.all(Dim().d16),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/p1.png',
                    height: Dim().d20,
                  ),
                  SizedBox(width: Dim().d12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Full Name',
                          style: Sty().smallText.copyWith(
                              color: Color(0xff656565),
                              fontSize: Dim().d12,
                              fontFamily: 'SourceSans3',
                              fontWeight: FontWeight.w400)),
                      Text('Darshan Jadhav',
                          style: Sty().smallText.copyWith(
                              color: Clr().black,
                              fontSize: Dim().d14,
                              fontWeight: FontWeight.w500))
                    ],
                  )
                ],
              ),
              SizedBox(
                height: Dim().d16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/p2.png',
                        height: Dim().d20,
                      ),
                      SizedBox(width: Dim().d12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mobile Number',
                              style: Sty().smallText.copyWith(
                                  color: Color(0xff656565),
                                  fontSize: Dim().d12,
                                  fontFamily: 'SourceSans3',
                                  fontWeight: FontWeight.w400)),
                          Text('98437423903',
                              style: Sty().smallText.copyWith(
                                  color: Clr().black,
                                  fontSize: Dim().d14,
                                  fontWeight: FontWeight.w500))
                        ],
                      )
                    ],
                  ),
                  Image.asset(
                    'assets/edit_icon.png',
                    height: Dim().d28,
                  ),
                ],
              ),
              SizedBox(
                height: Dim().d16,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/p3.png',
                    height: Dim().d20,
                  ),
                  SizedBox(width: Dim().d12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email Address',
                          style: Sty().smallText.copyWith(
                              color: Color(0xff656565),
                              fontFamily: 'SourceSans3',
                              fontSize: Dim().d12,
                              fontWeight: FontWeight.w400)),
                      Text('slitsdesigningfigma@gmail.com',
                          style: Sty().smallText.copyWith(
                              color: Clr().black,
                              fontSize: Dim().d14,
                              fontWeight: FontWeight.w500))
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  subuscrpLayout() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dim().d16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color(0xff02111E).withOpacity(0.2),
                  blurRadius: 12,
                  spreadRadius: 0)
            ],
            gradient: LinearGradient(
              colors: [Color(0xffFFDA46), Color(0xffFFD976)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(Dim().d14)),
        child: Padding(
          padding: EdgeInsets.all(Dim().d16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'My Subscription',
                style: Sty().mediumText.copyWith(
                    color: Color(0xff001011),
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0),
              ),
              SizedBox(
                height: Dim().d8,
              ),
              if (!check)
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Purchased on: ',
                          style: Sty().mediumText.copyWith(
                              fontSize: Dim().d14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'SourceSans3',
                              color: Color(0xff272932)),
                        ),
                        Text(
                          '12th Oct 2023',
                          style: Sty().mediumText.copyWith(
                              fontSize: Dim().d14,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'SourceSans3',
                              color: Color(0xff272932)),
                        ),
                      ],
                    ),
                    SizedBox(width: Dim().d20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Valid until: ',
                          style: Sty().mediumText.copyWith(
                              fontSize: Dim().d14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'SourceSans3',
                              color: Color(0xff272932)),
                        ),
                        Text(
                          '12th Oct 2023',
                          style: Sty().mediumText.copyWith(
                              fontSize: Dim().d14,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'SourceSans3',
                              color: Color(0xff272932)),
                        ),
                      ],
                    ),
                  ],
                ),
              if (check)
                Text(
                  'You don’t have any plans running now to get full access of features on app purchase subscription.',
                  style: Sty().smallText.copyWith(
                      color: Color(0xff272932),
                      fontFamily: 'SourceSans3',
                      fontSize: Dim().d16,
                      fontWeight: FontWeight.w400),
                ),
              if (check)
                SizedBox(
                  height: Dim().d12,
                ),
              if (check)
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                        decoration: Sty().textFieldOutlineStyle.copyWith(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                color: Color(0xffCEA401),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                color: Color(0xffCEA401),
                              ),
                            ),
                            hintText: 'Enter Coupon Code',
                            hintStyle: Sty().mediumText.copyWith(
                                color: Color(0xffB28E00),
                                fontFamily: 'SourceSans3',
                                fontWeight: FontWeight.w400,
                                fontSize: Dim().d14)),
                      ),
                    ),
                    SizedBox(width: Dim().d12),
                    Expanded(
                        flex: 2,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffCEA501),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(Dim().d20))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Dim().d12,
                              ),
                              child: Center(
                                  child: Text('Apply',
                                      style: Sty().mediumText.copyWith(
                                          fontFamily: 'Lora',
                                          color: Clr().white,
                                          fontSize: Dim().d16,
                                          fontWeight: FontWeight.w500))),
                            )))
                  ],
                ),
              if (check)
                SizedBox(
                  height: Dim().d8,
                ),
              if (check)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dim().d12),
                  child: Text(
                    '*If you have received any code, enter and get discount on a yearly subscription plan.',
                    style: Sty().smallText.copyWith(
                        color: Color(0xff272932),
                        fontFamily: 'SourceSans3',
                        fontSize: Dim().d12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              SizedBox(
                height: Dim().d12,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: RichText(
                        text: TextSpan(
                            text: '₹10,000 ',
                            style: Sty().mediumBoldText.copyWith(
                                color: Color(0xff001011),
                                fontFamily: 'SourceSans3',
                                fontWeight: FontWeight.w600,
                                fontSize: Dim().d24),
                            children: [
                          TextSpan(
                            text: '/year',
                            style: Sty().smallText.copyWith(
                                color: Color(0xff001011),
                                fontFamily: 'SourceSans3',
                                fontWeight: FontWeight.w400,
                                fontSize: Dim().d12),
                          )
                        ])),
                  ),
                  if (check) SizedBox(width: Dim().d12),
                  if (check)
                    Expanded(
                        flex: 3,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                check = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Clr().white,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(Dim().d20))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Dim().d14,
                              ),
                              child: Center(
                                  child: Text('Subscribe',
                                      style: Sty().mediumText.copyWith(
                                          color: Color(0xffCEA501),
                                          fontFamily: 'Lora',
                                          fontSize: Dim().d16,
                                          fontWeight: FontWeight.w500))),
                            )))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  logLayout() {
    return Padding(
      padding: EdgeInsets.only(
          bottom: Dim().d120, left: Dim().d52, right: Dim().d52),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 3,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          elevation: 3,
                          backgroundColor: Clr().white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(Dim().d20))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: Dim().d20,
                        ),
                        child: Center(
                            child: Text('Logout',
                                style: Sty().mediumText.copyWith(
                                    color: Clr().primaryblue,
                                    fontSize: Dim().d14,
                                    fontWeight: FontWeight.w500))),
                      )))
            ],
          ),
          SizedBox(height: Dim().d12),
          Text(
            'Delete my Account',
            textAlign: TextAlign.center,
            style: Sty().smallText.copyWith(
                color: Color(0xffFF3D26),
                fontSize: Dim().d12,
                fontFamily: 'SourceSans3',
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
