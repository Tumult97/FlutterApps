class SmartCallMarginVoucherCount{
  String network;
  int count;

  SmartCallMarginVoucherCount({this.network, this.count});

  SmartCallMarginVoucherCount.fromJson(Map<String, dynamic> json) {
    network = json['Network'];
    count = json['Count'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Network'] = this.network;
    data['Count'] = this.count;
    return data;
  }
}