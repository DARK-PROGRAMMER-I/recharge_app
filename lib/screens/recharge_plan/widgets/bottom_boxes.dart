import '../../../common_libs.dart';

class BottomBoxes extends StatefulWidget {
  const BottomBoxes({Key? key}) : super(key: key);

  @override
  State<BottomBoxes> createState() => _BottomBoxesState();
}

class _BottomBoxesState extends State<BottomBoxes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 600.h,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index){
            return Column(
              children: [
                Card(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal:  10.w),
                    height: 103.h,
                    width: 375.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 5.h),
                          height:25.h,
                          width: 263.w,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30.r),
                                  bottomRight: Radius.circular(30.r)
                              )
                          ),
                          child: Text('Data Addon (Watch Cricket, Movie, etc)', style: TextStyle(color: Colors.white),),
                        ),
                        Text('R118', style: TextStyle(color: Colors.black87, fontSize: 22.h, fontWeight: FontWeight.bold ),),
                        Text('Data : 12.0 GB per pack', style: TextStyle(color: Colors.black87, fontSize: 14.h, fontWeight: FontWeight.bold ),),
                        Text('Validity : Till your existing pack', style: TextStyle(color: Colors.black87, fontSize: 16.h, fontWeight: FontWeight.w300 ),)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h,)
              ],
            );
          }),
    );
  }
}
