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
    return Scaffold(
      backgroundColor: Color(0xffF2F3FF),
      body: SingleChildScrollView(
        child: Container(
          height: 1200.h,
          child: Column(
            children: [
              MobileRechargeAppBar(title: 'Mobile Recharge'),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSliderWidget(),
                    SerachBar(),
                    Expanded(
                      flex: 2,
                        child: RecentContacts()),
                    Expanded(
                        flex: 2,
                        child: ContactList()),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
