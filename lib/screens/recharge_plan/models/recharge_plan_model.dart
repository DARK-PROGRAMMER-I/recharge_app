class RechargePlansModel {
  List<RechargePlansListModel>? data;

  RechargePlansModel({this.data});

  RechargePlansModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <RechargePlansListModel>[];
      json['data'].forEach((v) {
        data!.add(new RechargePlansListModel.fromJson(v));
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

class RechargePlansListModel {
  int? planId;
  int? planAmount;
  String? planDescription;
  String? locationName;
  String? planName;
  String? serviceProviderName;
  int? talktime;
  String? validity;
  int? categoryId;

  RechargePlansListModel(
      {this.planId,
        this.planAmount,
        this.planDescription,
        this.locationName,
        this.planName,
        this.serviceProviderName,
        this.talktime,
        this.validity,
        this.categoryId});

  RechargePlansListModel.fromJson(Map<String, dynamic> json) {
    planId = json['plan_id'];
    planAmount = json['plan_amount'];
    planDescription = json['plan_description'];
    locationName = json['location_name'];
    planName = json['plan_name'];
    serviceProviderName = json['service_provider_name'];
    talktime = json['talktime'];
    validity = json['validity'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan_id'] = this.planId;
    data['plan_amount'] = this.planAmount;
    data['plan_description'] = this.planDescription;
    data['location_name'] = this.locationName;
    data['plan_name'] = this.planName;
    data['service_provider_name'] = this.serviceProviderName;
    data['talktime'] = this.talktime;
    data['validity'] = this.validity;
    data['category_id'] = this.categoryId;
    return data;
  }
}
