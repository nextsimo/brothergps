import 'package:brothergps/src/ui/historic/historic_provider.dart';
import 'package:brothergps/src/ui/historic/parking/parking_provider.dart';
import 'package:brothergps/src/widgets/buttons/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ParkingButton extends StatelessWidget {
  const ParkingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ParkingProvider>();
    final historicProvider = context.read<HistoricProvider>();
    return Positioned(
      top: 135.r.h,
      right: 5,
      child: Selector<ParkingProvider, bool>(
          selector: (_, p) => p.buttonClicked,
          builder: (context, bool isSelected, ___) {
            return MainButton(
              backgroundColor: isSelected ? Colors.white : Colors.blue,
              borderColor: isSelected ? Colors.blue : Colors.transparent,
              textColor: isSelected ? Colors.black : Colors.white,
              width: 112,
              height: 35,
              onPressed: () => provider.ontap(historicProvider),
              label: 'Parking',
            );
          }),
    );
  }
}
