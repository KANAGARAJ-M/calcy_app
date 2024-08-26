// lib/screens/android_details_screen.dart

import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

class AndroidDetailsScreen extends StatefulWidget {
  @override
  _AndroidDetailsScreenState createState() => _AndroidDetailsScreenState();
}

class _AndroidDetailsScreenState extends State<AndroidDetailsScreen> {
  String _deviceInfo = "Loading device info...";

  @override
  void initState() {
    super.initState();
    _getDeviceInfo();
  }

  Future<void> _getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    

    setState(() {
      _deviceInfo = '''
        Device: ${androidInfo.model}
        Manufacturer: ${androidInfo.manufacturer}
        Android Version: ${androidInfo.version.release}
        SDK Version: ${androidInfo.version.sdkInt}
        Security Patch: ${androidInfo.version.securityPatch}
        Hardware: ${androidInfo.hardware}
        Board: ${androidInfo.board}
        Bootloader: ${androidInfo.bootloader}
        SystemFratures: ${androidInfo.systemFeatures}
        Brand: ${androidInfo.brand}
        Display: ${androidInfo.display}
        Fingerprint: ${androidInfo.fingerprint}
        Host: ${androidInfo.host}
        supported64BitAbis: ${androidInfo.supported64BitAbis}
        Hardwares: ${androidInfo.hardware}
        PhysicalDevice: ${androidInfo.isPhysicalDevice}
        SerialNumber: ${androidInfo.serialNumber}
        supportedAbis: ${androidInfo.supportedAbis}
        supported32BitAbis: ${androidInfo.supported32BitAbis}
        DataEntries: ${androidInfo.data.entries}
        product: ${androidInfo.product}
        runtimeType: ${androidInfo.runtimeType}
        device: ${androidInfo.device}
      ''';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Android Device Details"),
      ),
      body: Scrollbar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            _deviceInfo,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
