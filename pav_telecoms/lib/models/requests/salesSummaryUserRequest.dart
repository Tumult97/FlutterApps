class SalesSummaryUserRequest {
  String terminalId;

  SalesSummaryUserRequest({this.terminalId});

  SalesSummaryUserRequest.fromJson(Map<String, dynamic> json) {
    terminalId = json['TerminalId'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TerminalId'] = this.terminalId;
    return data;
  }
}