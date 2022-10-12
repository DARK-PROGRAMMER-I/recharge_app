class MobileRechargeModel {
  List<Data>? data;

  MobileRechargeModel({this.data});

  MobileRechargeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Data {
  int? orderid;
  String? rechargeDate;
  String? rechargePersonName;
  String? mobileno;
  int? rechargeplanid;
  String? operator;
  String? operatorimage;
  int? rechargeamount;
  String? details;

  Data(
      {this.orderid,
        this.rechargeDate,
        this.rechargePersonName,
        this.mobileno,
        this.rechargeplanid,
        this.operator,
        this.operatorimage,
        this.rechargeamount,
        this.details});

  Data.fromJson(Map<String, dynamic> json) {
    orderid = json['orderid'];
    rechargeDate = json['recharge_date'];
    rechargePersonName = json['recharge_person_name'];
    mobileno = json['mobileno'];
    rechargeplanid = json['rechargeplanid'];
    operator = json['operator'];
    operatorimage = json['operatorimage'];
    rechargeamount = json['rechargeamount'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderid'] = this.orderid;
    data['recharge_date'] = this.rechargeDate;
    data['recharge_person_name'] = this.rechargePersonName;
    data['mobileno'] = this.mobileno;
    data['rechargeplanid'] = this.rechargeplanid;
    data['operator'] = this.operator;
    data['operatorimage'] = this.operatorimage;
    data['rechargeamount'] = this.rechargeamount;
    data['details'] = this.details;
    return data;
  }
}