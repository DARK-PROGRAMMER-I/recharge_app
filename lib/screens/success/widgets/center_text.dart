import '../../../common_libs.dart';
import '../../recharge_plan/provider/recharge_plan_providers.dart';

class CenterText extends StatefulWidget {
  const CenterText({Key? key}) : super(key: key);

  @override
  State<CenterText> createState() => _CenterTextState();
}

class _CenterTextState extends State<CenterText> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RechargePlanProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.h),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width - 60,
      child: Text(
        textAlign: TextAlign.center,
        'Your payment of Rs.${provider.data?.planAmount}/- was successful',
        style: TextStyle(fontSize: 20.h, color: Colors.white),
      ),
    );
  }
}
