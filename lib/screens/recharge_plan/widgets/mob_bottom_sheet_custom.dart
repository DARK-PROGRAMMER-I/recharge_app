import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';

import '../../../common_libs.dart';
import '../provider/mobile_operation_provider.dart';
import '../provider/recharge_plan_providers.dart';

Widget? showMobOpSheet(BuildContext context) {
  final rechrageProvider = Provider.of<RechargePlanProvider>(context, listen: false);
  final mobileOpProvider = Provider.of<MobileOperationProvider>(context, listen: false);
  WidgetsBinding.instance.addPostFrameCallback((_){
    mobileOpProvider.fetchMobileOperatiorPlans();
  });


  if(rechrageProvider.isMobOpBotom)
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
            height: 450.h,
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
                      rechrageProvider.getMobOpBotom(false);
                    }, icon: Icon(Icons.close, color: Colors.black87,))
                  ],
                ),
                mobileOpProvider.mobileOpPlans?.length != 0?
                Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: mobileOpProvider.mobileOpPlans?.length,
                        itemBuilder: (context, index){
                          return GestureDetector(
                            onTap: (){
                              rechrageProvider.getMobOpName(mobileOpProvider.mobileOpPlans?[index].operatorName);
                              rechrageProvider.getStateBotom(true);
                              rechrageProvider.getMobOpBotom(false);

                            },
                            child: ListTile(
                              leading: CachedNetworkImage(
                                fit: BoxFit.cover,
                                height: 40.h,
                                width: 40.h,
                                imageUrl: mobileOpProvider.mobileOpPlans?[index].operatorImage?? '' ,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Icon(Icons.error, size: 18,),
                              ),
                              title: Text(mobileOpProvider.mobileOpPlans?[index].operatorName?? 'https://www.bing.com/images/search?view=detailV2&ccid=psNbGfoi&id=CB140F4B7514D707E731685F39E74010EE5469EC&thid=OIP.psNbGfoiAc0W52rigMTcIAHaE8&mediaurl=https%3a%2f%2fim.rediff.com%2fmoney%2f2020%2fnov%2f09google.jpg&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.a6c35b19fa2201cd16e76ae280c4dc20%3frik%3d7GlU7hBA5zlfaA%26pid%3dImgRaw%26r%3d0&exph=801&expw=1200&q=google&simid=608042158433965692&FORM=IRPRST&ck=F331CB29DC38481EE9CDAD0B2047EF9E&selectedIndex=2' ),
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