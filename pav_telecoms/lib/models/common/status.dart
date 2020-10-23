class Status{
  bool success;
  String message;

  Status({this.success, this.message});

  Status.fromJson(Map<String, dynamic> json) {
    success = json['Success'];
    message = json['Message'];
  }
}