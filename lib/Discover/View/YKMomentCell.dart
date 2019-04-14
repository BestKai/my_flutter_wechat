import 'package:flutter/material.dart';

import 'YKMomentOprerationView.dart';


typedef OperationCallBack = void Function(double top,double right);

class YKMomentCell extends StatefulWidget {

  YKMomentCell({this.moment,this.opCallBack});

  Map<String,dynamic> moment;

  OperationCallBack opCallBack;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return YKMomentCellState();
  }
}

class YKMomentCellState extends State<YKMomentCell> {

  Map<String, dynamic> moment;

  GlobalKey operationKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.moment = this.widget.moment;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var avatar = Container(
        child: FadeInImage.assetNetwork(
          placeholder: 'images/defaultHead.png',
          image: moment['avatar'],
          fit: BoxFit.cover,
        ),
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        )
    );

    var nickName = Container(
      child: Text('${moment['nickName']}',
        style: TextStyle(fontSize: 15, color: Color(0xff49568e)),maxLines: 1,overflow: TextOverflow.ellipsis,),
    );

    var content = Container(
      margin: EdgeInsets.only(top: 8),
      child: Text('${moment['content']}', style: TextStyle(fontSize: 16,),softWrap: true,),
    );

    var address = Container(
      margin: EdgeInsets.only(top: 6),
      child: Text('${moment['address']}',
          style: TextStyle(fontSize: 13, color: Color(0xff49568e))),
    );

    var time = Container(
      margin: EdgeInsets.only(top: 10,bottom: 10),
      child: Text('${moment['time']}',
          style: TextStyle(fontSize: 13, color: Color(0xffa8a8a8))),
    );


    var operation = Column(
      key: operationKey,
      children: <Widget>[
        Container(    
          padding: EdgeInsets.only(top: 5,bottom: 5),
          child: GestureDetector(
            child: Image.asset('images/moment_icon_op.png',width: 40,alignment:Alignment.centerRight,),
            onTap: () {
              //获取控件位置以及大小
              RenderBox box = operationKey.currentContext.findRenderObject();

              var offset = box.localToGlobal(Offset.zero);

              print('控件大小${box.size}位置${box.localToGlobal(Offset.zero)}');

              this.widget.opCallBack(offset.dy,offset.dx);
            },
          ),
        )
      ],
    );

    var pictures = Offstage(
      offstage: moment['pics'].length==0,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Wrap(
          spacing: 5.0, // 主轴(水平)方向间距
          runSpacing: 5.0, // 纵轴（垂直）方向间距
          children: getPictureWidgets(),
        ),
      ),
    );

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 16,left: 16,right: 16),
          child: Row(//头像、昵称、内容
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              avatar,
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child:Column(//昵称、内容
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      nickName,
                      content,
                      pictures,
                      address,
                      Container(//时间和评论按钮
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            time,
                            operation,
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 0.5,
          color: Color(0xffd9d9d9),
        )
      ],
    );
  }
  
  List<Widget> getPictureWidgets () {
    List<Widget> pictureWidgets = [];
    List<String> pictureUrls = moment['pics'];

    double width = calulatePictureWidth(context,pictureUrls.length);

    for (int i = 0;i < pictureUrls.length;i++) {
      pictureWidgets.add(Container(
        color: Color(0xffd9d9d9),
        width: width,
        height: width,
        child: Image.network(
          pictureUrls[i],
          fit: BoxFit.cover,
        ),
      ));
    }
    return pictureWidgets;
  }
}

double calulatePictureWidth(BuildContext context,int picCount) {
  double screenW = MediaQuery.of(context).size.width;
  int margin = 64*2;
  if(picCount==1) {
    return (screenW-margin)/2;
  }else {
    return (screenW-margin-10)/3;
  }
}
