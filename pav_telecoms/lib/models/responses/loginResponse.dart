import 'package:pav_telecoms/models/common/pinnedVendorVoucherCount.dart';
import 'package:pav_telecoms/models/common/smartCallMarginVoucherCount.dart';
import 'package:pav_telecoms/models/common/status.dart';

class LoginResponse{
  Status status;
  bool isAdmin;
  int clientId;
  int userId;
  int accessLevel;
  String clientName;
  Null enableAdvancedPos;
  bool printStoreSlipCopy;
  bool printBarCodeOnStoreSlip;
  bool printBarcodeOnCustomerSlip;
  int electricityType;
  bool allowSales;
  bool allowReprint;
  bool voucherReports;
  bool rica;
  int shift;
  String headerText1;
  String headerText2;
  String headerText3;
  String footerText1;
  String footerText2;
  String footerText3;
  bool enablePasswordOnVend;
  String whiteLabelCompanyName;
  bool electricityActive;
  List<PinnedVendorVoucherCount> vendorVoucherCounts;
  bool allowDSTV;
  List<SmartCallMarginVoucherCount> smartCallVoucherCounts;
  bool allowPinlessElectrivityVending;
  bool mabonengVoucherCount;
  String clientCode;
  bool allowLotto;
  bool allowOTTVend;
  bool allowWalletTransfer;
  String manufacturer;

  LoginResponse({this.status, this.isAdmin, this.clientId, this.userId, this.accessLevel, this.clientName, this.enableAdvancedPos, this.printStoreSlipCopy, this.printBarCodeOnStoreSlip, this.printBarcodeOnCustomerSlip, this.electricityType, this.allowSales, this.allowReprint, this.voucherReports, this.rica, this.shift, this.headerText1, this.headerText2, this.headerText3, this.footerText1, this.footerText2, this.footerText3, this.enablePasswordOnVend, this.whiteLabelCompanyName, this.electricityActive, this.vendorVoucherCounts, this.allowDSTV, this.smartCallVoucherCounts, this.allowPinlessElectrivityVending, this.mabonengVoucherCount, this.clientCode, this.allowLotto, this.allowOTTVend, this.allowWalletTransfer, this.manufacturer});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['Status'] != null ? new Status.fromJson(json['Status']) : null;
    isAdmin = json['IsAdmin'];
    clientId = json['ClientId'];
    userId = json['UserId'];
    accessLevel = json['AccessLevel'];
    clientName = json['ClientName'];
    enableAdvancedPos = json['EnableAdvancedPos'];
    printStoreSlipCopy = json['PrintStoreSlipCopy'];
    printBarCodeOnStoreSlip = json['PrintBarCodeOnStoreSlip'];
    printBarcodeOnCustomerSlip = json['PrintBarcodeOnCustomerSlip'];
    electricityType = json['ElectricityType'];
    allowSales = json['AllowSales'];
    allowReprint = json['AllowReprint'];
    voucherReports = json['VoucherReports'];
    rica = json['Rica'];
    shift = json['Shift'];
    headerText1 = json['HeaderText1'];
    headerText2 = json['HeaderText2'];
    headerText3 = json['HeaderText3'];
    footerText1 = json['FooterText1'];
    footerText2 = json['FooterText2'];
    footerText3 = json['FooterText3'];
    enablePasswordOnVend = json['EnablePasswordOnVend'];
    whiteLabelCompanyName = json['WhiteLabelCompanyName'];
    electricityActive = json['ElectricityActive'];
    if (json['VendorVoucherCounts'] != null) {
      vendorVoucherCounts = new List<PinnedVendorVoucherCount>();
      json['VendorVoucherCounts'].forEach((v) {
        vendorVoucherCounts.add(new PinnedVendorVoucherCount.fromJson(v));
      });
    }
    allowDSTV = json['AllowDSTV'];
    if (json['SmartCallVoucherCounts'] != null) {
      smartCallVoucherCounts = new List<SmartCallMarginVoucherCount>();
      json['SmartCallVoucherCounts'].forEach((v) {
        smartCallVoucherCounts.add(new SmartCallMarginVoucherCount.fromJson(v));
      });
    }
    allowPinlessElectrivityVending = json['AllowPinlessElectrivityVending'];
    mabonengVoucherCount = json['MabonengVoucherCount'];
    clientCode = json['ClientCode'];
    allowLotto = json['AllowLotto'];
    allowOTTVend = json['AllowOTTVend'];
    allowWalletTransfer = json['AllowWalletTransfer'];
    manufacturer = json['Manufacturer'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['Status'] = this.status.toMap();
    }
    data['IsAdmin'] = this.isAdmin;
    data['ClientId'] = this.clientId;
    data['UserId'] = this.userId;
    data['AccessLevel'] = this.accessLevel;
    data['ClientName'] = this.clientName;
    data['EnableAdvancedPos'] = this.enableAdvancedPos;
    data['PrintStoreSlipCopy'] = this.printStoreSlipCopy;
    data['PrintBarCodeOnStoreSlip'] = this.printBarCodeOnStoreSlip;
    data['PrintBarcodeOnCustomerSlip'] = this.printBarcodeOnCustomerSlip;
    data['ElectricityType'] = this.electricityType;
    data['AllowSales'] = this.allowSales;
    data['AllowReprint'] = this.allowReprint;
    data['VoucherReports'] = this.voucherReports;
    data['Rica'] = this.rica;
    data['Shift'] = this.shift;
    data['HeaderText1'] = this.headerText1;
    data['HeaderText2'] = this.headerText2;
    data['HeaderText3'] = this.headerText3;
    data['FooterText1'] = this.footerText1;
    data['FooterText2'] = this.footerText2;
    data['FooterText3'] = this.footerText3;
    data['EnablePasswordOnVend'] = this.enablePasswordOnVend;
    data['WhiteLabelCompanyName'] = this.whiteLabelCompanyName;
    data['ElectricityActive'] = this.electricityActive;
    if (this.vendorVoucherCounts != null) {
      data['VendorVoucherCounts'] =
          this.vendorVoucherCounts.map((v) => v.toMap()).toList();
    }
    data['AllowDSTV'] = this.allowDSTV;
    if (this.smartCallVoucherCounts != null) {
      data['SmartCallVoucherCounts'] =
          this.smartCallVoucherCounts.map((v) => v.toMap()).toList();
    }
    data['AllowPinlessElectrivityVending'] =
        this.allowPinlessElectrivityVending;
    data['MabonengVoucherCount'] = this.mabonengVoucherCount;
    data['ClientCode'] = this.clientCode;
    data['AllowLotto'] = this.allowLotto;
    data['AllowOTTVend'] = this.allowOTTVend;
    data['AllowWalletTransfer'] = this.allowWalletTransfer;
    data['Manufacturer'] = this.manufacturer;
    return data;
  }
}