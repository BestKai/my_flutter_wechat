import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:math';
import 'dart:io';

import '../Common/YKCustomNavigationBar.dart';
import 'View/YKMomentHeaderView.dart';
import 'View/YKMomentCell.dart';
import 'View/YKMomentOprerationView.dart';

class YKMomentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return YKMomentFulPage();
  }
}


class YKMomentFulPage extends StatefulWidget {
  @override
  createState() => YKMomentState();
}

class YKMomentState extends State<YKMomentFulPage> {

  ScrollController _controller = ScrollController();
  double _navOffset = 0;
  int listlength = 20;

  Offset opOffset = Offset(0, 0);
  bool showOperationView = false;

  List<Map<String,dynamic>> moments = [];

  File _image;

  List<String> pictures = [
    'http://file15.zk71.com/File/CorpEditInsertImages/2016/07/05/0_yitongwuliu_8888_20160705101346.jpg',
    'http://pic23.nipic.com/20120823/10717094_095551546198_2.jpg',
    'http://img.sccnn.com/bimg/337/28719.jpg',
    'http://pic13.nipic.com/20110422/4629619_133017242179_2.jpg',
    'http://img17.3lian.com/d/file/201702/16/17cd567662bafc8d63d73d41444585d2.jpg',
    'http://img3.redocn.com/tupian/20150718/haibianriluofengjingtu_4598258.jpg',
    'http://pic15.nipic.com/20110617/2707401_222212013000_2.jpg',
    'http://imgsrc.baidu.com/image/c0%3Dshijue1%2C0%2C0%2C294%2C40/sign=b9edca2e566034a83defb0c2a37a2321/5fdf8db1cb13495429ebab4b5c4e9258d1094a23.jpg',
    'http://imgsrc.baidu.com/image/c0%3Dshijue1%2C0%2C0%2C294%2C40/sign=e5c064e4888ba61ecbe3c06c295dfd7f/a9d3fd1f4134970a64bb72019fcad1c8a6865dd7.jpg'
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      setState(() {
        _navOffset = _controller.offset;
        showOperationView = false;
      });
    });

    for(int i = 0; i<20;i++) {
      moments.add(
          {
            'avatar':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553173065&di=a8dc27a67d0f825b79879be41aa833a2&imgtype=jpg&er=1&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201803%2F28%2F20180328083913_hrkpt.thumb.700_0.jpg',
            'nickName':'Best--Kai',
            'content':'本文主要介绍Flutter布局中的Flow、Table、Wrap控件，详细介绍了其布局行为以及使用场景，并对源码进行了分析。',
            'address':'河南·郑州',
            'time':'2019.3.29',
            'pics':pictures.sublist(0,Random().nextInt(10))
          }
      );
    }
  }


  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return CupertinoPageScaffold(
        child: Stack(
          children: <Widget>[
            ListView.builder(
              padding: EdgeInsets.only(top: 0),
                controller: _controller,
                itemBuilder: (context,index) {
                  if(index==0) {
                    return YKMomentHeaderView();
                  }
                  return YKMomentCell(moment: moments[index-1],opCallBack: (top,right) {
                    print('^^^^${top}^^^^${right}');
                    setState(() {
                      opOffset = Offset(right, top);
                      showOperationView = !showOperationView;
                    });
                  },);
                },
              itemCount: moments.length+1,
            ),
            YKCustomNavigationBar(offset: _navOffset,),
            YKMomentOperationView(top: opOffset.dy,right: opOffset.dx,isVisible: showOperationView,)
          ],
        )
    );
  }
}
