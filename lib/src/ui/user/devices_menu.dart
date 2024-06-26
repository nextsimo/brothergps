import 'package:flutter/material.dart';
import '../../models/device.dart';
import '../../services/device_provider.dart';
import 'package:provider/provider.dart';

import '../../utils/styles.dart';

class MenuDevices extends StatelessWidget {
  const MenuDevices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceProvider deviceProvider =
        Provider.of<DeviceProvider>(context, listen: false);

    List<Device> devices = deviceProvider.devices;

    return Container(
      width: 150,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConsts.mainradius),
      ),
      child: ListView.separated(
        itemBuilder: (_, int index) {
          return DeviceListItem(device: devices.elementAt(index));
        },
        itemCount: devices.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
      ),
    );
  }
}

class DeviceListItem extends StatelessWidget {
  final Device device;
  const DeviceListItem({Key? key, required this.device}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (_) {},
        ),
        const SizedBox(width: 10),
        Text(device.description, style: const TextStyle(fontSize: 10))
      ],
    );
  }
}
