import 'package:recharge_app/common_libs.dart';


class RechargePlanProvider with ChangeNotifier{

  // Bottom Sheet Work
  bool _isMobOpBotom = false;
  bool get isMobOpBotom => _isMobOpBotom;
  getMobOpBotom(bool status){
    _isMobOpBotom = status;
    notifyListeners();
  }

  // Bottom Sheet Work
  bool _isStateBotom = false;
  bool get isStateBotom => _isStateBotom;
  getStateBotom(bool status){
    _isStateBotom = status;
    notifyListeners();
  }

  String? _mobOpName = '';
  String? get mobOpName => _mobOpName;
  getMobOpName(String? name){
    _mobOpName = name;
    notifyListeners();
  }

  String? _stateOpName = '';
  String? get stateOpName => _stateOpName;
  getStateOpName(String? name){
    _stateOpName = name;
    notifyListeners();
  }
}