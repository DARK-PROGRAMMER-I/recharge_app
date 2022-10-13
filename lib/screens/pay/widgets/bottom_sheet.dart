import 'package:recharge_app/screens/pay/widgets/paynow_bottom_sheet.dart';

import '../../../common_libs.dart';
import '../../recharge_plan/provider/recharge_plan_providers.dart';
import '../../recharge_plan/widgets/mob_bottom_sheet_custom.dart';
import '../../recharge_plan/widgets/state_bottom_sheet_custom.dart';

class PayBottomSheet extends StatelessWidget {
  const PayBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rechrageProvider = Provider.of<RechargePlanProvider>(context);
    return rechrageProvider.isMobOpBotom? showMobOpSheet(context)!
        : rechrageProvider.isStateBotom? showStateOpSheet(context)!
        : rechrageProvider.isPlanBotOp? showPayBtoomSheet(context)!
        : SizedBox.shrink();
  }
}
