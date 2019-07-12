import 'package:flutter/cupertino.dart';

class YKNewFriendsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('新的朋友'),
          leading: CupertinoButton(
              padding: EdgeInsets.only(left: 0, right: 34),
              child: Image.asset('images/nav_icon_back.png'),
              onPressed: () {
                Navigator.pop(context);
              }),
          trailing: CupertinoButton(
            child: Text('添加朋友'),
            onPressed: () {
              goToAddNewFriends();
            },
          ),
        ),
        child: null,
    );
  }

  goToAddNewFriends() {

  }
}