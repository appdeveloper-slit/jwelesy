import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class Deomo extends StatefulWidget {
  const Deomo({Key? key}) : super(key: key);

  @override
  State<Deomo> createState() => _DeomoState();
}

class _DeomoState extends State<Deomo> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(color: Colors.red,width: 100,height: 100),
            SvgPicture.asset('assets/JewelsyLogo.svg',height: 100,width: 80),
            Image.asset('assets/JewelsyLogo.png',height: 100,width: 80),
          ],
        ),
      ),
    );
  }
}
