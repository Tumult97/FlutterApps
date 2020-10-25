class Status{
  bool success;
  String message;

  Status({this.success, this.message});

  Status.fromJson(Map<String, dynamic> json) {
    success = json['Success'];
    message = json['Message'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Success'] = this.success;
    data['Message'] = this.message;
    return data;
  }
}