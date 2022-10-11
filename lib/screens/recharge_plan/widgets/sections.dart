import '../../../common_libs.dart';

class Sections extends StatelessWidget {
  const Sections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 55.h,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return Container(
              width: 90.w,
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Text('RECOMMENDED DATA')),
                  SizedBox(height: 10.h,),
                  Container(
                    width: 90,
                    height: 4.h,
                    color: Colors.blue[900],
                  )
                ],
              ),
            );
          }),
    );
  }
}
