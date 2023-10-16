import 'package:brothergps/src/models/device.dart';
import 'package:flutter/material.dart';

import '../../../services/newgps_service.dart';
import '../../last_position/last_temp/last_temp_info_model.dart';

class TempCardDeviceTempProvider with ChangeNotifier {
  double? temperature;

  TempCardDeviceTempProvider(Device device) {
    fetchLastTempRepport(device.deviceId);
  }

  Future<void> fetchLastTempRepport(String deviceId) async {
    String res = await api.post(
      url: '/tempble/show',
      body: {
        'device_id': deviceId,
        'account_id': shared.getAccount()?.account.accountId,
      },
    );
    if (res.isNotEmpty) {
      temperature = temBleRepportModelFromJson(res).temperature1.toDouble();
    }
  }
}
