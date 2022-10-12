import 'package:recharge_app/screens/recharge_plan/recharge_plan_screen.dart';

import '../../../common_libs.dart';

Future<List<Contact>> getContacts() async {
  bool isGranted = await Permission.contacts.status.isGranted;
  if (!isGranted) {
    isGranted = await Permission.contacts.request().isGranted;
  }
  if (isGranted) {
    return await FastContacts.allContacts;
  }
  return [];
}

class ContactList extends StatelessWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480.h,
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
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
      child: FutureBuilder(
        future: getContacts(),
        builder: (context, AsyncSnapshot<List<Contact>> snapshot) {
          print(snapshot.data?[0].displayName);
          if (snapshot.data == null) {
            return const Center(
              child:
              SizedBox(height: 50, child: CircularProgressIndicator()),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.zero,
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                Contact contact = snapshot.data![index];
                return Column(children: [
                  SizedBox(height: 10.h,),
                  GestureDetector(
                  onTap: (){},
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 20,
                        child: Icon(Icons.person),
                      ),
                      title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text(contact.displayName, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),),
                        SizedBox(height: 5.h,),
                      Text(contact.phones[0].toString(), style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),),
                      ],
                    ),
                      trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios, size: 15,color: Colors.black,)),
                    ),
                  ),
                  const Divider()
                ]);
              });
        },
      ),
    );
  }
}

class MobileRechargeAppBar extends StatelessWidget {
  final String title;
  const MobileRechargeAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      color: Color(0xff041e55),
      child: Padding(
        padding: EdgeInsets.only(left: 5.w, top: 50.h),
        child: Row(
          children: [
            title == 'Mobile Recharge' ? SizedBox.shrink():IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios_outlined, size: 16.h,), color: Colors.white, ),
            title == 'Mobile Recharge'  ? SizedBox(width: 100.w,):SizedBox(width: 60.w,),
            Center(child: Text(title, style: TextStyle(fontSize: 20.h, color: Colors.white),))
          ],
        ),
      ),
    );
  }
}

class AdImage extends StatelessWidget {
  const AdImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r)
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5)
          ),

          child: Image.asset('assets/recharge_banner.png', fit: BoxFit.cover, height: 120.h,width: double.infinity,)),
    );
  }
}



