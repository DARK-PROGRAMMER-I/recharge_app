import '../../../common_libs.dart';
import '../provider/recharge_plan_providers.dart';
import 'chips.dart';

class StateTiles extends StatelessWidget {
  const StateTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rechrageProvider = Provider.of<RechargePlanProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: (){
                rechrageProvider.getMobOpBotom(true);
                rechrageProvider.getStateBotom(false);
              },
              child: CustomChip(title: rechrageProvider.mobOpName.toString())),
          GestureDetector(
              onTap: (){
                rechrageProvider.getStateBotom(true);
                rechrageProvider.getMobOpBotom(false);

              },
              child: CustomChip(title: rechrageProvider.stateOpName.toString())),
        ],
      ),
    );
  }
}
