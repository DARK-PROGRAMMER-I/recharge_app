import '../../../common_libs.dart';
import '../../recharge_plan/models/recharge_plan_model.dart';

class RechargePlanCard extends StatelessWidget {
  final RechargePlansListModel? data;
  const RechargePlanCard({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      width: MediaQuery.of(context).size.width -  30,
      color: Color(0xffF6FBFF),
      child: Row(
        children: [
          Expanded(
            flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/rupee.png', scale: 0.8,),
                      SizedBox(width: 20.w,),
                      Text('${data?.planAmount ?? ' '}', style: TextStyle(fontSize: 30.h),),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Text('TalkTime :   ${data?.talktime ?? ' '}', style: TextStyle(fontSize: 16.h),),
                  Text('Validity :   ${data?.validity ?? ' '}', style: TextStyle(fontSize: 16.h),),

                ],
              ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: (){},
                    child: Text('Change Plan'),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r)
                    ))
                  ),
                ),
                SizedBox(height: 20.h,),
                Text('Data  :   ${data?.planDescription ?? ' '}', style: TextStyle(fontSize: 16.h),),

              ],
            ),
          )
        ],
      ),
    );
  }
}
