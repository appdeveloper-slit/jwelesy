import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:jewelsy/manage/static_method.dart';
import 'package:jewelsy/productdetails.dart';

import 'values/colors.dart';
import 'values/dimens.dart';
import 'values/styles.dart';

class albumDetails extends StatefulWidget {
  final name;
   albumDetails({super.key,this.name});

  @override
  State<albumDetails> createState() => _albumDetailsState();
}

class _albumDetailsState extends State<albumDetails> {
  late BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: STM().buttonBar(5, ctx),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Clr().white,
        leading: InkWell(onTap: (){
          STM().back2Previous(ctx);
        },child: Icon(Icons.arrow_back_ios, color: Clr().primaryblue)),
        title: Text('${widget.name}',
            style: Sty().mediumText.copyWith(
                color: Clr().primaryblue,
                fontWeight: FontWeight.w600,
                fontSize: 18.0)),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              // newAlbumLay();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dim().d16, vertical: Dim().d12),
              child: Image.asset('assets/delete_icon.png'),
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
              SizedBox(height: Dim().d12),
              Padding(
                padding: EdgeInsets.only(bottom: Dim().d120,left: Dim().d20,right: Dim().d20),
                child: MasonryGridView.builder(
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
