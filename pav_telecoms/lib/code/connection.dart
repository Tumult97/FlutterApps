import 'package:pav_telecoms/models/requests/loginRequest.dart';
import 'package:pav_telecoms/models/responses/loginResponse.dart';
import 'package:package_info/package_info.dart';

class Connection{
  String apiBaseUrl = "https://liveapi.pavtelecoms.co.za/7.0.10";

  Future<LoginResponse> Login(String terminalId, String password) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    String url = "$apiBaseUrl/7.0.10/Authentication.svc/Login";
    LoginRequest request = LoginRequest(terminalId: terminalId, password: password);
  }
}