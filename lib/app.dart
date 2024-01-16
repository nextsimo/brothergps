import 'dart:async';

import 'package:brothergps/src/ui/login/login_provider.dart';
import 'package:brothergps/src/ui/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'src/services/device_provider.dart';
import 'src/services/newgps_service.dart';
import 'src/ui/connected_device/connected_device_provider.dart';
import 'src/ui/historic/historic_provider.dart';
import 'src/ui/last_position/last_position_provider.dart';
import 'src/ui/login/login_as/save_account_provider.dart';
import 'src/ui/login/login_view.dart';
import 'src/ui/navigation/navigation_view.dart';
import 'src/ui/repport/temperature_ble/temperature_repport_provider.dart';
import 'src/utils/styles.dart';

class NewGpsApp extends StatelessWidget {
  const NewGpsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DeviceProvider>.value(value: deviceProvider),
        ChangeNotifierProvider<TemperatureRepportProvider>(
          create: (_) => TemperatureRepportProvider(),
        ),
        ChangeNotifierProvider<LastPositionProvider>(
            create: (_) => LastPositionProvider()),
        ChangeNotifierProvider<HistoricProvider>(
            create: (_) => HistoricProvider()),
        ChangeNotifierProvider<SavedAcountProvider>(
            create: (_) => SavedAcountProvider()),
        ChangeNotifierProvider<ConnectedDeviceProvider>(
            create: (_) => ConnectedDeviceProvider()),
        ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, __) {
            return MaterialApp(
              initialRoute: '/splash',
              routes: {
                '/splash': (context) => const SplashView(),
                '/navigation': (context) => CustomNavigationView(),
                '/login': (context) => const LoginView(),
                // When navigating to the "/second" route, build the SecondScreen widget.
              },
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              supportedLocales: const [Locale('fr')],
              debugShowCheckedModeBanner: false,
              builder: (context, child) => MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(alwaysUse24HourFormat: true),
                  child: child!),
              title: 'BROTHERGPS',
              theme: ThemeData(
                useMaterial3: false,
                primaryColor: AppConsts.mainColor,
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => AppConsts.mainColor,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}


class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}