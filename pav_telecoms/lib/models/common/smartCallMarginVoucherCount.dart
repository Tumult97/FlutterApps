class SmartCallMarginVoucherCount{
  String network;
  int count;

  SmartCallMarginVoucherCount({this.network, this.count});

  SmartCallMarginVoucherCount.fromJson(Map<String, dynamic> json) {
    network = json['Network'];
    count = json['Count'];
  }
}