import 'package:pav_telecoms/models/common/report.dart';
import 'package:pav_telecoms/models/common/status.dart';

class SalesSummaryUserResponse {
  Status status;
  List<Report> report;

  SalesSummaryUserResponse({this.status, this.report});

  SalesSummaryUserResponse.fromJson(Map<String, dynamic> json) {
    status =
    json['Status'] != null ? new Status.fromJson(json['Status']) : null;
    if (json['Report'] != null) {
      report = new List<Report>();
      json['Report'].forEach((v) {
        report.add(new Report.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['Status'] = this.status.toMap();
    }
    if (this.report != null) {
      data['Report'] = this.report.map((v) => v.toMap()).toList();
    }
    return data;
  }
}