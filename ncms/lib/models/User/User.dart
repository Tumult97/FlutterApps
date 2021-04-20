class User {
  String name;
  String profileUrl;

  double lastWeek;
  double lastDay;

  bool isUser;

  //https://projects-api.ncms.co.za/files/UserAvatar?userId=01e0a0b3-77d5-4875-8761-4751a7aa17d9
  User({this.name, this.profileUrl, this.lastWeek, this.lastDay, this.isUser});
}