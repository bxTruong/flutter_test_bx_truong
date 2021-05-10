class User {
  String gameId;
  String userName;
  String password;
  String appKey;
  String deviceInfo;

  User({
    this.gameId,
    this.userName,
    this.password,
    this.appKey,
    this.deviceInfo,
  });

  User.fromJson(Map<String, dynamic> json) {
    gameId = json['gameId'];
    userName = json['userName'];
    password = json['password'];
    appKey = json['appKey'];
    deviceInfo = json['deviceInfo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gameId'] = this.gameId;
    data['userName'] = this.userName;
    data['password'] = this.password;
    data['appKey'] = this.appKey;
    data['deviceInfo'] = this.deviceInfo;
    return data;
  }
}
