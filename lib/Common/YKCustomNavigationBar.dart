import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';


class YKCustomNavigationBar extends StatefulWidget {

  YKCustomNavigationBar({this.offset,this.rightOnTap,this.rightLongTap});

  final double offset;
  final GestureTapCallback rightOnTap;
  final GestureLongPressCallback rightLongTap;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return YKCustomMomentNavigationState();
  }
}


class YKCustomMomentNavigationState extends State<YKCustomNavigationBar> {

  @override
  Widget build(BuildContext context) {

    double alaphOffset = MediaQuery.of(context).size.width*(320/375.0)-this.widget.offset;
    double navHeight = MediaQuery.of(context).padding.top + 44;

    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).padding.top+44,
      color: Color.fromARGB(alaphOffset >navHeight ?0:min(((navHeight-alaphOffset)*(255/24.0)).toInt(), 255), 248, 248, 248),
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        height: 44,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16),
              width: 44,
              child: CupertinoButton(
                  padding: EdgeInsets.only(left: 0,right: 34),
                  child: Image.asset(alaphOffset >navHeight ? 'images/nav_icon_back_white.png':'images/nav_icon_back.png',),
                  onPressed: (){
                    Navigator.pop(context);
                  }),
            ),
            Center(
              child: Text('朋友圈',style: TextStyle(color: alaphOffset >navHeight ?Colors.transparent:Colors.black,),),
            ),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(right: 4),
                width: 44,
                padding: EdgeInsets.only(left: 12,right: 12),
                child: Image.asset(alaphOffset >navHeight ? 'images/nav_icon_moment_white_camera.png':'images/nav_icon_moment_black_camera.png'),
              ),
              onTap: this.widget.rightOnTap,
              onLongPress: this.widget.rightLongTap,
            )
          ],
        ),
      ),
    );
  }
}