import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recharge_app/common_libs.dart';
import 'package:recharge_app/screens/mobile_recharge/model/mobile_recharge_model.dart';

class MobileRechargeProvider with ChangeNotifier{
  bool _status = false;
  bool get status => _status;
  getStatus(bool stat){
    _status = stat;
    notifyListeners();
  }

  List<Data>? _mobileRechargeData = [];
  List<Data>? get mobileRechargeData => _mobileRechargeData;
  getMobileRechargeData(List<Data>? data){
    _mobileRechargeData = data;
    notifyListeners();
  }

  fetchMobileRechargeData()async{
      String url = "https://ankretails.com/fastpay/app9/getCustomerMobileRechargeHistory.php?username=9090909090&password=123";
      Map<String, dynamic> data = {
        'username': 9090909090,
        'password': 123,
      };

      try{
        var response = await http.post(Uri.parse(url), body: json.encode(data));
        print(response.statusCode);
        if (response.statusCode == 200) {
          final msg = jsonDecode(response.body);
          //Check Login Status

          if (msg[0]['status'] == 'SUCCESS') {
            List<Data>? mobileRechargeData =  MobileRechargeModel.fromJson(msg[1]).data;
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
