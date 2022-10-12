import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recharge_app/screens/mobile_recharge/mobile_recharge_screen.dart';
import 'package:recharge_app/screens/mobile_recharge/provider/mobile_recharge_provider.dart';
import 'package:recharge_app/screens/recharge_plan/provider/mobile_operation_provider.dart';
import 'package:recharge_app/screens/recharge_plan/provider/recharge_plan_providers.dart';
import 'package:recharge_app/screens/recharge_plan/provider/state_operation_provider.dart';

import 'common_libs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {

     return MultiProvider(
       providers: [
         ChangeNotifierProvider(create: (_)=> MobileRechargeProvider()),
         ChangeNotifierProvider(create: (_)=> RechargePlanProvider()),
         ChangeNotifierProvider(create: (_)=> MobileOperationProvider()),
         ChangeNotifierProvider(create: (_)=> StateOperationProvider())
       ],
       child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.green,
              ),
              home: MobileRechargeScreen()
            ),
     );
        }
    );
  }
}