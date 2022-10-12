import 'dart:convert';

import 'package:recharge_app/common_libs.dart';
import 'package:http/http.dart' as http;
import '../models/mobile_operator_model.dart';

class MobileOperationProvider with ChangeNotifier{
  MobileOperationProvider(){
    fetchMobileOperatiorPlans();
  }

  List<MobileListModel>? _mobileOpPlans = [];
  List<MobileListModel>? get mobileOpPlans => _mobileOpPlans;
  getMobileOpData(List<MobileListModel>? plan){
    _mobileOpPlans = plan;
    notifyListeners();
  }


  String _mobOpName = '';
  String get mobOpName => _mobOpName;
  initialMobOpName(String name){
    _mobOpName = name;
    notifyListeners();
  }


  fetchMobileOperatiorPlans()async{
    String url = "https://ankretails.com/fastpay/app9/getMobileOperatorList.php";
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
          List<MobileListModel>? mobileOpData =  MobileListModelList.fromJson(msg[1]).data;
          getMobileOpData(mobileOpData);
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