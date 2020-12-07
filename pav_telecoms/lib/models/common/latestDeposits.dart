class LatestDeposits {
  double amount;
  DateTime created;
  String reference;

  LatestDeposits({this.amount, this.created, this.reference});

  LatestDeposits.fromJson(Map<String, dynamic> json) {
    amount = double.parse(json['Amount'].toString());
    created = DateTime.fromMillisecondsSinceEpoch(int.parse(json['Created'].toString().replaceAll("/Date(", "").replaceAll("+0200)/", "")));
    reference = json['Reference'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Amount'] = this.amount;
    data['Created'] = this.created;
    data['Reference'] = this.reference;
    return data;
  }
}