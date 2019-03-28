import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Model/YKChatModel.dart';
import 'View/YKChatHomePopMenuView.dart';

class YKChatDetailPage extends StatelessWidget {

  YKChatDetailPage({
    this.chatModel,
  });

  YKChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(chatModel.userName),
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
              Navigator.pop(context);
            }),
      ),
      child: Center(
        child: YKChatHomePopMenu(),
      ),
    );
  }
}