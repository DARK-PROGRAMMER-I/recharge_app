import '../../../common_libs.dart';

class CustomChip extends StatelessWidget {
  final String title;
  const CustomChip({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      alignment: Alignment.center,
      width: 150.w,
      height: 30.h,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.circular(30.r)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 13),),
          Icon(Icons.arrow_forward_ios, size: 13,)
        ],
      ),
    );
  }
}
