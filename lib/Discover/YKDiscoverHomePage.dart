import 'package:flutter/cupertino.dart';

import 'View/YKDiscoverHomeCell.dart';
import 'Model/YKDiscoverHomeModel.dart';
import 'YKMomentPage.dart';

class YKDiscoverHomePage extends StatelessWidget {

  final dataSources = [];

  YKDiscoverHomePage(){
    initData();
  }

  void initData(){
     dataSources.add(YKDiscoverHomeModel(icon: 'images/moment_icon_moment.png',title: '朋友圈'));
     dataSources.add(YKDiscoverHomeModel(icon: ''));
     dataSources.add(YKDiscoverHomeModel(icon: 'images/moment_icon_scan.png',title: '扫一扫'));
     dataSources.add(YKDiscoverHomeModel(icon: 'images/moment_icon_shake.png',title: '摇一摇'));
     dataSources.add(YKDiscoverHomeModel(icon: ''));
     dataSources.add(YKDiscoverHomeModel(icon: 'images/moment_icon_news.png',title: '看一看',hasNew: true));
     dataSources.add(YKDiscoverHomeModel(icon: 'images/moment_icon_search.png',title: '搜一搜'));
     dataSources.add(YKDiscoverHomeModel(icon: ''));
     dataSources.add(YKDiscoverHomeModel(icon: 'images/moment_icon_nearby.png',title: '附近的人'));
     dataSources.add(YKDiscoverHomeModel(icon: ''));
     dataSources.add(YKDiscoverHomeModel(icon: 'images/moment_icon_wxapp.png',title: '小程序'));
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('发现'),
      ),
      backgroundColor: Color(0xffededed),
      child: ListView.builder(
          itemCount: dataSources.length,
          itemBuilder: (BuildContext context, int index) {

            YKDiscoverHomeModel homeModel = dataSources[index];

            if(homeModel.icon.isEmpty) {
              return YKDisCoverHomeSeparatorCell();
            }

            return YKDisCoverHomeCell(
              homeModel: homeModel,
              onTap: () {
                print('you tapped at title ${homeModel.title}');

                if(index==0) {
                  goToMomentPage(context);
                }
              },
            );
          }
      ),
    );
  }
}

void goToMomentPage (BuildContext context) {
  Navigator.of(context,rootNavigator: true).push(CupertinoPageRoute(builder: (context) {
    return YKMomentPage();
  }));
}