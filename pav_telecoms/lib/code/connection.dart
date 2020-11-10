import 'dart:convert';

import 'package:pav_telecoms/models/common/status.dart';
import 'package:pav_telecoms/models/requests/balanceRequest.dart';
import 'package:pav_telecoms/models/requests/bankingDetailsRequest.dart';
import 'package:pav_telecoms/models/requests/loginRequest.dart';
import 'package:pav_telecoms/models/requests/salesSummaryRequest.dart';
import 'package:pav_telecoms/models/requests/salesSummaryUserRequest.dart';
import 'package:pav_telecoms/models/responses/balanceResponse.dart';
import 'package:pav_telecoms/models/responses/bankingDetailsResponse.dart';
import 'package:pav_telecoms/models/responses/loginResponse.dart';
import 'package:package_info/package_info.dart';
import 'package:http/http.dart' as http;
import 'package:pav_telecoms/models/responses/salesSummaryResponse.dart';
import 'package:pav_telecoms/models/responses/salesSummaryUserResponse.dart';

class Connection{
  final String apiBaseUrl = "https://liveapi.pavtelecoms.co.za/7.0.10";
  Map<String,String> headers = {
    'Content-type' : 'application/json',
    'Accept': 'application/json',
  };

  Future<LoginResponse> login(String terminalId, String password) async {
    LoginResponse response;

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    String url = "$apiBaseUrl/Authentication.svc/Login";

    LoginRequest request = LoginRequest(terminalId: terminalId, password: password, version: version);
    var body = json.encode(request.toMap());

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

  Future<SalesSummaryUserResponse> salesSummaryUser(String terminalId) async {
    SalesSummaryUserResponse response;

    SalesSummaryUserRequest request = SalesSummaryUserRequest(terminalId: terminalId);
    var body = json.encode(request.toMap());

    try{
      String url = "$apiBaseUrl/Reports.svc/SalesSummaryUser";
      var httpResponse = await http.post(url, body: body, headers: headers);
      var resObj = jsonDecode(httpResponse.body);
      response = SalesSummaryUserResponse.fromJson(resObj);
    }
    catch(ex){
      response = SalesSummaryUserResponse(status: Status(success: false, message: ex.toString()));
    }

    return response;
  }

  Future<BankingDetailsResponse> bankingDetails(String terminalId) async {
    BankingDetailsResponse response;

    BankingDetailsRequest request = BankingDetailsRequest(terminalId: terminalId);
    var body = json.encode(request.toMap());

    try{
      String url = "$apiBaseUrl/Reports.svc/BankingDetails";
      var httpResponse = await http.post(url, body: body, headers: headers);
      var resObj = jsonDecode(httpResponse.body);
      response = BankingDetailsResponse.fromJson(resObj);
    }
    catch(ex){
      response = BankingDetailsResponse(status: Status(success: false, message: ex.toString()));
    }

    return response;
  }

  Future<BalanceResponse> balance(String terminalId, int clientId) async {
    BalanceResponse response;

    BalanceRequest request = BalanceRequest(terminalId: terminalId, clientId: clientId);
    var body = jsonEncode(request.toMap());

    try{
      String url = "$apiBaseUrl/Reports.svc/Balance";
      var httpResponse = await http.post(url, body: body, headers: headers);
      var resObj = jsonDecode(httpResponse.body);
      response = BalanceResponse.fromJson(resObj);
    }
    catch(ex){
      response = BalanceResponse(status: Status(success: false, message: ex.toString()));
    }

    return response;
  }
}