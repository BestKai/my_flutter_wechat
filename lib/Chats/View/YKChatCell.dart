import 'package:flutter/material.dart';
import '../Model/YKChatModel.dart';

class YKChatCell extends StatelessWidget {

  YKChatCell({
    this.height,
    this.onTap,
    this.chatModel,
  });

  final double height;
  final YKChatModel chatModel;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var avatarImage = new Container(
      width: 48,
      height: 48,
      margin: EdgeInsets.only(left: 16,top: 12),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius:BorderRadius.all(Radius.circular(4)),
        image: DecorationImage(
          image: NetworkImage(chatModel.avatar),
        ),
        border: Border.all(
          color: Color(0xffdddddd),
          width: 1,
        )
      ),
    );

    var userNameRow = new Container(
        child:  new Text(chatModel.userName ,style: TextStyle(fontSize: 16))
    );

    var timeRow = new Container(
        child: new Text(chatModel.time ,style: TextStyle(fontSize: 13,color: Color(0xffb2b2b2))),
    );
    var chatMsgRow = new Container(
       margin: EdgeInsets.only(top: 4),
       child: new Text(chatModel.chatMsg ,style: TextStyle(fontSize: 15,color: Color(0xff9b9b9b))),
    );

    var cell = new Column(
        children: <Widget>[
          new Container(
            child: new Row(
              children: <Widget>[
                new Container(
                  child: avatarImage,
                ),

                new Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: 12,right: 12,top: 12),
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            child: new Row(
                              children: <Widget>[
                                userNameRow,
                                timeRow,
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
//                          margin: EdgeInsets.only(top: 14),
                          ),
                          new Row(
                            children: <Widget>[
                              chatMsgRow
                            ],
                          ),
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),

          new Container(
            color: Color(0xffd9d9d9),
            margin: EdgeInsets.only(left: 76,right: 0,top: 12),
            height: 0.5,
          )
        ],
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        child: cell,
        height: 72.5,
      ),
    );
  }
}
