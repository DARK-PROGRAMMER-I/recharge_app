import '../../../common_libs.dart';

class PayAppBar extends StatelessWidget {
  final String title;
  const PayAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      color: Color(0xff041e55),
      child: Padding(
        padding: EdgeInsets.only(left: 5.w, top: 50.h),
        child: Row(
          children: [
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios_outlined, size: 15.h,), color: Colors.white, ),
            SizedBox(width: 110.w,),
            Text(title, style: TextStyle(fontSize: 18.h, color: Colors.white),)
          ],
        ),
      ),
    );
  }
}