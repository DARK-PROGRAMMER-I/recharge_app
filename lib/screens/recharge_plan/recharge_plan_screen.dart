import 'package:provider/provider.dart';
import 'package:recharge_app/screens/recharge_plan/provider/categories_provider.dart';
import 'package:recharge_app/screens/recharge_plan/provider/plan_list_provider.dart';
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
  final String imgLink;

  const RechargePlanScreen({Key? key, required this.displayName, required this.displayNumber, required this.imgLink}) : super(key: key);

  @override
  State<RechargePlanScreen> createState() => _RechargePlanScreenState();
}

class _RechargePlanScreenState extends State<RechargePlanScreen> {
  @override
  Widget build(BuildContext context) {
    final rechrageProvider = Provider.of<RechargePlanProvider>(context);
    final plansProvider = Provider.of<PlanListProvider>(context);
    final categoryProvider = Provider.of<CategoriesProvider>(context);



    return DefaultTabController(
      length: categoryProvider.categoryData?.length ?? 3,
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
                    leading: Image.asset('assets/logo-airtel.png'), //widget.imgPath
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      height: 80.h,
                      width: 900.w,
                      child: TabBar(
                        indicator: BoxDecoration(

                          border: Border.fromBorderSide(
                            BorderSide(color: Colors.redAccent, width: 1)
                          ),
                          // shape: BoxShape.rectangle,
                          // borderRadius: BorderRadius.circular(50),
                          color: Colors.grey[600],
                        ),
                        indicatorSize: TabBarIndicatorSize.label,
                        // padding: EdgeInsets.zero,
                          labelColor: Colors.black87,
                          tabs: List.generate(categoryProvider.categoryData?.length ?? 3, (index) => Tab(text: categoryProvider.categoryData?[index].categoryName,)),

                          // [
                          //   Tab(text: "RECOMMENDED PACKS",),
                          //   Tab(text: "DATA",
                          //
                          //   ),
                          //   Tab(text: "TRUELY UNLIMIT",
                          //
                          //   ),
                          // ]
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 570.h,
                child: TabBarView(
                    children:
                    List.generate(categoryProvider.categoryData!.length, (index) => BottomBoxes())
                    // [
                    //   BottomBoxes(),
                    //   BottomBoxes(),
                    //   BottomBoxes(),
                    // ]
                ),
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
