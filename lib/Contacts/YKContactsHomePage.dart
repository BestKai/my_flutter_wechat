import 'package:flutter/cupertino.dart';

import 'View/YKContactCell.dart';
import 'Model/YKUserInfo.dart';

class YKContactsHomePage extends StatelessWidget {

  final dataSources = [];

  final sectionOneData = [
    YKUserInfo(avatar: 'images/add_friend_icon_FriendNotify.png',  nickName: '新的朋友',actionTag: 'friendNotify'),
    YKUserInfo(avatar: 'images/add_friend_icon_addgroup.png',  nickName: '群聊',actionTag: 'addgroup'),
    YKUserInfo(avatar: 'images/add_friend_icon_ContactTag.png',  nickName: '标签',actionTag: 'contactTag'),
    YKUserInfo(avatar: 'images/add_friend_icon_offical.png',  nickName: '公众号',actionTag: 'offical')
  ];

  initData() {
      dataSources.addAll(sectionOneData);
      dataSources.add(YKUserInfo(nickName: 'A',actionTag: ''));
      for (int i = 0;i < 20; i++) {
        dataSources.add(YKUserInfo(actionTag: 'contact',
            avatar: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553173065&di=a8dc27a67d0f825b79879be41aa833a2&imgtype=jpg&er=1&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201803%2F28%2F20180328083913_hrkpt.thumb.700_0.jpg',
            nickName: '111111'));
      }
  }

  YKContactsHomePage() {
    initData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('通讯录'),
      ),
      backgroundColor: Color(0xffededed),
      child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {

            YKUserInfo user = dataSources[index];

            if(user.actionTag.isEmpty) {
              return YKContactSectionHeader(userInfo: user,);
            }

            return YKContactCell(
                userInfo:user,
                onTap: () {
                    print('you tapped at index $index');
                },
            );
          },
        itemCount: dataSources.length,
      ),
    );
  }
}