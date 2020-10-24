class LoginRequest{
  String terminalId;
  String password;
  String version;

  LoginRequest({this.terminalId, this.password, this.version});

  Map<String, String> toMap(){
    return {
      'TerminalId': terminalId,
      'Password': password,
      'Version': version,
    };
  }
}