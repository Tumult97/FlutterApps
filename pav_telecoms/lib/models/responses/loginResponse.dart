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
  }
}