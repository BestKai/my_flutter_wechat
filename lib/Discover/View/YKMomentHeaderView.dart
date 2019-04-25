import 'package:flutter/material.dart';

class YKMomentHeaderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.width*(320/375.0)+48,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.width*(320/375.0),
            child: Image.asset('images/moment_header_bg.jpg',fit: BoxFit.fill,),
          ),
          Positioned(
            right: 16,
              bottom: 24,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 46,
                    child: Center(
                      child: Text('Best--Kai',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white),),
                    ),
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    margin: EdgeInsets.only(left: 20),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'images/defaultHead.png',
                      image: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553173065&di=a8dc27a67d0f825b79879be41aa833a2&imgtype=jpg&er=1&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201803%2F28%2F20180328083913_hrkpt.thumb.700_0.jpg',
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
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}