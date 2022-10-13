import 'package:recharge_app/screens/pay/widgets/bottom_sheet.dart';
import 'package:recharge_app/screens/pay/widgets/card_widget.dart';
import 'package:recharge_app/screens/pay/widgets/pay_app_bar.dart';

import '../../common_libs.dart';

import '../recharge_plan/models/recharge_plan_model.dart';

class PayScreen extends StatefulWidget {
  final RechargePlansListModel? data;
  final String name , phone;
  const PayScreen({Key? key, required this.data, required this.name, required this.phone}) : super(key: key);

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  @override
  Widget build(BuildContext context) {
    print('hhhhhhhhhhhhhhhhhhhhhhhhhioOOOOOOOOOOOOOOOOOOOOOOOOOOOO');
    return Scaffold(
      backgroundColor: Color(0xffF2F3FF),
      body: SingleChildScrollView(
        child: Container(
             width : MediaQuery.of(context).size.width,
          height : MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(

              children: [
                PayAppBar(title: 'Pay'),
                CardWidget(
                  name : widget.name,
                  phone : widget.phone,
                  data : widget.data
                ),

              ],
            ),
        ),
        ),
      ),
      bottomSheet: PayBottomSheet(),
    );
  }
}
