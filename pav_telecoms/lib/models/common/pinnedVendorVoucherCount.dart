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
}