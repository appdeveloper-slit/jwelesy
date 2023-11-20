import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

import 'albumdetails.dart';
import 'manage/static_method.dart';
import 'values/colors.dart';
import 'values/dimens.dart';
import 'values/styles.dart';

class collectionPage extends StatefulWidget {
  const collectionPage({super.key});

  @override
  State<collectionPage> createState() => _collectionPageState();
}

class _collectionPageState extends State<collectionPage> {
  late BuildContext ctx;
  List albumList = [
    {'image': 'assets/b1.png', 'name': 'All Collection'},
    {'image': 'assets/b2.png', 'name': 'Diamond Album'},
    {'image': 'assets/b3.png', 'name': 'Gold Collection'},
    {'image': 'assets/b4.png', 'name': 'Diamond Ring Collection'},
  ];

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: STM().buttonBar(3, ctx),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Clr().white,
        leading: InkWell(onTap: (){
          STM().back2Previous(ctx);
        },child: Icon(Icons.arrow_back_ios, color: Clr().primaryblue)),
        title: Text('My Album',
            style: Sty().mediumText.copyWith(
                color: Clr().primaryblue,
                fontWeight: FontWeight.w600,
                fontSize: 18.0)),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              albumLyt();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dim().d16, vertical: Dim().d12),
              child: Image.asset('assets/album_icon.png'),
            ),
          ),
        ],
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
              Padding(
                padding: EdgeInsets.only(bottom: Dim().d120),
                child: SizedBox(
                  height: MediaQuery.of(ctx).size.height / 1.3,
                  child: GridView.builder(
                      itemCount: albumList.length,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: Dim().d220,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            STM().redirect2page(ctx,  albumDetails(name: albumList[index]['name'],));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('${albumList[index]['image']}'),
                              SizedBox(height: Dim().d12),
                              Text(
                                '${albumList[index]['name']}',
                                style: Sty().mediumText.copyWith(
                                    color: Clr().black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: Dim().d14),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
                                Text('My Album',
                                    style: Sty().mediumText.copyWith(
                                        color: Clr().white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: Dim().d16,
                                        decoration: TextDecoration.none)),
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
