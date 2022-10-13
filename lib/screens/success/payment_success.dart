import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recharge_app/screens/success/widgets/center_text.dart';
import 'package:recharge_app/screens/success/widgets/payment_success_status.dart';

import '../../common_libs.dart';

class PaymentSuccessScreen extends StatefulWidget {
  const PaymentSuccessScreen({Key? key}) : super(key: key);

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff02072F),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 150.h,),
          Center(
            child: Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
              ),
              child: Icon(Icons.check_rounded, size: 40, color: Colors.green[900],),
            ),
          ),
          CenterText(),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30.h),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width - 60,
            child: Text(
              textAlign: TextAlign.center,
              'Plan benefits have been applied to 8087230XXX',
              style: TextStyle(fontSize: 20.h, color: Colors.red[300]),
            ),
          ),
        Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PaymentSuccessStatus(title: 'View Details'),
                PaymentSuccessStatus(title: 'Check Balance'),

              ],
            ),
          ),
        )
        //
        ],
      ),
    );
  }
}
