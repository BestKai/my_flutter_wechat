import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YKSearchHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      backgroundColor: Color(0xffededed),
      child: Column(
        children: <Widget>[
          YKChatSearchBar(),
          Expanded(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Container(
                color: Color(0xffededed),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 45),
                      alignment: Alignment.center,
                      child: Text('快速搜索聊天内容',style: TextStyle(fontSize: 16,color: Color(0xffb2b2b2)),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      width: 300,
                      child: Wrap(
                        runSpacing: 30,
                        children: <Widget>[
                          Container(
                            width:100,
                            height: 20,
                            child: Row(
                              children: <Widget>[
                                Expanded(child: Text('日期',style: TextStyle(fontSize: 16,color: Color(0xff576c94)),textAlign: TextAlign.center,)),
                                Container(
                                  width: 1,
                                  color: Color(0xffdadada),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width:100,
                            height: 20,
                            child: Row(
                              children: <Widget>[
                                Expanded(child: Text('图片及视频',style: TextStyle(fontSize: 16,color: Color(0xff576c94)),textAlign: TextAlign.center,)),
                                Container(
                                  width: 1,
                                  color: Color(0xffdadada),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width:100,
                            height: 20,
                            child: Row(
                              children: <Widget>[
                                Expanded(child: Text('文件',style: TextStyle(fontSize: 16,color: Color(0xff576c94)),textAlign: TextAlign.center,)),
                              ],
                            ),
                          ),
                          Container(
                            width:100,
                            height: 20,
                            child: Row(
                              children: <Widget>[
                                Expanded(child: Text('链接',style: TextStyle(fontSize: 16,color: Color(0xff576c94)),textAlign: TextAlign.center,)),
                                Container(
                                  width: 1,
                                  color: Color(0xffdadada),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width:100,
                            height: 20,
                            child: Row(
                              children: <Widget>[
                                Expanded(child: Text('音乐',style: TextStyle(fontSize: 16,color: Color(0xff576c94)),textAlign: TextAlign.center,)),
                                Container(
                                  width: 1,
                                  color: Color(0xffdadada),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width:100,
                            height: 20,
                            child: Row(
                              children: <Widget>[
                                Expanded(child: Text('交易',style: TextStyle(fontSize: 16,color: Color(0xff576c94)),textAlign: TextAlign.center,)),
                              ],
                            ),
                          ),
                          Container(
                            width:100,
                            height: 20,
                            child: Row(
                              children: <Widget>[
                                Expanded(child: Text('小程序',style: TextStyle(fontSize: 16,color: Color(0xff576c94)),textAlign: TextAlign.center,)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class YKChatSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).padding.top+44,
      width: MediaQuery.of(context).size.width,
      color: Color(0xffededed),
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 8),
              width: MediaQuery.of(context).size.width-64,
              height: 36,
              child: CupertinoTextField(
                prefix: Container(
                  padding: EdgeInsets.only(left: 8),
                  child: Image.asset('images/searchBar_icon.png'),
                ),
                placeholder: '搜索',
                style: TextStyle(fontSize: 17,color: Colors.black),
                clearButtonMode: OverlayVisibilityMode.editing,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color(0xffe5e5e5),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            Expanded(
              child:GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text('取消',style: TextStyle(color: Color(0xff576c94)),),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}