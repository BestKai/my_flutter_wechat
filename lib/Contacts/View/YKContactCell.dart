import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/YKUserInfo.dart';

class YKContactCell extends StatelessWidget {

  YKContactCell({
    this.onTap,this.userInfo
  });

  final GestureTapCallback onTap;
  final YKUserInfo userInfo;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var avatar = Container(
      margin: EdgeInsets.only(left: 16),
      child: userInfo.avatar.startsWith('http')?FadeInImage.assetNetwork(
        placeholder: 'images/defaultHead.png',
        image: userInfo.avatar,
        fit: BoxFit.cover,
      ):Image.asset(userInfo.avatar),
      width: 40,
      height: 40,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius:BorderRadius.all(Radius.circular(4)),
       )
    );

    var title = Container(
      margin: EdgeInsets.only(left: 12),
      child: Text(userInfo.nickName),
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
      indent: 68,
      color: Color(0xffd9d9d9),
      height: 1,
    );

    return GestureDetector(
      child: Container(
        color: Colors.white,//如果不设置白色，那么空白区域点击事件不响应
        height: 56,
        child: Column(
          children: <Widget>[
            cell,
            line
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}



class YKContactSectionHeader extends StatelessWidget {

  YKContactSectionHeader({
    this.userInfo
  });

  final YKUserInfo userInfo;

  @override
  Widget build(BuildContext context) {

    var title = new Expanded(
      flex: 1,
      child: Container(
        child: Text(userInfo.nickName,style: TextStyle(color: Color(0xff757575)),),
        margin: EdgeInsets.only(left: 16),
      )
    );

    // TODO: implement build
    return Container(
      height: 32,
      color: Color(0xffededed),
      child: Row(
        children: <Widget>[
          title
        ],
      ),
    );
  }
}



