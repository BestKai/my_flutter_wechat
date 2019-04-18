import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YKSearchHistoryPage extends StatelessWidget {

  YKSearchHistoryPage({this.fromeHome});

  final bool fromeHome;

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
                      child: Text(this.fromeHome?'搜索指定内容':'快速搜索聊天内容',style: TextStyle(fontSize: 16,color: Color(0xffb2b2b2)),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      width: 300,
                      child: Wrap(
                        runSpacing: 30,
                        children: _getSubViews(),
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

  List<Widget> _getSubViews (){
    List<String> subTitles = this.fromeHome?['朋友圈','文章','公众号','小程序','音乐','表情']:['日期','图片及视频','文件','链接','音乐','交易','小程序'];
    List<Widget> subViews = [];
    for (int i = 0; i< subTitles.length;i++){
      subViews.add(Container(
        width:100,
        height: 20,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(subTitles[i],style: TextStyle(fontSize: 16,color: Color(0xff576c94)),textAlign: TextAlign.center,)),
          ],
        ),
      ));
    }
    return subViews;
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