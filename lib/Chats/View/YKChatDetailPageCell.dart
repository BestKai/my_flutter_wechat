import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//参与者
class YKChatUsersCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<Widget> gridChilden = [];

    int memberCount = 10;

    for(int i = 0;i<memberCount;i++){
      if(i==memberCount-1){
        gridChilden.add(
          Container(
            child: Column(
              children: <Widget>[
                Image.asset('images/chat_detail_addGroupMember.png'),
              ],
            ),
          ),
        );
      }else {
        gridChilden.add(
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.only(bottom: 6),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius:BorderRadius.all(Radius.circular(6)),
                      image: DecorationImage(
                          image: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553173065&di=a8dc27a67d0f825b79879be41aa833a2&imgtype=jpg&er=1&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201803%2F28%2F20180328083913_hrkpt.thumb.700_0.jpg'),
                        fit: BoxFit.fill,
                      ),
                  ),
                ),
                Text('哈哈哈',style: TextStyle(color: Color(0xff4d4d4d),fontSize: 14),),
              ],
            ),
          ),
        );
      }
    }

    // TODO: implement build
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 20,right: 20,top: 16,bottom: 16),
      child: Wrap(
        children: gridChilden,
        runSpacing: 10.0, // 纵轴（垂直）方向间距
        spacing: (MediaQuery.of(context).size.width-40-50*5)/4.0,//横轴
      ),
    );
  }
}


//带箭头
class YKChatArrowCell extends StatelessWidget {

  YKChatArrowCell({this.title,this.onTap});

  final String title;
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
              child: Text('${title}',style: TextStyle(fontSize: 17),),
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


//带开关
class YKChatSwitchCell extends StatelessWidget {

  YKChatSwitchCell({this.title,this.valueChanged});

  final String title;
  final ValueChanged valueChanged;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Text('${title}',style: TextStyle(fontSize: 17),),
          ),
          Container(
            margin: EdgeInsets.only(right: 16),
            child: CupertinoSwitch(
              value: true,
              onChanged: valueChanged,
            ),
          )
        ],
      ),
    );
  }
}

