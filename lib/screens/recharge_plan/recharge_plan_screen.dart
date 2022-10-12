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
import '../pay/pay_screen.dart';

class RechargePlanScreen extends StatefulWidget {
  final String displayName;
  final String displayNumber;
  final String imgLink;

  final int? length;
  const RechargePlanScreen({Key? key, required this.displayName, required this.displayNumber, required this.imgLink, this.length}) : super(key: key);

  @override
  State<RechargePlanScreen> createState() => _RechargePlanScreenState();
}

class _RechargePlanScreenState extends State<RechargePlanScreen> with SingleTickerProviderStateMixin{
  late TabController _controller;
  int? number_of_items = 0;
  int _selectedIndex = 0;
  @override
  void initState() {
    _controller = TabController(length: widget.length!, vsync: this);

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    final rechrageProvider = Provider.of<RechargePlanProvider>(context);
    final plansProvider = Provider.of<PlanListProvider>(context);
    final categoryProvider = Provider.of<CategoriesProvider>(context);

    plansProvider.fetchMobileRechargePlans('${_controller.index +1}');

    return DefaultTabController(
      length: categoryProvider.categoryData?.length ?? 3,
      child: Scaffold(
        backgroundColor: Color(0xffF2F3FF),
        body: SingleChildScrollView(
          // padding: EdgeInsets.zero,
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
                    margin: EdgeInsets.symmetric(horizontal: 5.w,),
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
                  SizedBox(height: 5.h,),
                  SearchPlans(),
                  SizedBox(height: 10.h,),
                  // TestScreen(
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      height: 50.h,
                      width: 900.w,
                      child: TabBar(
                        onTap: (int a){
                          setState(() {
                            //_controller.index+a
                            _selectedIndex = a;
                          });
                        },
                        controller: _controller,
                          indicatorWeight: 5,
                        // indicatorSize: TabBarIndicatorSize.label,
                        // padding: EdgeInsets.zero,
                          labelColor: Colors.black87,
                          tabs: List.generate(categoryProvider.categoryData?.length ?? 3, (index) {
                            return Tab(text: categoryProvider.categoryData?[index].categoryName);
                          })

                      ),
                    ),
                  )
                ],
              ),
            ),
                categoryProvider.categoryData?.length != 0?
            Expanded(
              child: Container(
                height: 570.h,
                child: TabBarView(
                  controller: _controller,
                    children:
                    List.generate(categoryProvider.categoryData!.length, (index) => BottomBoxes(index: index,))
                    // [
                    //   BottomBoxes(),
                    //   BottomBoxes(),
                    //   BottomBoxes(),
                    // ]
                ),
              ),
            ): CircularProgressIndicator()
              ],
            ),
          ),
        ),
        bottomSheet: rechrageProvider.isMobOpBotom? showMobOpSheet(context) : rechrageProvider.isStateBotom? showStateOpSheet(context) : null,
      ),
    );
  }
}
