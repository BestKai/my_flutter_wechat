import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class YKHomeSearchBar extends StatelessWidget {

  YKHomeSearchBar({this.onTap});

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 56,
      color: Color(0xffededed),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/searchBar_icon.png'),
              Container(
                margin: EdgeInsets.only(left: 4),
                child: Text('搜索',style: TextStyle(color: Color(0xff8f8e94),fontSize: 15),),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(6)),
            border: Border.all(
              color: Color(0xffe5e5e5),
              width: 1,
            )
          ),
        ),
      ),
    );
  }
}