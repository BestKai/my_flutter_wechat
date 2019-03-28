import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'View/YKChatCell.dart';
import 'Model/YKChatModel.dart';
import 'YKChatDetailPage.dart';
import 'View/YKChatHomePopMenuView.dart';

class YKChatHomePage extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    // TODO: implement build

    void showPopMenu() {
      Navigator.of(context,).push(CupertinoPageRoute(
        fullscreenDialog: true,
          builder: (context){
        return YKChatHomePopMenuPage();
      }));
    }

    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('微信'),
          trailing: GestureDetector(
            child: Icon(CupertinoIcons.add_circled),
            onTap: () {
              showPopMenu();
            },
          ),
        ),
      backgroundColor: Color(0xffededed),
      child: ChatListPage(),
    );
  }
}


class ChatListPage extends StatefulWidget {
  @override
  createState() => new ChatListState();
}

Future<String> getLocalFile() async {
  String dir = (await getApplicationDocumentsDirectory()).path;
  File file = File('$dir/chatInfo.json');
  return file.readAsString();
}

class ChatListState extends State {

  List<YKChatModel> chatListDatas = [];

  @override
  void initState() {
//    Future<String> jsonStr = getLocalFile();
    Future<String> jsonStr = DefaultAssetBundle.of(context).loadString("content/chatInfo.json");
    jsonStr.then((String value){
      // 通知框架此对象的内部状态已更改
      setState((){
        // 将参数赋予存储点击数的变量
        for (var chatM in json.decode(value)){
           chatListDatas.add(YKChatModel.fromJson(chatM));
         }
      });
    });
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return _chatList();
  }

  Widget _chatList() {
    return ListView.builder(
        itemCount: chatListDatas.length,
        itemBuilder: (BuildContext context, int index) {
          return YKChatCell(
              chatModel: chatListDatas[index],
              onTap: () {
                goToChatDetail(chatListDatas[index]);
              },
          );
        }
    );
  }

   void goToChatDetail(YKChatModel chatModel) {
    //导航到新路由

    //方法1 tabbar 可以根据rootNavigator 设置是否隐藏
    Navigator.of(context,rootNavigator: true).push(CupertinoPageRoute(builder: (context) {
      return YKChatDetailPage(chatModel:chatModel);
    }));

    //方法2 tabbar 不会隐藏
//    Navigator.push(context,
//        new CupertinoPageRoute(builder: (context) {
//          return YKChatDetailPage(chatModel:chatModel);
//        }));
  }

}