import '../../../common_libs.dart';
import '../provider/recharge_plan_providers.dart';

Widget? showCustomBottomSheet(BuildContext context) {
  final rechrageProvider = Provider.of<RechargePlanProvider>(context, listen: false);

  if(rechrageProvider.isOpen)
  {
    return BottomSheet(
      onClosing: () {

      },
      builder: (context) {
        return Container(
          height: 200,
          width: double.infinity,
          color: Colors.grey.shade200,
          alignment: Alignment.center,
          child: ElevatedButton(
            child: Text("Close Bottom Sheet"),
            style: ElevatedButton.styleFrom(
              onPrimary: Colors.white,
              primary: Colors.green,

            ),
            onPressed: () {
              rechrageProvider.getOpenStatus(true);
            },
          ),
        );
      },
    );
  }
  else{
  }
}