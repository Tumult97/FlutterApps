import 'package:pav_telecoms/models/common/latestDeposits.dart';
import 'package:pav_telecoms/models/common/status.dart';

class BalanceResponse {
  DateTime timestamp;
  Status status;
  double available;
  double openingBalance;
  double vouchers;
  double deposits;
  double adjustments;
  double fees;
  double closingBalance;
  double creditLimit;
  List<LatestDeposits> latestDeposits;

  BalanceResponse(
      {this.timestamp,
        this.status,
        this.available,
        this.openingBalance,
        this.vouchers,
        this.deposits,
        this.adjustments,
        this.fees,
        this.closingBalance,
        this.creditLimit,
        this.latestDeposits});

  BalanceResponse.fromJson(Map<String, dynamic> json) {
    timestamp = DateTime.now();
    status = json['Status'] != null ? new Status.fromJson(json['Status']) : null;
    available = double.parse(json['Available'].toString());
    openingBalance = double.parse(json['OpeningBalance'].toString());
    vouchers = double.parse(json['Vouchers'].toString());
    deposits = double.parse(json['Deposits'].toString());
    adjustments = double.parse(json['Adjustments'].toString());
    fees = double.parse(json['Fees'].toString());
    closingBalance = double.parse(json['ClosingBalance'].toString());
    creditLimit = double.parse(json['CreditLimit'].toString());
    if (json['LatestDeposits'] != null) {
      latestDeposits = new List<LatestDeposits>();
      json['LatestDeposits'].forEach((v) {
        latestDeposits.add(new LatestDeposits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Timestamp'] = this.timestamp;
    if (this.status != null) {
      data['Status'] = this.status.toMap();
    }
    data['Available'] = this.available;
    data['OpeningBalance'] = this.openingBalance;
    data['Vouchers'] = this.vouchers;
    data['Deposits'] = this.deposits;
    data['Adjustments'] = this.adjustments;
    data['Fees'] = this.fees;
    data['ClosingBalance'] = this.closingBalance;
    data['CreditLimit'] = this.creditLimit;
    if (this.latestDeposits != null) {
      data['LatestDeposits'] =
          this.latestDeposits.map((v) => v.toMap()).toList();
    }
    return data;
  }
}