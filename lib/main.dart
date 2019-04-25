import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_wechat/Chats/YKChatHomePage.dart';
import 'package:my_flutter_wechat/Contacts/YKContactsHomePage.dart';
import 'package:my_flutter_wechat/Discover/YKDiscoverHomePage.dart';
import 'package:my_flutter_wechat/Me/YKMineHomePage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoApp(
      //解决在CupertinoApp 中无法使用Material组件问题
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      title: '微信Demo',
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            items: [
          BottomNavigationBarItem(
              icon: Image.asset('images/tabbar_mainframe.png'),
              activeIcon: Image.asset('images/tabbar_mainframe_hl.png'),
              title: Text('微信'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/tabbar_contacts.png'),
            activeIcon: Image.asset('images/tabbar_contacts_hl.png'),

            title: Text('通讯录'),
          ),

          BottomNavigationBarItem(
            icon: Image.asset('images/tabbar_discover.png'),
            activeIcon: Image.asset('images/tabbar_discover_hl.png'),
            title: Text('发现'),
          ),

          BottomNavigationBarItem(
            icon: Image.asset('images/tabbar_me.png'),
            activeIcon: Image.asset('images/tabbar_me_hl.png'),
            title: Text('我'),
          ),
        ],
          activeColor: Color(0xFF1FB922),
          inactiveColor: Color(0xFF333333),
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              switch (index) {
                case 0:
                  return YKChatHomePage();
                  break;
                case 1:
                  return YKContactsHomePage();
                  break;
                case 2:
                  return YKDiscoverHomePage();
                  break;
                case 3:
                  return YKMineHomePage();
                  break;
              }
            },
          );
        },
    );
  }
}