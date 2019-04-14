import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class YKUserInfoHeadrView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 16,top: 16),
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                image: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553173065&di=a8dc27a67d0f825b79879be41aa833a2&imgtype=jpg&er=1&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201803%2F28%2F20180328083913_hrkpt.thumb.700_0.jpg'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16,top: 16,bottom: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: RichText(
                    text: TextSpan(
                        text: '东方振华教育有限公司',
                      style: TextStyle(color: Colors.black,fontSize: 20),
                      children: [
                        TextSpan(),
                      ]
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 6),
                  child: Text('微信号：wxid_s9s9d09d9d0s9',style: TextStyle(color: Color(0xff7f7f7f),fontSize: 15)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 6),
                  child: Text('地区：河南郑州',style: TextStyle(color: Color(0xff7f7f7f),fontSize: 15)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


class YKUserInfoRightArrowCell extends StatelessWidget {
  
  YKUserInfoRightArrowCell({this.title,this.onTap,this.subTitle});

  final String title;
  final String subTitle;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Row(
                  children: <Widget>[
                    Text('${title}',style: TextStyle(fontSize: 17),),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      child: Text('${subTitle==null?'':subTitle}',style: TextStyle(fontSize: 17,color: Color(0xff576c94)),),
                    )
                  ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 16),
              child: Image.asset('images/tableview_arrow.png'),
            )
          ],
        ),
      ),
    );
  }
}

class YKUserInfoMomentCell extends StatelessWidget {

  YKUserInfoMomentCell({this.onTap});

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Text('朋友圈',style: TextStyle(fontSize: 17),),
            ),
            Container(

            ),
            Container(
              margin: EdgeInsets.only(right: 16),
              child: Image.asset('images/tableview_arrow.png'),
            )
          ],
        ),
      ),
    );
  }
}

class YKUserInfoActionCell extends StatelessWidget {

  YKUserInfoActionCell({this.action,this.onTap});

  final Map<String,String> action;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        height: 56,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(action['icon']),
              Container(
                margin: EdgeInsets.only(left: 6),
                child: Text('${action['title']}',style: TextStyle(color: Color(0xff576c94)),),
              )
            ],
          ),
        ),
      ),
    );
  }
}

