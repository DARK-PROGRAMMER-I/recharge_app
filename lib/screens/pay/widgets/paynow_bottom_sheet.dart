import 'dart:ui';

import '../../../common_libs.dart';
import '../../recharge_plan/provider/recharge_plan_providers.dart';
import '../../success/payment_success.dart';


Widget? showPayBtoomSheet(BuildContext context) {
  final rechrageProvider = Provider.of<RechargePlanProvider>(context, listen: false);


  if(rechrageProvider.isPlanBotOp)
  {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2, ),
      child: BottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r)
        ),
        enableDrag: false,
        onClosing: () {
            rechrageProvider.getPlanBotOp(false);
        },
        builder: (context) {
          return Container(
            height: 350.h,
            padding: EdgeInsets.all(8),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r)
            ),
            child: Column(
              children: [
                Container(
                  height: 17.h,
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: (){
                      rechrageProvider.getPlanBotOp(false);
                    },
                    icon: Icon(Icons.cancel_outlined, size: 16.h,),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 30.h, bottom: 10.h, right: 10, left:10.h),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Payable', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset('assets/rupee.png', scale: 0.8,),
                          SizedBox(width: 20.w,),
                          Text('${rechrageProvider.data!.planAmount}', style: TextStyle(fontSize: 30.h),),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h ),
                    child: Text('Pay From BPay Wallet')
                ),
                SizedBox(height: 10.h,),
                Container(
                  height: 170.h,
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: Color(0xff51A553),
                        width: 1.w,
                      )
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset('assets/purse.png', height: 65.h,width: 65.w,),
                              SizedBox(width: 25.w,),
                              Column(
                                children: [
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    'Current Wallet Balance ', style: TextStyle(fontSize: 16.h),),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset('assets/rupee.png', scale: 0.8,),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Text('21330.00', style: TextStyle(fontSize: 30.h),),

                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width ,
                          // alignment: Alignment.bottomCenter,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(Size(30.w, 34.h))
                            ),
                            child: Text('CLICK TO PAY'),
                            onPressed: (){
                              rechrageProvider.getPlanBotOp(false);
                              Navigator.push(context, MaterialPageRoute(builder: (_)=> PaymentSuccessScreen()));
                            },
                          ),
                        )
                      ],
                    )
                ),


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