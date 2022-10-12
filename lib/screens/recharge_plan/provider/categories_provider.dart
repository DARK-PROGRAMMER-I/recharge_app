import 'dart:convert';

import 'package:recharge_app/common_libs.dart';
import 'package:http/http.dart' as http;
import '../models/recharge_categories_model.dart';


class CategoriesProvider with ChangeNotifier{

  CategoriesProvider(){
    fetchCategoryData();
  }

  List<CategoryDataModel>? _categoryData = [];
  List<CategoryDataModel>? get categoryData => _categoryData;
  getCategoryData(List<CategoryDataModel>? plan){
    _categoryData = plan;
    notifyListeners();
  }

  fetchCategoryData()async{
    String url = "https://ankretails.com/fastpay/app9/getMobileRechargeCategories.php";
    Map<String, dynamic> data = {
      'username': 9090909090,
      'password': 123,
    'operator_id':"1",
    'circle_id':"1"
    };

    try{
      var response = await http.post(Uri.parse(url), body: json.encode(data));
      print(response.statusCode.toString() + 'State True');
      print('Successss');
      if (response.statusCode == 200) {
        final msg = jsonDecode(response.body);
        //Check Login Status

        if (msg[0]['status'] == 'SUCCESS') {

          List<CategoryDataModel>? categoryData =  RechargeCategoriesModel.fromJson(msg[1]).data;
          getCategoryData(categoryData);
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