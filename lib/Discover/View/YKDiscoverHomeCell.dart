import 'package:flutter/material.dart';

import '../Model/YKDiscoverHomeModel.dart';

class YKDisCoverHomeCell extends StatefulWidget {

  YKDisCoverHomeCell({this.homeModel,this.onTap});

  final YKDiscoverHomeModel homeModel;

  final GestureTapCallback onTap;

  @override
  createState() => discoverHomeCellState();

}


class discoverHomeCellState extends State<YKDisCoverHomeCell> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var icon = Container(
      margin: EdgeInsets.only(left: 16),
      child: Image.asset(this.widget.homeModel.icon),
      width: 20,
      height: 20,
    );

    var title = Container(
      margin: EdgeInsets.only(left: 12,right: 10),
      child: Text(this.widget.homeModel.title),
    );

    var redDot = Offstage(
      offstage: !this.widget.homeModel.hasNew,
      child: ClipOval(
        child: Container(
          width: 10,
          height: 10,
          color: Color(0xfffb5051),
        ),
      ),
    );

    var rightArrow = Container(
      margin: EdgeInsets.only(right: 16),
      child: Image.asset('images/tableview_arrow.png'),
    );

    var line = Divider(
      indent: 48,
      color: Color(0xffd9d9d9),
      height: 1,
    );

    return GestureDetector(
      child: Container(
        height: 56,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        icon,
                        title,
                        redDot
                      ],
                    ),
                    rightArrow
                  ],
                )
            ),
            line
          ],
        ),
      ),
      onTap: this.widget.onTap,
    );
  }
}


class YKDisCoverHomeSeparatorCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Color(0xffededed),
      height: 8,
    );
  }
}