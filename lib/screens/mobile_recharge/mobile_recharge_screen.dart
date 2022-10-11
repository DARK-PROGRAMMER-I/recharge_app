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
      body: Column(
        children: [
          MobileRechargeAppBar(),
          AdImage(),
          Expanded(child: ContactList()),

        ],
      ),
    );
  }
}
