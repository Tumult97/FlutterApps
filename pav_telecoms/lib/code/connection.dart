import 'dart:convert';

import 'package:pav_telecoms/models/common/status.dart';
import 'package:pav_telecoms/models/requests/loginRequest.dart';
import 'package:pav_telecoms/models/requests/salesSummaryRequest.dart';
import 'package:pav_telecoms/models/responses/loginResponse.dart';
import 'package:package_info/package_info.dart';
import 'package:http/http.dart' as http;
import 'package:pav_telecoms/models/responses/salesSummaryResponse.dart';

class Connection{
  final String apiBaseUrl = "https://liveapi.pavtelecoms.co.za/7.0.10";

  Future<LoginResponse> login(String terminalId, String password) async {
    LoginResponse response;

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    String url = "$apiBaseUrl/Authentication.svc/Login";

    LoginRequest request = LoginRequest(terminalId: terminalId, password: password, version: version);
    var body = json.encode(request.toMap());

    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
    };

    try{
      var httpResponse = await http.post(url, body: body, headers: headers);
      var resObj = jsonDecode(httpResponse.body);
      response = LoginResponse.fromJson(resObj);
    }
    catch(ex){
      response = LoginResponse(status: Status(success: false, message: ex.toString()));
    }

    return response;
  }

  Future<SalesSummaryResponse> salesSummary(String terminalId) async {
    SalesSummaryResponse response;

    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
    };

    SalesSummaryRequest request = SalesSummaryRequest(terminalId: terminalId);
    var body = json.encode(request.toMap());

    try{
      String url = "$apiBaseUrl/Reports.svc/SalesSummary";
      var httpResponse = await http.post(url, body: body, headers: headers);
      var resObj = jsonDecode(httpResponse.body);
      response = SalesSummaryResponse.fromJson(resObj);
    }
    catch(ex){
      response = SalesSummaryResponse(status: Status(success: false, message: ex.toString()));
    }

    return response;
  }
}