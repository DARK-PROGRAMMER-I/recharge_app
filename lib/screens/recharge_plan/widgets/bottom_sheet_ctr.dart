import 'package:recharge_app/screens/recharge_plan/widgets/state_bottom_sheet_custom.dart';

import '../../../common_libs.dart';
import '../provider/recharge_plan_providers.dart';
import 'mob_bottom_sheet_custom.dart';

class BottomSheetCtr extends StatelessWidget {
  const BottomSheetCtr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rechrageProvider = Provider.of<RechargePlanProvider>(context);
    return rechrageProvider.isMobOpBotom? showMobOpSheet(context)! : rechrageProvider.isStateBotom? showStateOpSheet(context)! : Container();
  }
}
