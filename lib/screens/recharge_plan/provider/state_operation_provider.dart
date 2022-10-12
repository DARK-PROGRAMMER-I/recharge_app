import 'dart:convert';

import 'package:recharge_app/common_libs.dart';
import 'package:http/http.dart' as http;
import '../models/StateListModel.dart';
import '../models/mobile_operator_model.dart';

class StateOperationProvider  with ChangeNotifier{

  StateOperationProvider(){
    fetchStateOperatiorPlans();
  }

  List<StateListModel>? _stateRechargePlans = [];
  List<StateListModel>? get stateRechargePlans => _stateRechargePlans;
  getStateRechargeData(List<StateListModel>? plan){
    _stateRechargePlans = plan;
    notifyListeners();
  }

  String _stateName = '';
  String get stateName => _stateName;
  initialName(String name){
    _stateName = name;
    notifyListeners();
  }

  fetchStateOperatiorPlans()async{
    String url = "https://ankretails.com/fastpay/app9/getStateList.php";
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
          List<StateListModel>? mobileRechargeData =  StateListModelList.fromJson(msg[1]).data;
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