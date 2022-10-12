class MobileListModelList {
  List<MobileListModel>? data;

  MobileListModelList({this.data});

  MobileListModelList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <MobileListModel>[];
      json['data'].forEach((v) {
        data!.add(new MobileListModel.fromJson(v));
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

class MobileListModel {
  int? operatorId;
  String? operatorName;
  String? operatorImage;

  MobileListModel({this.operatorId, this.operatorName, this.operatorImage});

  MobileListModel.fromJson(Map<String, dynamic> json) {
    operatorId = json['operator_id'];
    operatorName = json['operator_name'];
    operatorImage = json['operator_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['operator_id'] = this.operatorId;
    data['operator_name'] = this.operatorName;
    data['operator_image'] = this.operatorImage;
    return data;
  }
}