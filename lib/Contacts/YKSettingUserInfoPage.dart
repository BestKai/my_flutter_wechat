import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Chats/View/YKChatDetailPageCell.dart';

class YKSettingUserInfoPage extends StatelessWidget {


  final List<dynamic> listDataSources = [
    {'title':'设置备注和标签','type':0},

    {'title':'把他推荐给朋友','type':0},

    {'title':'设为星标朋友','type':1},

    {'title':'不让他看','type':1},
    {'title':'不看他','type':1},

    {'title':'加入黑名单','type':1},
    {'title':'投诉','type':0},

    {'title':'删除','type':2},
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('资料设置'),
        leading: CupertinoButton(
            padding: EdgeInsets.only(left: 0, right: 34),
            child: Image.asset('images/nav_icon_back.png'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      child: Container(
        color: Color(0xffededed),
        child: ListView.separated(
          itemBuilder: (context,index){
            Map aa = listDataSources[index];
            if(aa['type']==0){
              return YKChatArrowCell(title: aa['title'],);
            }else if(aa['type']==1){
              return YKChatSwitchCell(title: aa['title'],);
            }else{
              return GestureDetector(
                onTap: () {
                  showDeleteActionSheet(
                    context: context,
                    child: CupertinoActionSheet(
                      title: Text('将联系人"AAAAAA"删除，同时删除与该联系人的聊天记录',style: TextStyle(color: Color(0xff7f7f7f),fontSize: 13),),
                      actions: <Widget>[
                        CupertinoActionSheetAction(
                          onPressed: () {
                            Navigator.pop(context,);
                          },
                          child: Text('删除联系人',style: TextStyle(color: Colors.redAccent,fontSize: 17)),
                        ),
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        child: Text('取消',style: TextStyle(color: Colors.black,fontSize: 17)),
                        isDefaultAction: true,
                        onPressed: () {
                          Navigator.pop(context,);
                        },
                      ),
                    ),
                  );
                },
                child: Container(
                  color: Colors.white,
                  height: 56,
                  child: Center(
                    child: Text('删除',style: TextStyle(color: Colors.redAccent),),
                  ),
                ),
              );
            }
          },
          separatorBuilder: (context,index){
            if(index==0 || index==1 || index==4 || index==6){
              return Divider(height: 8,color: Color(0xffededed),);
            }else if(index == 3 || index==5){
              return Container(
                color: Colors.white,
                child: Divider(height: 1,color: Color(0xffd8d8d8),indent: 16,),
              );
            }else if(index == 2){
              return Container(
                color: Color(0xffededed),
                height: 32,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 16,
                      bottom: 4,
                      child: Text('朋友圈和视频动态',style: TextStyle(color: Color(0xff7f7f7f),fontSize: 13),),
                    ),
                  ],
                ),
              );
            }
          },
          itemCount: listDataSources.length,
        ),
      ),
    );
  }

  void showDeleteActionSheet({BuildContext context, Widget child}) {
    showCupertinoModalPopup<String>(
      context: context,
      builder: (BuildContext context) => child,
    ).then((String value) {
      if (value != null) {
//        setState(() {
////            lastSelectedValue = value;
//        });
      }
    });
  }
  
}