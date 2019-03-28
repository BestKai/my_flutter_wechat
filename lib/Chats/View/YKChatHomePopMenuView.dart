import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class YKChatHomePopMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return CupertinoPageScaffold(
      backgroundColor: Color.fromARGB(100, 0, 0, 0),
      child: Container(
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width-160-8,top: MediaQuery.of(context).padding.top+44),
        child: YKChatHomePopMenu(),
      ),
    );
  }
}


class YKChatHomePopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final widgetList = <Widget>[];
    widgetList.add(_menuItem(item: {'icon':'images/nav_icon_menu_chat.png','title':'发起群聊'},index: 0,));
    widgetList.add(_menuItem(item: {'icon':'images/nav_icon_menu_addfriend.png','title':'添加朋友'},index: 1,));
    widgetList.add(_menuItem(item: {'icon':'images/nav_icon_menu_scan.png','title':'扫一扫'},index: 2,));
    widgetList.add(_menuItem(item: {'icon':'images/nav_icon_menu_pay.png','title':'收付款'},index: 3,));

    return ClipPath(
      clipper: _menuCliper(radius: 6),
      child: Container(
        color: Color(0xff4c4c4c),
        width: 160,
        height: 230,
        child: Container(
          margin: EdgeInsets.only(top: 6),
          child: Column(
            children: widgetList,
          ),
        ),
      ),
    );
  }
}

class _menuItem extends StatelessWidget {

  _menuItem({this.item,this.index});

  var item;
  final int index;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var avatar = Container(
        margin: EdgeInsets.only(left: 25),
        child:Image.asset(item['icon']),
        width: 24,
        height: 24,
    );

    var title = Container(
      margin: EdgeInsets.only(left: 10),
      child: Text(item['title'],style: TextStyle(color: Colors.white,fontSize: 16),),
    );

    var cell = Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          avatar,
          title,
        ],
      ),
//        flex: 1,
    );

    var line = Divider(
      indent: 59,
      color: Color(0xff6f6f6f),
      height: 1,
    );

    return GestureDetector(
      child: Container(
        height: 56,
        child: Column(
          children: <Widget>[
            cell,
            line
          ],
        ),
      ),
      onTap: () {
        print('11111');
      },
    );
  }
}


class _menuCliper extends CustomClipper<Path> {

  _menuCliper({this.radius});

  final double radius;

  @override
  Path getClip(Size size) {
    // TODO: implement getClip

    double radius = this.radius;
    double triangleHeight = 6;
    double triangleWidth = 12;
    double triangleRightMargin = 14;

    Path path = Path();
    path.moveTo(radius, triangleHeight);
    
    path.lineTo(size.width-triangleWidth-triangleRightMargin, triangleHeight);
    path.lineTo(size.width-triangleWidth/2.0-triangleRightMargin, 0);
    path.lineTo(size.width-triangleRightMargin, triangleHeight);

    path.lineTo(size.width-radius, triangleHeight);
    path.arcToPoint(Offset(size.width, radius+triangleHeight),radius: Radius.circular(radius));
    path.lineTo(size.width, size.height-radius);
    path.arcToPoint(Offset(size.width-radius, size.height),radius: Radius.circular(radius));
    path.lineTo(radius, size.height);
    path.arcToPoint(Offset(0, size.height-radius),radius: Radius.circular(radius));
    path.lineTo(0, radius+triangleHeight);
    path.arcToPoint(Offset(radius, triangleHeight),radius: Radius.circular(radius));
    path.close();

    return path;
  }

  @override
  bool shouldReclip(_menuCliper oldClipper) {
    // TODO: implement shouldReclip
    return this.radius != oldClipper.radius;
  }
}