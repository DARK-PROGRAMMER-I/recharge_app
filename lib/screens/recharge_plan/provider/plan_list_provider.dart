import 'dart:convert';

import 'package:recharge_app/common_libs.dart';
import 'package:http/http.dart' as http;
import '../models/StateListModel.dart';
import '../models/recharge_plan_model.dart';


class PlanListProvider with ChangeNotifier{

  List<RechargePlansListModel>? _stateRechargePlans = [];
  List<RechargePlansListModel>? get stateRechargePlans => _stateRechargePlans;
  getStateRechargeData(List<RechargePlansListModel>? plan){
    _stateRechargePlans = plan;
    notifyListeners();
  }

  fetchStateOperatiorPlans()async{
    String url = "https://ankretails.com/fastpay/app9/getMobileRechargePlans.php";
    Map<String, dynamic> data = {
      'username': 9090909090,
      'password': 123,
    };

    try{
      var response = await http.post(Uri.parse(url), body: json.encode(data));
      print(response.statusCode.toString() + 'State True');
      if (response.statusCode == 200) {
        final msg = jsonDecode(response.body);
        //Check Login Status

        if (msg[0]['status'] == 'SUCCESS') {
          List<RechargePlansListModel>? mobileRechargeData =  RechargePlansModel.fromJson(msg[1]).data;
          getStateRechargeData(mobileRechargeData);
          notifyListeners();
          // notifyListeners();
        } else {
        }
      } else {
      }
    }catch(e){
      print(e.toString());
    }
  }
}