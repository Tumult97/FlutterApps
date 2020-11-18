class SalesSummaryRequest {
  String terminalId;
  String dateFrom;
  String dateTo;
  int userId;

  SalesSummaryRequest(
      {this.terminalId, this.dateFrom, this.dateTo, this.userId});

  SalesSummaryRequest.fromJson(Map<String, dynamic> json) {
    terminalId = json['TerminalId'];
    dateFrom = json['DateFrom'];
    dateTo = json['DateTo'];
    userId = json['UserId'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TerminalId'] = this.terminalId;
    data['DateFrom'] = this.dateFrom;
    data['DateTo'] = this.dateTo;
    data['UserId'] = this.userId;
    return data;
  }
}