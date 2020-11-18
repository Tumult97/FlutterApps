class LatestDeposits {
  double amount;
  String created;
  String reference;

  LatestDeposits({this.amount, this.created, this.reference});

  LatestDeposits.fromJson(Map<String, dynamic> json) {
    amount = double.parse(json['Amount'].toString());
    created = json['Created'];
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