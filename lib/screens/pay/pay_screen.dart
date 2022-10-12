import '../../common_libs.dart';
import '../mobile_recharge/widgets/mobile_recharge_widgets.dart';
import '../recharge_plan/models/recharge_categories_model.dart';
import '../recharge_plan/models/recharge_plan_model.dart';

class PayScreen extends StatefulWidget {
  final RechargePlansListModel? data;
  const PayScreen({Key? key, required this.data}) : super(key: key);

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
