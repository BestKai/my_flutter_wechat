import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

enum MessageBubbleType {
  sender,
  receiver,
}


class MessageCell extends StatelessWidget {

  const MessageCell({Key key,this.message
  }):super(key:key);

  final Map<String,dynamic> message;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}



class TextMessageCell extends StatelessWidget {

  const TextMessageCell({
    this.message,
    this.onTap,
  });

  final Map<String,dynamic> message;
  final GestureTapCallback onTap;


  @override
  Widget build(BuildContext context) {

    bool isSender = message['bubble']==MessageBubbleType.sender;

    Widget avatar= Container(
      width: 42,
      height: 42,
      margin: isSender?EdgeInsets.only(right: 16,):EdgeInsets.only(left: 16,top: 8),
      child: FadeInImage.assetNetwork(
        placeholder: 'images/defaultHead.png',
        image: message['avatar'],
        fit: BoxFit.cover,
      ),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius:BorderRadius.all(Radius.circular(4)),
          border: Border.all(
            color: Color(0xffdddddd),
            width: 1,
          )
      ),
    );
    Widget messageBg = Container(
      child: ClipPath(
        clipper: MessageBubbleCliper(isSender: isSender),
        child: Container(
          color: isSender?Color(0xff94ed68):Colors.white,
          child: Container(
            padding: EdgeInsets.only(left: 16,right: 12,top: 11,bottom: 11),
            child: Text(message['content'],style: TextStyle(fontSize: 17,color: Colors.black),),
          ),
        ),
      ),
    );

    Widget nickName = Container(
      margin: EdgeInsets.only(left: 6,bottom: 4),
      child: Text(message['nickName'],style: TextStyle(fontSize: 15,color: Color(0xff737373)),),
    );

    Widget time = Container(
      margin: EdgeInsets.only(top: 12,bottom: 12),
      child: Text(message['time'],style: TextStyle(fontSize: 13,color: Colors.black26),),
    );

    Widget receiveRow = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        avatar,
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 64,left: 4,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                nickName,
                messageBg
              ],
            ),
          ),
        ),
      ],
    );

    Widget senderRow = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 64,right: 4,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                messageBg
              ],
            ),
          ),
        ),
        avatar,
      ],
    );


    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Color(0xffededed),
        margin: EdgeInsets.only(bottom: 12),
        child: Column(
          children: <Widget>[
            time,
            Container(
              child: isSender?senderRow:receiveRow,
            ),
          ],
        ),
      ),
    );
  }
}


class ImageMessageCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}




class MessageBubbleCliper extends CustomClipper<Path> {

  MessageBubbleCliper({this.isSender});

  bool isSender;

  @override
  Path getClip(Size size) {
    // TODO: implement getClip

    double radius = 6;
    double triangleHeight = 12;
    double triangleWidth = 6;
    double triangleLeftTopMargin = 12;

    Path path = Path();
    if(isSender) {
      path.moveTo(radius, 0);
      path.lineTo(size.width-radius-triangleWidth, 0);
      path.arcToPoint(Offset(size.width-triangleWidth, radius),radius: Radius.circular(radius));
      path.lineTo(size.width-triangleWidth, radius+triangleLeftTopMargin);
      path.lineTo(size.width, radius+triangleLeftTopMargin+triangleHeight/2);
      path.lineTo(size.width-triangleWidth, radius+triangleLeftTopMargin+triangleHeight);
      path.lineTo(size.width-triangleWidth, size.height-radius);
      path.arcToPoint(Offset(size.width-radius-triangleWidth, size.height),radius: Radius.circular(radius));
      path.lineTo(radius, size.height);
      path.arcToPoint(Offset(0, size.height-radius),radius: Radius.circular(radius));
      path.lineTo(0, radius);
      path.arcToPoint(Offset(radius, 0),radius: Radius.circular(radius));
    }else{
      path.moveTo(triangleWidth+radius, 0);
      path.lineTo(size.width-radius, 0);
      path.arcToPoint(Offset(size.width, radius),radius: Radius.circular(radius));
      path.lineTo(size.width, size.height-radius);
      path.arcToPoint(Offset(size.width-radius, size.height),radius: Radius.circular(radius));
      path.lineTo(triangleWidth+radius, size.height);
      path.arcToPoint(Offset(triangleWidth, size.height-radius),radius: Radius.circular(radius));
      path.lineTo(triangleWidth, radius+triangleLeftTopMargin+triangleHeight);
      path.lineTo(0, radius+triangleLeftTopMargin+triangleHeight/2);
      path.lineTo(triangleWidth, radius+triangleLeftTopMargin);
      path.lineTo(triangleWidth, radius);
      path.arcToPoint(Offset(triangleWidth+radius, 0),radius: Radius.circular(radius));
    }

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}