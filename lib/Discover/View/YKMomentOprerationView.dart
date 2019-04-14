import 'package:flutter/material.dart';

class PopMenuRoute extends PopupRoute {
  final Duration _duration = Duration(milliseconds: 300);
  Widget child;

  PopMenuRoute({@required this.child});

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}

class YKMomentOperationView extends StatelessWidget {

  YKMomentOperationView({
    this.right,
    this.top,
    this.isVisible
  });

  final double right;
  final double top;
  final isVisible;

  @override
  Widget build(BuildContext context) {

    var like = Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/moment_icon_like_white.png'),
            Container(
              margin: EdgeInsets.only(left: 6),
              child: Text('赞',style: TextStyle(color: Colors.white),),
            )
          ],
        )
    );

    var comment = Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/moment_icon_comment_white.png'),
            Container(
              margin: EdgeInsets.only(left: 6),
              child: Text('评论',style: TextStyle(color: Colors.white),),
            )
          ],
        )
    );

    return isVisible?Positioned(
      right: MediaQuery.of(context).size.width-right,
      top: top,
      child: Container(
        width: 180,
        height: 35,
//              color: Color(0xff4b5353),//decoration 和color 不能同时设置
        child: Row(
          children: <Widget>[
            like,
            Container(
              width: 1,
              color: Color(0xff373e41),
              height: 24,
            ),
            comment
          ],
        ),
        decoration: BoxDecoration(
          color:  Color(0xff4b5353),
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
      ),
    ):Container();

    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-44,
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top+44),
            color: Colors.red,
          ),

          Positioned(
            right: right,
            top: top,
            child: Container(
              width: 180,
              height: 40,
//              color: Color(0xff4b5353),//decoration 和color 不能同时设置
              child: Row(
                children: <Widget>[
                  like,
                  Container(
                    width: 1,
                    color: Color(0xff373e41),
                    height: 24,
                  ),
                  comment
                ],
              ),
              decoration: BoxDecoration(
                color:  Color(0xff4b5353),
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}