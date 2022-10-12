import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

import '../../../common_libs.dart';
import '../../recharge_plan/recharge_plan_screen.dart';
import '../provider/mobile_recharge_provider.dart';

class RecentContacts extends StatefulWidget {
  const RecentContacts({Key? key}) : super(key: key);

  @override
  State<RecentContacts> createState() => _RecentContactsState();
}

class _RecentContactsState extends State<RecentContacts> {
  @override
  Widget build(BuildContext context) {
    final rechargeProvider = Provider.of<MobileRechargeProvider>(context);
    // rechargeProvider.mobileRechargeData == [] ? rechargeProvider.fetchMobileRechargeData() :
    // print(rechargeProvider.mobileRechargeData);
    return Container(
      width: 370.w,
      height: 350.h,
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 12,
            color: Colors.black12
          )
        ]
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Text('Recently Paid')),
          ),
          rechargeProvider.mobileRechargeData?.length != 0 ?
          Expanded(
            flex: 5,
            child: ListView.builder(
              itemCount: rechargeProvider.mobileRechargeData?.length ?? 0,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index){
                return Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> RechargePlanScreen(
                          displayName: rechargeProvider.mobileRechargeData?[index].rechargePersonName?? 'Name',
                          displayNumber: rechargeProvider.mobileRechargeData?[index].mobileno ?? 'Phone',
                        )));
                      },
                      child: Container(
                        height: 64.h,
                        child: ListTile(
                          leading: CachedNetworkImage(
                            imageUrl: rechargeProvider.mobileRechargeData?[index].operatorimage ?? 'https://th.bing.com/th/id/OIP.5KXewlde2jRaBeCwBl_ouQHaFj?w=241&h=180&c=7&r=0&o=5&dpr=1.12&pid=1.7',
                            // height: Dimensions.height40,
                            // width: Dimensions.width40,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                          title: Column(
                            children: [
                              Text(rechargeProvider.mobileRechargeData?[index].rechargePersonName?? 'Name', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),),
                              SizedBox(height: 5.h,),
                              Text(rechargeProvider.mobileRechargeData?[index].mobileno ?? 'Phone', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),),
                              SizedBox(height: 5.h,),
                              Text(rechargeProvider.mobileRechargeData?[index].details ?? 'Recharge Details', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),),

                            ],
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios, size: 15,color: Colors.black,)),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Divider(),
                    SizedBox(height: 10.h,),
                  ],
                );
              },
            ),
          ) :
              Container(
                width: 370.w,
                height: 350.h,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
        ],
      ),
    );
  }
}
