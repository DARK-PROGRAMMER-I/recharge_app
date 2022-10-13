import 'package:recharge_app/screens/pay/widgets/pay_button.dart';
import 'package:recharge_app/screens/pay/widgets/recharge_plan_card.dart';

import '../../../common_libs.dart';
import '../../recharge_plan/models/recharge_plan_model.dart';
import '../../recharge_plan/provider/recharge_plan_providers.dart';
import '../../recharge_plan/widgets/chips.dart';

class CardWidget extends StatefulWidget {
  final RechargePlansListModel? data;
  final String name, phone;

  const CardWidget({Key? key, this.data, required this.name, required this.phone}) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          SizedBox(height: 8.h,),
          ListTile(
            leading: Image.asset('assets/logo-airtel.png'), //widget.imgPath
            title: Column(
              children: [
                Text(widget.name, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),),
                SizedBox(height: 5.h,),
                Text(widget.phone, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),),
                SizedBox(height: 5.h,),
              ],
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios, size: 15,color: Colors.black,)),

          ),
          Divider(),
          Consumer<RechargePlanProvider>(
            builder: (context, rechrageProvider, child){
              return Container(
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
              );
            }
          ),
          SizedBox(height: 20.h,),
          RechargePlanCard(
            data: widget.data,
          ),
          SizedBox(height: 20.h,),
          PayButton(data: widget.data),

        ],
      ),
    );
  }
}
