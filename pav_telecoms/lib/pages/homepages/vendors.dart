import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:pav_telecoms/models/vendor.dart';
import 'package:permission_handler/permission_handler.dart';

class Vendors extends StatefulWidget {
  List<Vendor> vendorList = [];
  final List<Map<String, dynamic>> data = List();

  Vendors(permissions){
    vendorList.add(Vendor(name: "Vodacom", data: false, icon: "vodacom", network: "vodacom", dataIcon: ""));
    vendorList.add(Vendor(name: "Vodacom Data", data: true, icon: "vodacom", network: "vodacom", dataIcon: "-data"));
    vendorList.add(Vendor(name: "MTN", data: false, icon: "mtn", network: "mtn", dataIcon: ""));
    vendorList.add(Vendor(name: "MTN Data", data: true, icon: "mtn", network: "mtn", dataIcon: "-data"));
    vendorList.add(Vendor(name: "Cell C", data: false, icon: "cellc", network: "cellc", dataIcon: ""));
    vendorList.add(Vendor(name: "Cell C Data", data: true, icon: "cellc", network: "cellc", dataIcon: "-data"));
    vendorList.add(Vendor(name: "Telkom", data: false, icon: "telkom", network: "telkom", dataIcon: ""));
    vendorList.add(Vendor(name: "Telkom Data", data: true, icon: "telkom", network: "telkom", dataIcon: "-data"));
    vendorList.add(Vendor(name: "Lotto", data: false, icon: "lotto", network: "lotto", dataIcon: ""));
    vendorList.add(Vendor(name: "Virgin", data: false, icon: "virgin", network: "virgin", dataIcon: ""));
    vendorList.add(Vendor(name: "Electricity", data: false, icon: "electricity", network: "electricity", dataIcon: ""));
    vendorList.add(Vendor(name: "Rise", data: false, icon: "rise", network: "risetelecoms", dataIcon: ""));
    vendorList.add(Vendor(name: "OTT Mobile", data: false, icon: "pav", network: "ottmobile", dataIcon: ""));
    vendorList.add(Vendor(name: "Neotel", data: false, icon: "neotel", network: "neotel", dataIcon: ""));
    vendorList.add(Vendor(name: "PAV Test", data: false, icon: "pav", network: "pav", dataIcon: ""));
  }

  @override
  _VendorsState createState() => _VendorsState(vendorList);
}

class _VendorsState extends State<Vendors> {
  List<Vendor> vendorList = [];
  // PrinterBluetoothManager _printerManager = PrinterBluetoothManager();
  // List<PrinterBluetooth> _devices = [];
  // String _devicesMsg;
  // BluetoothManager bluetoothManager = BluetoothManager.instance;

  _VendorsState(List<Vendor> list){
    vendorList = list;
    checkPermissions();
    // if (Platform.isAndroid) {
    //   bluetoothManager.state.listen((val) {
    //     print('state = $val');
    //     if (!mounted) return;
    //     if (val == 12) {
    //       print('on');
    //       initPrinter();
    //     } else if (val == 10) {
    //       print('off');
    //       setState(() => _devicesMsg = 'Bluetooth Disconnect!');
    //     }
    //   });
    // } else {
    //   initPrinter();
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
        child: GridView.count(
          crossAxisCount: 4,
          padding: EdgeInsets.all(0.0),
          scrollDirection: Axis.vertical,
          children: generateGrid(vendorList, context),
          childAspectRatio: 0.95,
        ),
      ),
    );
  }

  List<Widget> generateGrid(List<Vendor> list, context){
    List<Widget> result = <Widget>[];
    list.forEach((element) {
      result.add(FlatButton(
        onPressed: () async {
          //showItemSnackbar(element, context);
          //_startPrint(_devices[0]);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/icons/${element.icon}${element.dataIcon}.png",
              width: MediaQuery.of(context).size.width * 0.24,
            ),
            Center(
              child: Text(
                "${element.name}",
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            )
          ],
        ),
      ));
    });

    return result;
  }

  void showItemSnackbar(Vendor element, context){
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(element.name)
        ],
      ),
      duration: Duration(milliseconds: 1000),
      elevation: 30.0,
      behavior: SnackBarBehavior.floating,
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void checkPermissions() async {
    print("---------------------------------------------------------------------------------");
    FlutterBlue flutterBlue = FlutterBlue.instance;
    // Start scanning
    flutterBlue.startScan(timeout: Duration(seconds: 10));
    var subscription = flutterBlue.scanResults.listen((results) {
      // do something with scan results
      for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.rssi}');
      }
    });

// Stop scanning
    flutterBlue.stopScan();
  }

  // Future sleep() {
  //   return new Future.delayed(const Duration(seconds: 11), () => "1");
  // }
  //
  // void initPrinter() async {
  //   _printerManager.startScan(Duration(seconds: 10));
  //   await sleep();
  //   _printerManager.scanResults.listen((val) {
  //     if (!mounted) return;
  //     setState(() => _devices = val);
  //     if (_devices.isEmpty) setState(() => _devicesMsg = 'No Devices');
  //   });
  // }
  //
  // Future<void> _startPrint(PrinterBluetooth printer) async {
  //   _printerManager.selectPrinter(printer);
  //   final result = await _printerManager.printTicket(await _ticket(PaperSize.mm80));
  //   showDialog(
  //     context: context,
  //     builder: (_) => AlertDialog(
  //       content: Text(result.msg),
  //     ),
  //   );
  // }
  //
  // Future<Ticket> _ticket(PaperSize paper) async {
  //   final ticket = Ticket(paper);
  //   int total = 0;
  //
  //   // Image assets
  //   final ByteData data = await rootBundle.load('assets/store.png');
  //   final Uint8List bytes = data.buffer.asUint8List();
  //   final FileImage.Image image = FileImage.decodeImage(bytes);
  //   ticket.image(image);
  //   ticket.text(
  //     'TOKO KU',
  //     styles: PosStyles(align: PosAlign.center,height: PosTextSize.size2,width: PosTextSize.size2),
  //     linesAfter: 1,
  //   );
  //
  //   for (var i = 0; i < widget.data.length; i++) {
  //     total += widget.data[i]['total_price'];
  //     ticket.text(widget.data[i]['title']);
  //     ticket.row([
  //       PosColumn(
  //           text: '${widget.data[i]['price']} x ${widget.data[i]['qty']}',
  //           width: 6),
  //       PosColumn(text: 'Rp ${widget.data[i]['total_price']}', width: 6),
  //     ]);
  //   }
  //
  //   ticket.feed(1);
  //   ticket.row([
  //     PosColumn(text: 'Total', width: 6, styles: PosStyles(bold: true)),
  //     PosColumn(text: 'Rp $total', width: 6, styles: PosStyles(bold: true)),
  //   ]);
  //   ticket.feed(2);
  //   ticket.text('Thank You',styles: PosStyles(align: PosAlign.center, bold: true));
  //   ticket.cut();
  //
  //   return ticket;
  // }
  //
  // @override
  // void dispose() {
  //   _printerManager.stopScan();
  //   super.dispose();
  // }
}
