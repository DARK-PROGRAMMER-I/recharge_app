import 'dart:convert';

import 'package:recharge_app/common_libs.dart';
import 'package:http/http.dart' as http;
import '../models/StateListModel.dart';
import '../models/recharge_plan_model.dart';


class PlanListProvider with ChangeNotifier{

  PlanListProvider(){
    // WidgetsBinding.instance.addPostFrameCallback((_){
      fetchMobileRechargePlans('1');
    // });


  }

  List<RechargePlansListModel>? _stateRechargePlans = [];
  List<RechargePlansListModel>? get stateRechargePlans => _stateRechargePlans;
  getRechargePlans(List<RechargePlansListModel>? plan){
    _stateRechargePlans = plan;
    notifyListeners();
  }

  fetchMobileRechargePlans(String cat_id)async{
    String url = "https://ankretails.com/fastpay/app9/getMobileRechargePlans.php";
    Map<String, dynamic> data = {
      'username': 9090909090,
      'password': 123,
      'category_id':cat_id
    };

    try{
      var response = await http.post(Uri.parse(url), body: json.encode(data));
      if (response.statusCode == 200) {
        final msg = jsonDecode(response.body);
        //Check Login Status

        if (msg[0]['status'] == 'SUCCESS') {
          if(msg.length >1){

          List<RechargePlansListModel>? mobileRechargePlan =  RechargePlansModel.fromJson(msg[1]).data;

            getRechargePlans(mobileRechargePlan);
            notifyListeners();
          }else{

            getRechargePlans([]);
          }
        } else {
        }
      } else {
      }
    }catch(e){
      print(e.toString());
    }
  }
}