import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YKChatToolBar extends StatefulWidget {

  YKChatToolBar({this.sendMessage});

  ValueChanged sendMessage;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChatToolBarState();
  }
}

class ChatToolBarState extends State<YKChatToolBar>  with TickerProviderStateMixin {

  TextEditingController _inputTextController;

  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _inputTextController = TextEditingController();

    animationController = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
    animation = Tween(begin: 0.0, end: 240.0).animate(CurvedAnimation(parent: animationController, curve: Curves.easeIn));

    animation.addStatusListener((status) {
        print('++++++++${status}++++++${animation.value}');
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Container(
      color: Color(0xfff6f6f6),
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom+animation.value),
      height:56,
      child: Container(
        child: Row(
          children: <Widget>[
            GestureDetector(
              child: Container(
                child: Image.asset('images/chat_icon_toolbar_voice.png'),
                margin: EdgeInsets.only(left: 10,),
              ),
              onTap: () {
                print('语音');
              },
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(top: 8,bottom: 8,left: 10,right: 10),
                color: Colors.white,
                child: CupertinoTextField(
                  textInputAction: TextInputAction.send,
                  controller: _inputTextController,
                  padding: EdgeInsets.all(8),
                  style: TextStyle(fontSize: 17,color: Colors.black),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  maxLines: 5,
                  onSubmitted: (text){
                    if(text!=null){
                      this.widget.sendMessage(text);
                    }
                    _inputTextController.clear();
                  },
                  onEditingComplete: () {//实现了才能避免return键键盘消失
                    print('避免键盘隐藏');
                  },
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                child: Image.asset('images/chat_icon_toolbar_sticker.png'),
              ),
              onTap: () {
                print('表情');
                setState(() {
                  animationController.forward();
                });
              },
            ),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(left: 12,right: 10),
                child: Image.asset('images/chat_icon_toolbar_addmore.png'),
              ),
              onTap: () {
                print('更多');
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _inputTextController.dispose();
    animationController.dispose();
  }

}