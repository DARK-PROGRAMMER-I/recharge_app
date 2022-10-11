import 'package:recharge_app/screens/mobile_recharge/widgets/recent_contacts.dart';
import 'package:recharge_app/screens/mobile_recharge/widgets/search_bar.dart';

import '../../common_libs.dart';
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
                flex: 10,
                child: Column(
                  children: [
                    AdImage(),
                    SerachBar(),
                    Flexible(
                      flex: 4,
                        child: RecentContacts()),
                    Flexible(
                        flex: 6,
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
