import 'dart:convert';

import 'package:recharge_app/common_libs.dart';
import 'package:http/http.dart' as http;
import '../models/StateListModel.dart';

class RechargePlanProvider with ChangeNotifier{
  RechargePlanProvider(){
    fetchMobileRechargePlans();
    getStateNames();
  }


  List<StateListModel>? _mobileRechargePlans = [];
  List<StateListModel>? get mobileRechargePlans => _mobileRechargePlans;
  getMobileRechargeData(List<StateListModel>? plan){
    _mobileRechargePlans = plan;
    notifyListeners();
  }

  // Bottom Sheet Work
  bool _isOpen = false;
  bool get isOpen => _isOpen;
  getOpenStatus(bool status){
    _isOpen = status;
    notifyListeners();
  }

  String _stateName = '';
  String get stateName => _stateName;
  initialName(String name){
    _stateName = name;
    notifyListeners();
  }

  List<String> _stateNames = [];
  List<String> get stateNames => _stateNames;

  getStateNames(){
    fetchMobileRechargePlans();
    mobileRechargePlans?.forEach((element) {
      _stateNames.add(element.toString());
    });
    notifyListeners();
  }

  fetchMobileRechargePlans()async{
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
          getMobileRechargeData(mobileRechargeData);
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