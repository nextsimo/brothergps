import 'package:brothergps/src/utils/device_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'splash_view_model.dart';

class SplashView extends StatelessWidget {
  final bool alert;
  const SplashView({Key? key, this.alert = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize.init(context);
    //debugPrint('------> $alert');
    return ChangeNotifierProvider<SplashViewModel>(
        create: (_) => SplashViewModel(),
        builder: (context, snapshot) {
          SplashViewModel model =
              Provider.of<SplashViewModel>(context, listen: false);
          model.init(context);
          return Material(
            child: Center(
              child: SvgPicture.asset(
                'assets/logo.svg',
                width: DeviceSize.width * 0.5,
                height: DeviceSize.width * 0.5,
              ),
            ),
          );
        });
  }
}
