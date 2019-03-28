class YKChatModel {
  String avatar;
  String userName;
  String chatMsg;
  String time;

  YKChatModel.fromJson(jsonStr) {
    avatar = jsonStr['avatar'];
    userName = jsonStr['userName'];
    chatMsg = jsonStr['chatMsg'];
    time = jsonStr['time'];
  }
}