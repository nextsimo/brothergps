import 'package:brothergps/src/services/newgps_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../../utils/styles.dart';
import 'main_button.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.portrait) {
      return const _LogoutButtonPortrait();
    }
    return const _LogoutButtonLandscape();
  }
}

class _LogoutButtonLandscape extends StatelessWidget {
  const _LogoutButtonLandscape({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            MainButton(
              height: 28,
              onPressed: () {
                deviceProvider.selectedTabIndex = 0;
                deviceProvider.infoModel = null;
                Phoenix.rebirth(context);

/* 
                try {
                  LastPositionProvider lastPositionProvider =
                      Provider.of(context, listen: false);
                  HistoricProvider historicProvider =
                      Provider.of(context, listen: false);

                  lastPositionProvider.fresh();
                  historicProvider.fresh();
                } catch (e) {
                  debugPrint(e.toString());
                }
                ConnectedDeviceProvider connectedDeviceProvider =
                    Provider.of(context, listen: false);
                connectedDeviceProvider.updateConnectedDevice(false);
                connectedDeviceProvider.createNewConnectedDeviceHistoric(false);
                shared.clear('account'); */
              },
              label: 'Déconnexion',
              backgroundColor: Colors.red,
              width: 112,
            ),
          ],
        ),
      ),
    );
  }
}

class _LogoutButtonPortrait extends StatelessWidget {
  final double height;
  const _LogoutButtonPortrait({
    Key? key,
    // ignore: unused_element
    this.height = 35,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(right: AppConsts.outsidePadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            MainButton(
              height: height,
              onPressed: () {
                deviceProvider.selectedTabIndex = 0;
                deviceProvider.infoModel = null;
                shared.clear('account');
                Phoenix.rebirth(context);

/*                 try {
                  LastPositionProvider lastPositionProvider =
                      Provider.of(context, listen: false);
                  HistoricProvider historicProvider =
                      Provider.of(context, listen: false);
                  lastPositionProvider.fresh();
                  historicProvider.fresh();
                } catch (e) {
                  debugPrint(e.toString());
                }
                ConnectedDeviceProvider connectedDeviceProvider =
                    Provider.of(context, listen: false);
                connectedDeviceProvider.updateConnectedDevice(false);
                connectedDeviceProvider.createNewConnectedDeviceHistoric(false);
                shared.clear('account'); */
              },
              label: 'Deconnexion',
              backgroundColor: Colors.red,
              width: 112,
            ),
          ],
        ),
      ),
    );
  }
}
