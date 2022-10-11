import 'package:recharge_app/screens/recharge_plan/widgets/bottom_boxes.dart';
import 'package:recharge_app/screens/recharge_plan/widgets/chips.dart';
import 'package:recharge_app/screens/recharge_plan/widgets/searh_plans.dart';

import '../../common_libs.dart';
import '../mobile_recharge/widgets/mobile_recharge_widgets.dart';
import '../mobile_recharge/widgets/search_bar.dart';

class RechargePlanScreen extends StatefulWidget {
  final String displayName;
  final String displayNumber;
  const RechargePlanScreen({Key? key, required this.displayName, required this.displayNumber}) : super(key: key);

  @override
  State<RechargePlanScreen> createState() => _RechargePlanScreenState();
}

class _RechargePlanScreenState extends State<RechargePlanScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xffF2F3FF),
        body: SingleChildScrollView(
          child: Container(
            height: 1200.h,
            child: Column(
              children: [
                MobileRechargeAppBar(title: 'Select a recharge plan'),
                Flexible(child: Column(
                children: [
                  AdImage(),
                  Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Image.asset('assets/logo-airtel.png'),
                          title: Column(
                            children: [
                              Text(widget.displayName, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),),
                              SizedBox(height: 5.h,),
                              Text(widget.displayNumber, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),),
                              SizedBox(height: 5.h,),


                            ],
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios, size: 15,color: Colors.black,)),

                        ),
                        Divider(),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomChip(title: 'Airtel Prepaid'),
                              CustomChip(title: 'Maharashtra & Goa'),
                            ],
                          ),
                        ),
                        SearchPlans(),
                        SizedBox(height: 20.h,),
                        // TestScreen(
                        Container(
                          child: TabBar(
                            // padding: EdgeInsets.zero,
                              labelColor: Colors.black87,
                              tabs: [
                                Tab(text: "RECOMMENDED PACKS",

                                ),
                                Tab(text: "DATA",

                                ),
                                Tab(text: "TRUELY UNLIMIT",

                                ),
                              ]),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Container(
                    height: 600.h,
                    child: TabBarView(
                        children: [
                          BottomBoxes(),
                          BottomBoxes(),
                          BottomBoxes(),
                        ]),
                  ),
                ],
                )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
