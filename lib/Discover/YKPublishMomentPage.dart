import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class YKPublishMomentPage extends StatefulWidget {

  YKPublishMomentPage({this.firstImage});

  final File firstImage;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return YKPublishMomentState();
  }
}

class YKPublishMomentState extends State<YKPublishMomentPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.only(left: 0, right: 30),
          child: Text(
            '取消',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        trailing: Container(
          width: 56,
          height: 32,
          child: Center(
            child: Text(
              '发表',
              style: TextStyle(color: Colors.white),
            ),
          ),
          decoration: BoxDecoration(
            color: Color(0xFF1FB922),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
      child: ListView.builder(
        itemBuilder: (context,index){
          if(index==0){
            return YKPublishMomentInputView();
          }else if(index==1){
            return YKPublishMomentPicView();
          }else if(index == 2){
            return YKPublishMomentSelectView(data: {'icon':'moment_icon_location.png','title':'所在位置','subTitle':''},isLast: false);
          }else if(index == 3){
            return YKPublishMomentSelectView(data: {'icon':'moment_icon_me.png','title':'谁可以看','subTitle':'公开'},isLast: false);
          }else if(index == 4){
            return YKPublishMomentSelectView(data: {'icon':'moment_icon_at.png','title':'提醒谁看','subTitle':''},isLast: true,);
          }else{
            return YKPublishMomentFooterView();
          }
        },
        itemCount: 6,
      ),
    );
  }
}



class YKPublishMomentInputView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Container(
       alignment: AlignmentDirectional.topStart,
       height: 106,
       child: CupertinoTextField(
         padding: EdgeInsets.only(left: 38,right: 38,top: 20,),
         placeholder: '这一刻的想法',
         maxLines: 5,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(0),
           border: Border.all(
             color: Colors.white,
           )
         ),
       ),
     );
  }
}

class YKPublishMomentPicView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return YKPublishMomentPicState();
  }
}


class YKPublishMomentPicState extends State<YKPublishMomentPicView> {

  List<File> pics = [];

  @override
  Widget build(BuildContext context) {

    Future _getImage(bool isCamera,int index) async {
      var image = await ImagePicker.pickImage(source: isCamera?ImageSource.camera:ImageSource.gallery);
      setState(() {
        pics.add(image);
      });
    }

    List<Widget> getPicWidgets() {

      List<Widget> picWidgets = [];

      for(int i = 0; i< pics.length;i++){
        picWidgets.add(Container(
          width: 98,
          height: 98,
          color: Color(0xffededed),
          child: Image.file(pics[i],fit: BoxFit.cover,),
        ));
      }

      if(pics.length<9){
        picWidgets.add(GestureDetector(
          child: Container(
            width: 98,
            height: 98,
            color: Color(0xffededed),
            child: Center(
              child: Image.asset('images/moment_icon_album_add.png'),
            ),
          ),
          onTap: () {
            _showSelectActionSheet(
              context:context,
              child: CupertinoActionSheet(
                actions: <Widget>[
                  CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.pop(context,);
                      _getImage(true,pics.length);
                    },
                    child: Container(
                      child: Text('拍摄',style: TextStyle(color: Colors.black,fontSize: 18),),
                    ),
                  ),
                  CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.pop(context,);
                      _getImage(false,pics.length);
                    },
                    child: Container(
                      child: Text('从手机相册选择',style: TextStyle(color: Colors.black,fontSize: 18),),
                    ),
                  ),
                ],
                cancelButton: CupertinoActionSheetAction(
                  child: Text('取消',style: TextStyle(color: Colors.black,fontSize: 18)),
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.pop(context,);
                  },
                ),
              ),
            );
          },
        ));
      }

      return picWidgets;
    }


    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 38,right: 32),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 32,top: 32),
            alignment: Alignment.topLeft,
            child: Wrap(
              runSpacing: 5,
              spacing: 5,
              children:getPicWidgets(),
            ),
          ),
          Divider(height: 1,indent: 0,color: Color(0xffe5e5e5),),
        ],
      ),
    );
  }
}



class YKPublishMomentSelectView extends StatelessWidget {

  YKPublishMomentSelectView({this.data,this.isLast});

  final Map<String,String> data;

  final bool isLast;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 56,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 38),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Image.asset('images/${data['icon']}'),
                        Container(
                          margin: EdgeInsets.only(left: 18),
                          child: Text('${data['title']}'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 45),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(data['subTitle'],style: TextStyle(color: Color(0xff7f7f7f)),),
                          margin: EdgeInsets.only(right: 12),
                        ),
                        Image.asset('images/tableview_arrow.png'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: isLast?38:76,right: 30),
            child:Divider(height: 1,indent: 0,color: Color(0xffe5e5e5),),
          ),
        ],
      ),
    );
  }
}

class YKPublishMomentFooterView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return YKPublishMomentFooterState();
  }
}

class YKPublishMomentFooterState extends State<YKPublishMomentFooterView> {

  bool isSelected=false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.topLeft,
      height: 70,
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(left: 38,top: 20),
          padding: EdgeInsets.all(5),
          child: Image.asset(isSelected?'images/moment_icon_QQSpaceBigHL.png':'images/moment_icon_QQSpaceBig.png'),
        ),
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
      ),
    );
  }
}


void _showSelectActionSheet({BuildContext context, Widget child}) {
  showCupertinoModalPopup<String>(
    context: context,
    builder: (BuildContext context) => child,
  );
}
