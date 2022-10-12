import 'package:provider/provider.dart';
import 'package:recharge_app/screens/recharge_plan/provider/recharge_plan_providers.dart';
import 'package:recharge_app/screens/recharge_plan/widgets/bottom_boxes.dart';
import 'package:recharge_app/screens/recharge_plan/widgets/mob_bottom_sheet_custom.dart';
import 'package:recharge_app/screens/recharge_plan/widgets/chips.dart';
import 'package:recharge_app/screens/recharge_plan/widgets/searh_plans.dart';
import 'package:recharge_app/screens/recharge_plan/widgets/state_bottom_sheet_custom.dart';

import '../../common_libs.dart';
import '../../common_widgets/common_widgets.dart';
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
    final rechrageProvider = Provider.of<RechargePlanProvider>(context);

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
            CarouselSliderWidget(),
                SizedBox(height: 4.h,),
            Card(
              child: Column(
                children: [
                  SizedBox(height: 8.h,),
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
                    margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
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
                  ),
                  SearchPlans(),
                  SizedBox(height: 15.h,),
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
            Expanded(
              child: Container(
                height: 570.h,
                child: TabBarView(
                    children: [
                      BottomBoxes(),
                      BottomBoxes(),
                      BottomBoxes(),
                    ]),
              ),
            )
              ],
            ),
          ),
        ),
        bottomSheet: rechrageProvider.isMobOpBotom? showMobOpSheet(context) : rechrageProvider.isStateBotom? showStateOpSheet(context) : null,
      ),
    );
  }
}
