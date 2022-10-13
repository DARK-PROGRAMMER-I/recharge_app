import '../../../common_libs.dart';

class PaymentSuccessStatus extends StatelessWidget {
  final String title;
  const PaymentSuccessStatus({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        alignment: Alignment.center,
        width: 160.w,
        height: 30.h,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10.r)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120.w,
              child: Text(
                overflow: TextOverflow.ellipsis,
                title,
                style: TextStyle(fontSize: 13,color: Colors.white), ),
            ),
            Icon(Icons.arrow_forward_ios, size: 13, color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
