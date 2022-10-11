import '../../common_libs.dart';
import '../mobile_recharge/widgets/mobile_recharge_widgets.dart';

class PayScreen extends StatefulWidget {
  const PayScreen({Key? key}) : super(key: key);

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F3FF),
      body: SingleChildScrollView(
        child: Container(
          height: 1200.h,
          child: Column(
            children: [
              MobileRechargeAppBar(title: 'Select a recharge plan'),
            ],
          ),
        ),
      ),
    );
  }
}
