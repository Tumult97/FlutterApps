class BalanceRequest {
  String terminalId;
  int clientId;

  BalanceRequest({this.terminalId, this.clientId});

  BalanceRequest.fromJson(Map<String, dynamic> json) {
    terminalId = json['TerminalId'];
    clientId = json['ClientId'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TerminalId'] = this.terminalId;
    data['ClientId'] = this.clientId;
    return data;
  }
}