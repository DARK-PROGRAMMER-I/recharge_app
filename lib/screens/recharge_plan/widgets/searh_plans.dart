
import '../../../common_libs.dart';

class SearchPlans extends StatefulWidget {
  const SearchPlans({Key? key}) : super(key: key);

  @override
  State<SearchPlans> createState() => _SearchPlansState();
}

class _SearchPlansState extends State<SearchPlans> {
  TextEditingController _searchCtr = TextEditingController();
  final globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),

      child: Material(
        borderRadius: BorderRadius.circular(32.r),
        elevation: 5.h,
        shadowColor: Colors.black38,
        child: TextFormField(
          key: globalKey,
          controller: _searchCtr,
          style: TextStyle(
            fontSize: 16.h
          ),

          decoration: InputDecoration(

              border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(32.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(32.r),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(32.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(32.r),
            ),

            // contentPadding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            contentPadding: EdgeInsets.only(top: 30.h),
            prefixIcon: Image.asset('assets/search.png'),
            hintText: 'Search For plan, eg 230 or 330',
            
          ),
          onChanged: (val){
            print(val);
          },
        ),
      ),
    );
  }
}
