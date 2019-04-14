import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Model/YKChatModel.dart';
import 'View/YKChatToolBar.dart';
import 'View/YKChatMessageCell.dart';
import 'YKChatDetailPage.dart';

class YKMessagePage extends StatefulWidget {

  YKMessagePage({
    this.chatModel,
  });

  final YKChatModel chatModel;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MessageListState();
  }
}


class MessageListState extends State<YKMessagePage> {

  List<Map<String,dynamic>> messageList = [];

  ScrollController scrollController = ScrollController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scrollController.addListener((){
      FocusScope.of(context).requestFocus(FocusNode());
    });

    for (int i = 10; i > 0; --i) {
      messageList.add({'avatar':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553173065&di=a8dc27a67d0f825b79879be41aa833a2&imgtype=jpg&er=1&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201803%2F28%2F20180328083913_hrkpt.thumb.700_0.jpg',
      'content':'原价多少钱？原价多少钱？${i}',
        'time':'2019.4.23',
        'bubble':i%2==0?MessageBubbleType.receiver:MessageBubbleType.sender,
        'nickName':'Best--Kai'
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(this.widget.chatModel.userName),
        leading: CupertinoButton(
            padding: EdgeInsets.only(left: 0,right: 34),
            child: Image.asset('images/nav_icon_back.png'),
            onPressed: (){
              Navigator.pop(context);
            }),
        trailing: CupertinoButton(
            padding: EdgeInsets.only(left: 14,right: 0),
            child: Image.asset('images/nav_icon_more.png'),
            onPressed: (){
              Navigator.of(context,rootNavigator: true).push(CupertinoPageRoute(builder: (context) {
                return YKChatDetailPage();
              }));
            }),
      ),
      backgroundColor:Color(0xfff6f6f6),
      child: Container(
        color: Color(0xfff6f6f6),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Color(0xffededed),
                child: ListView.builder(
                  controller: scrollController,
                  padding: EdgeInsets.only(left: MediaQuery.of(context).padding.left,right: MediaQuery.of(context).padding.right,bottom: 0,top: MediaQuery.of(context, nullOk: true).padding.top+44),
                  reverse: true,
                  itemBuilder: (context,index) {
                    return TextMessageCell(message:messageList[index],onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },);
                  },
                  itemCount: messageList.length,
                ),
              ),
            ),
            Divider(height: 1.0,color: Color(0xffd9d9d9),),      //聊天记录和输入框之间的分隔
            YKChatToolBar(sendMessage: (text){
              setState(() {
                messageList.insert(0,{'avatar':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553173065&di=a8dc27a67d0f825b79879be41aa833a2&imgtype=jpg&er=1&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201803%2F28%2F20180328083913_hrkpt.thumb.700_0.jpg',
                  'content':text,
                  'time':'2019.4.23',
                  'bubble':MessageBubbleType.sender,
                  'nickName':'Best--Kai'
                });
              });
            },),
          ],
        ),
      ),
    );
  }
}