import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'View/YKChatDetailPageCell.dart';
import 'YKSearchHistoryPage.dart';

class YKChatDetailPage extends StatelessWidget {

  final titles = ['','查找聊天内容','置顶聊天','消息免打扰','强提醒','设置当前背景','清空聊天记录','投诉'];

  @override
  Widget build(BuildContext context) {

    void goToSearchHistoryPage() {
      Navigator.of(context,rootNavigator: true).push(CupertinoPageRoute(builder: (context) {
        return YKSearchHistoryPage();
      }));
    }

    // TODO: implement build
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('聊天详情'),
        leading: CupertinoButton(
            padding: EdgeInsets.only(left: 0,right: 34),
            child: Image.asset('images/nav_icon_back.png'),
            onPressed: (){
              Navigator.pop(context);
            },
        ),
      ),
      backgroundColor: Color(0xffededed),
      child: ListView.separated(
        itemBuilder: (context,index) {
          if(index==0){
            return YKChatUsersCell();
          }else
            if(index == 2 || index == 3 || index == 4) {
            return YKChatSwitchCell(title: titles[index],);
          }else{
            return YKChatArrowCell(title: titles[index],onTap: (){
              if(index == 1){
                goToSearchHistoryPage();
              }
            },);
          }
        },
        separatorBuilder: (context,index){
          if(index == 2 || index == 3) {
            return Divider(height: 0.5,color: Color(0xffededed),indent: 16,);
          }
          return Divider(height: 8,color: Color(0xffededed),);
        },
        itemCount: titles.length,
      ),
    );
  }




}
