class Report {
  bool centered;
  String text;

  Report({this.centered, this.text});

  Report.fromJson(Map<String, dynamic> json) {
    centered = json['Centered'];
    text = json['Text'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Centered'] = this.centered;
    data['Text'] = this.text;
    return data;
  }
}