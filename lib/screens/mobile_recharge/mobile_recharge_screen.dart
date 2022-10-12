import 'package:provider/provider.dart';
import 'package:recharge_app/screens/mobile_recharge/provider/mobile_recharge_provider.dart';
import 'package:recharge_app/screens/mobile_recharge/widgets/recent_contacts.dart';
import 'package:recharge_app/screens/mobile_recharge/widgets/search_bar.dart';

import '../../common_libs.dart';
import '../../common_widgets/common_widgets.dart';
import 'widgets/mobile_recharge_widgets.dart';

class MobileRechargeScreen extends StatefulWidget {
  const MobileRechargeScreen({Key? key}) : super(key: key);

  @override
  State<MobileRechargeScreen> createState() => _MobileRechargeScreenState();
}

class _MobileRechargeScreenState extends State<MobileRechargeScreen> {
  @override
  Widget build(BuildContext context) {
    final rechargeProvider = Provider.of<MobileRechargeProvider>(context);
    rechargeProvider.fetchMobileRechargeData();
    return Scaffold(
      backgroundColor: Color(0xffF2F3FF),
      body: SingleChildScrollView(
        child: Container(
          height: 1250.h,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MobileRechargeAppBar(title: 'Mobile Recharge'),
              SingleChildScrollView(
                child: Container(
                  height: 1100.h,
                  child: Column(
                     children: [
                       CarouselSliderWidget(),
                       SerachBar(),
                       RecentContacts(),
                       ContactList(),
                     ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
