import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'View/YKUserInfoCell.dart';

import '../Chats/YKMessagePage.dart';
import '../Chats/Model/YKChatModel.dart';

import '../Discover/YKMomentPage.dart';
import 'package:url_launcher/url_launcher.dart';

import 'YKSettingUserInfoPage.dart';

class YKUserInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return YKUserInfoState();
  }
}

class YKUserInfoState extends State<YKUserInfoPage> with TickerProviderStateMixin {


  AnimationController animationController;
  Animation<double> animation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation = Tween(begin: 0.0, end: 240.0).animate(CurvedAnimation(parent: animationController, curve: Curves.easeIn));

    animation.addStatusListener((status) {
      print('++++++++${status}++++++${animation.value}');
    });

    animationController.forward();

  }

  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
            padding: EdgeInsets.only(left: 0, right: 34),
            child: Image.asset('images/nav_icon_back.png'),
            onPressed: () {
              Navigator.pop(context);
            }),
        trailing: CupertinoButton(
            padding: EdgeInsets.only(left: 14, right: 0),
            child: Image.asset('images/nav_icon_more.png'),
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .push(CupertinoPageRoute(builder: (context) {
                return YKSettingUserInfoPage();
              }));
            }),
      ),

      child: Container(
        color: Color(0xffededed),
        child: ListView.separated(
          itemBuilder: (context,index){
            if(index==0) {
              return YKUserInfoHeadrView();
            }else if (index == 1){
              return YKUserInfoRightArrowCell(title: '设置备注和标签',);
            }else if(index == 2){
              return YKUserInfoRightArrowCell(title: '电话号码',subTitle: '15638431172',onTap: () {
                _callNumber('15638431172');
              },);
            }else if(index == 3){
              return YKUserInfoMomentCell(onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(builder: (context){
                  return YKMomentPage();
                }));
              },);
            }else if(index == 4){
              return YKUserInfoRightArrowCell(title: '更多信息',);
            }else if(index == 5){
              return YKUserInfoActionCell(action: {'icon':'images/userinfo_icon_chats.png','title':'发消息'},onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(builder: (context){
                  return YKMessagePage(chatModel: YKChatModel.fromJson({
                    "userName": "Google",
                    "avatar": "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553173065&di=a8dc27a67d0f825b79879be41aa833a2&imgtype=jpg&er=1&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201803%2F28%2F20180328083913_hrkpt.thumb.700_0.jpg",
                    "chatMsg": "hahhahhahaha",
                    "time": "2019.01.23"
                  }),);
                }));
              },);
            }else if(index == 6){
              return YKUserInfoActionCell(action: {'icon':'images/userinfo_icon_videoCall.png','title':'音视频通话'},onTap: () {
                showDemoActionSheet(
                  context: context,
                  child: CupertinoActionSheet(
                    actions: <Widget>[
                      CupertinoActionSheetAction(
                        onPressed: () {
                          Toast.show('敬请期待', context,gravity: Toast.CENTER);
                          Navigator.pop(context,);
                        },
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset('images/voip_actionSheet_video.png'),
                              Container(
                                margin: EdgeInsets.only(left: 6),
                                child: Text('视频通话',style: TextStyle(color: Colors.black,fontSize: 17)),
                              )
                            ],
                          ),
                        ),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () {
                          Toast.show('敬请期待', context,gravity: Toast.CENTER);
                          Navigator.pop(context,);
                        },
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset('images/voip_actionSheet_voice.png'),
                              Container(
                                margin: EdgeInsets.only(left: 6),
                                child: Text('语音通话',style: TextStyle(color: Colors.black,fontSize: 17),),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                    cancelButton: CupertinoActionSheetAction(
                      child: Text('取消',style: TextStyle(color: Colors.black,fontSize: 17)),
                      isDefaultAction: true,
                      onPressed: () {
                        Navigator.pop(context,);
                      },
                    ),
                  )
                );
              },);
            }
          },
          separatorBuilder: (context,index){
            if(index==0||index==1 || index ==3){
              return Container(
                color: Colors.white,
                child: Divider(height: 1,color: Color(0xffd8d8d8),indent: 16,),
              );
            }else if(index == 2 || index == 4){
              return Divider(height: 8,color: Color(0xffededed),);
            }else{
              return Divider(height: 1,color: Color(0xffd8d8d8),);
            }
          },
          itemCount: 7,
        ),
      ),
    );
  }


  void showDemoActionSheet({BuildContext context, Widget child}) {
    showCupertinoModalPopup<String>(
      context: context,
      builder: (BuildContext context) => child,
    ).then((String value) {
      if (value != null) {
        setState(() {
//            lastSelectedValue = value;
        });
      }
    });
  }

  _callNumber(String phoneNum) async {
    var url = 'tel:${phoneNum}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
