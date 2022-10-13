import '../../../common_libs.dart';
import '../../pay/pay_screen.dart';
import '../provider/plan_list_provider.dart';
import '../provider/recharge_plan_providers.dart';

class BottomBoxes extends StatefulWidget {
  final int index;
  final String name;
  final String phone;
  const BottomBoxes({Key? key, required this.index, required this.name, required this.phone}) : super(key: key);

  @override
  State<BottomBoxes> createState() => _BottomBoxesState();
}

class _BottomBoxesState extends State<BottomBoxes> {
  @override
  Widget build(BuildContext context) {
    final rechrageProvider = Provider.of<RechargePlanProvider>(context);
    final plansProvider = Provider.of<PlanListProvider>(context);
    // plansProvider.fetchMobileRechargePlans(rechrageProvider.cat_id.toString());

    return plansProvider.stateRechargePlans?.length != 0 ?
    Container(
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: plansProvider.stateRechargePlans?.length,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=> PayScreen(
                  data: plansProvider.stateRechargePlans?[index],
                  name: widget.name,
                  phone : widget.phone,
                )));
              },
              child: Container(
                child: Column(
                  children: [
                    Card(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal:  10.w),
                        height: 130.h,
                        width: 375.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 5.h),
                              height:25.h,
                              width: 263.w,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30.r),
                                      bottomRight: Radius.circular(30.r)
                                  )
                              ),
                              child: Text('${plansProvider.stateRechargePlans?[index].planName ?? ' Name'}', style: TextStyle(color: Colors.white),),
                            ),
                            Text('R${plansProvider.stateRechargePlans?[index].planAmount ?? ' Name'}', style: TextStyle(color: Colors.black87, fontSize: 22.h, fontWeight: FontWeight.bold ),),

                            Container(
                              width: 200.w,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                'Data : ${plansProvider.stateRechargePlans?[index].planDescription ?? ' Name'}',
                                style: TextStyle(color: Colors.black87, fontSize: 14.h, fontWeight: FontWeight.bold ),),
                            ),
                            Text('${plansProvider.stateRechargePlans?[index].validity ?? ' Name'}', style: TextStyle(color: Colors.black87, fontSize: 16.h, fontWeight: FontWeight.w300 ),)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h,)
                  ],
                ),
              ),
            );
          }),
    ):
    Container(
      width: 375.w,
      height: 600.h,
      child: Center(child: Text('NO Data')),
    )
    ;
  }
}
