import '../../../common_libs.dart';

class RecentContacts extends StatefulWidget {
  const RecentContacts({Key? key}) : super(key: key);

  @override
  State<RecentContacts> createState() => _RecentContactsState();
}

class _RecentContactsState extends State<RecentContacts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 249.h,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 12,
            color: Colors.black12
          )
        ]
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: Text('Recently Paid')),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 3,
              itemBuilder: (context, index){
                return Column(
                  children: [

                    Container(
                      height: 64.h,
                      child: Expanded(
                        child: ListTile(
                          leading: Image.asset('assets/logo-airtel.png'),
                          title: Column(
                            children: [
                              Text('James Warner', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),),
                              SizedBox(height: 5.h,),
                              Text('+91 8087 000 XXX', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),),
                              SizedBox(height: 5.h,),
                              Text('Plan of Rs.130 expires on 20 Oct 2022', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),),

                            ],
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios, size: 15,color: Colors.black,)),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Divider(),
                    SizedBox(height: 10.h,),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
