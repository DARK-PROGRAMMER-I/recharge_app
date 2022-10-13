import '../../../common_libs.dart';
import '../../recharge_plan/models/recharge_plan_model.dart';
import '../../recharge_plan/provider/recharge_plan_providers.dart';

class PayButton extends StatelessWidget {
  final RechargePlansListModel? data;
  const PayButton({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RechargePlanProvider>(
      builder: (BuildContext context, rechargeProvider, Widget? child) {
        return Container(
          padding:  EdgeInsets.symmetric( vertical: 10.h),
          width: MediaQuery.of(context).size.width -  15.w,
          child: ElevatedButton(
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(30.w, 50.h))
            ),
            child: Text('PROCEED TO PAY'),
            onPressed: (){
              rechargeProvider.getPlanBotOp(true);
              rechargeProvider.getSelectedPlan(data);
            },
          ),
        );
      },

    );
  }
}
