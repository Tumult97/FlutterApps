class PinnedVendorVoucherCount{
  int vendorId;
  String name;
  int voucherCount;

  PinnedVendorVoucherCount({this.vendorId, this.name, this.voucherCount});

  PinnedVendorVoucherCount.fromJson(Map<String, dynamic> json) {
    vendorId = json['VendorId'];
    name = json['Name'];
    voucherCount = json['VoucherCount'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VendorId'] = this.vendorId;
    data['Name'] = this.name;
    data['VoucherCount'] = this.voucherCount;
    return data;
  }
}