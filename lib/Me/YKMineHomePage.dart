import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Contacts/Model/YKUserInfo.dart';
import '../Discover/Model/YKDiscoverHomeModel.dart';
import '../Discover/View/YKDiscoverHomeCell.dart';
import 'View/YKMineHomeUserInfoCell.dart';

class YKMineHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      backgroundColor: Color(0xffededed),
      child: YKMineHomePageStateful(),
    );
  }
}

class YKMineHomePageStateful extends StatefulWidget {
  @override
  createState() => new YKMineHomePageState();
}



class YKMineHomePageState extends State {

  YKUserInfo userInfo;
  final dataSources = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userInfo = YKUserInfo(
        avatar: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553173065&di=a8dc27a67d0f825b79879be41aa833a2&imgtype=jpg&er=1&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201803%2F28%2F20180328083913_hrkpt.thumb.700_0.jpg',
        nickName: 'Best--Kai',
        wxName: 'Best--Kai'
    );
    initData();
  }

  void initData() {
    dataSources.add(YKDiscoverHomeModel(icon: 'images/mine_icon_wechatpay.png',title: '支付'));
    dataSources.add(YKDiscoverHomeModel(icon: 'images/mine_icon_favorites.png',title: '收藏'));
    dataSources.add(YKDiscoverHomeModel(icon: 'images/mine_icon_album.png',title: '相册'));
    dataSources.add(YKDiscoverHomeModel(icon: 'images/mine_icon_cards.png',title: '卡包'));
    dataSources.add(YKDiscoverHomeModel(icon: 'images/mine_icon_sticker.png',title: '表情'));
    dataSources.add(YKDiscoverHomeModel(icon: 'images/mine_icon_setting.png',title: '设置'));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,

      child: Container(
        color: Color(0xffededed),
        child: ListView.separated(
            padding: EdgeInsets.all(0),//不设置状态栏会是灰色
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return YKMineHomeUserInfoCell(userInfo: userInfo);
              }
              return YKDisCoverHomeCell(homeModel: dataSources[index-1],);
            },
            separatorBuilder: (BuildContext context, int index) {
              if(index == 0 || index == 1 || index == 5) {
                return YKDisCoverHomeSeparatorCell();
              }
              return Divider(
                height: 0,
              );
            },
            itemCount: dataSources.length + 1
        ),
      ),
    );
  }
}