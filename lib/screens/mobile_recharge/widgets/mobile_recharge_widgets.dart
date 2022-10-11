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
    return FutureBuilder(
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
                ListTile(
                  leading: const CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.person),
                  ),
                  title: Text(contact.displayName),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(contact.phones[0].toString()),
                    ],
                  ),
                ),
                const Divider()
              ]);
            });
      },
    );
  }
}

class MobileRechargeAppBar extends StatelessWidget {
  const MobileRechargeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      color: Color(0xff041e55),
      child: Padding(
        padding: EdgeInsets.only(left: 5.w, top: 50.h),
        child: Row(
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_outlined, size: 16.h,), color: Colors.white, ),
            SizedBox(width: 70.w,),
            Text('Mobile Recharge', style: TextStyle(fontSize: 20.h, color: Colors.white),)
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

          child: Image.asset('assets/1.jpg', fit: BoxFit.cover, height: 120.h,width: double.infinity,)),
    );
  }
}


