import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:pav_telecoms/components/rounded_input_field.dart';
import 'package:pav_telecoms/components/rounded_password_field.dart';
import 'package:pav_telecoms/models/responses/loginResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pav_telecoms/code/connection.dart' as api;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String terminalId = "";
  String password = "";
  String deviceManufacturer;
  SharedPreferences prefs;
  bool _isButtonDisabled = false;
  var function;
  DeviceInfoPlugin _deviceInfoPlugin;
  String message = "";

  @override
  void initState() {
    super.initState();
    _deviceInfoPlugin = DeviceInfoPlugin();
    setUpVariables();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FutureBuilder<AndroidDeviceInfo>(
        future: _deviceInfoPlugin.androidInfo,
        builder: (BuildContext context, AsyncSnapshot<AndroidDeviceInfo> snapshot) {
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else {
            final androidDeviceInfo = snapshot.data;
            terminalId = androidDeviceInfo.androidId;
            //terminalId = "06d598a7dede6530";
            terminalId = "20:c9:d0:7d:41:cf";
            //terminalId = "86515003237147";
            deviceManufacturer = androidDeviceInfo.manufacturer;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/pav.png",
                    width: MediaQuery.of(context).size.width * 0.85,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  RoundedInputField(
                    hintText: "Terminal ID",
                    text: "$terminalId",
                    onChanged: (value) {
                      setState(() {
                        terminalId = value;
                      });
                    },
                  ),
                  RoundedPasswordField(
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.80,
                    child: buildLoginButton(context),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Forgot Password? Contact Us",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14.0
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "To Register Call 011 568 0320\nor Email info@pavcellular.co.za",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  void login(BuildContext context) async {
    setState(() {
      _isButtonDisabled = true;
    });

    //PackageInfo packageInfo = await PackageInfo.fromPlatform();
    //String version = packageInfo.version;

    if(password.isEmpty){
      showItemSnackBar("Password Empty. Please enter password to Continue", context);
      setState(() {
        _isButtonDisabled = false;
      });
      return;
    }

    LoginResponse response = await api.Connection().login(terminalId, password);

    if(!response.status.success){
      showItemSnackBar(response.status.message, context);
      setState(() {
        _isButtonDisabled = false;
      });
      return;
    }

    response.manufacturer = deviceManufacturer;
    var resObj = response.toMap();

    Map perms = new Map();
    perms["permissions"] = resObj;
    perms["terminal"] = terminalId;

    Navigator.pushReplacementNamed(context, "/home", arguments: perms);

    // setState(() {
    //   _isButtonDisabled = false;
    // });
  }

  void showItemSnackBar(String element, BuildContext context){
    final snackBar = SnackBar(
        content: Container(
        decoration:
        BoxDecoration(
            color: Colors.grey[850],
            border: Border.all(
              width: 2.0,
              color: Colors.grey[850]),
            borderRadius: BorderRadius.circular(5)
        ),
        margin: EdgeInsets.fromLTRB(0, 0, 0, 75),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 10, 20),
            child: Text(element),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 1000,
      behavior: SnackBarBehavior.floating,
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void setUpVariables() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.remove("Session");
  }

  Widget buildLoginButton(BuildContext context){
    var function = () => {
      login(context)
    };
    return RaisedButton(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: Colors.blue[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(29.0),
      ),
      child: Text(
        _isButtonDisabled ? "PROCESSING" : "LOGIN",
        style: TextStyle(
            color: Colors.white
        ),
      ),
      onPressed: _isButtonDisabled ? null : function,
    );
  }

}



