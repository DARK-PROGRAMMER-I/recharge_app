import '../../../common_libs.dart';

class PassedContact extends StatelessWidget {
  final String displayName , displayNumber;
  const PassedContact({Key? key, required this.displayName, required this.displayNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('assets/logo-airtel.png', scale: 1.1,), //widget.imgPath
      title: Padding(
        padding: EdgeInsets.only(top: 5.h),
        child: Column(
          children: [
            Text(displayName, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),),
            SizedBox(height: 5.h,),
            Text(displayNumber, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),),
            SizedBox(height: 5.h,),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
      trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios, size: 15,color: Colors.black,)),

    );
  }
}
