import 'package:flutter/material.dart';

import '../../Contacts/Model/YKUserInfo.dart';

class YKMineHomeUserInfoCell extends StatelessWidget {

  YKMineHomeUserInfoCell({
    this.userInfo
  });

  final YKUserInfo userInfo;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    double statusBarHeight = MediaQuery.of(context).padding.top;

    var avatar = Container(
      child: FadeInImage.assetNetwork(
        placeholder: 'images/defaultHead.png',
        image: userInfo.avatar,
        fit: BoxFit.cover,
      ),
      width: 64,
      height: 64,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius:BorderRadius.all(Radius.circular(4)),
          border: Border.all(
            color: Color(0xffffffff),
            width: 1,
          )
      ),
    );

    var nickName = Container(
      margin: EdgeInsets.only(top: 4),
      child:  Row(
        children: <Widget>[
          Text(userInfo.nickName,style: TextStyle(fontSize: 20),),
        ],
      ),
    );

    var wxInfoView = Container(
      margin: EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('微信号：${userInfo.wxName}',style: TextStyle(fontSize: 15,color:Color(0xff7c7c7c))),
          Container(
            child: Row(
              children: <Widget>[
                Image.asset('images/mine_icon_homeQR.png'),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child:Image.asset('images/tableview_arrow.png'),
                )
              ],
            ),
          )
        ],
      ),
    );

    return Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(left: 16,top: statusBarHeight+72,bottom: 42,right: 16),
        height: 64,
        child: Row(
          children: <Widget>[
            avatar,
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 16),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      nickName,
                      wxInfoView,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}