import 'dart:ui';
import 'package:recharge_app/screens/recharge_plan/provider/state_operation_provider.dart';

import '../../../common_libs.dart';
import '../provider/recharge_plan_providers.dart';

Widget? showStateOpSheet(BuildContext context) {
  final rechrageProvider = Provider.of<RechargePlanProvider>(context, listen: false);
  final stateOpProvider = Provider.of<StateOperationProvider>(context, listen: false);
  WidgetsBinding.instance.addPostFrameCallback((_){
    stateOpProvider.fetchStateOperatiorPlans();

  });


  if(rechrageProvider.isStateBotom)
  {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2, ),
      child: BottomSheet(
        enableDrag: false,
        onClosing: () {

        },
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(8),
            height: 750.h,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r)
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Select your Operator', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),),
                    IconButton(onPressed: (){
                      rechrageProvider.getStateBotom(false);
                    }, icon: Icon(Icons.close, color: Colors.black87,))
                  ],
                ),
                stateOpProvider.stateRechargePlans?.length != 0?
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: stateOpProvider.stateRechargePlans?.length,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: (){
                          rechrageProvider.getStateOpName(stateOpProvider.stateRechargePlans?[index].stateName);
                          rechrageProvider.getStateBotom(false);
                          rechrageProvider.getMobOpBotom(false);
                          },
                        child: ListTile(
                          title: Text(stateOpProvider.stateRechargePlans?[index].stateName?? 'https://www.bing.com/images/search?view=detailV2&ccid=psNbGfoi&id=CB140F4B7514D707E731685F39E74010EE5469EC&thid=OIP.psNbGfoiAc0W52rigMTcIAHaE8&mediaurl=https%3a%2f%2fim.rediff.com%2fmoney%2f2020%2fnov%2f09google.jpg&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.a6c35b19fa2201cd16e76ae280c4dc20%3frik%3d7GlU7hBA5zlfaA%26pid%3dImgRaw%26r%3d0&exph=801&expw=1200&q=google&simid=608042158433965692&FORM=IRPRST&ck=F331CB29DC38481EE9CDAD0B2047EF9E&selectedIndex=2' ),
                        ),
                      );
                    },
                  ),
                ):
                Container(
                  child:Center(child: CircularProgressIndicator()),
                )
              ],
            ),
          );
        },
      ),
    );
  }
  else{
  }
}