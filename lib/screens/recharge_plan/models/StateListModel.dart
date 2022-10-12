class StateListModelList {
  List<StateListModel>? data;

  StateListModelList({this.data});

  StateListModelList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <StateListModel>[];
      json['data'].forEach((v) {
        data!.add(new StateListModel.fromJson(v));
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

class StateListModel {
  int? stateId;
  String? stateCode;
  String? stateName;

  StateListModel({this.stateId, this.stateCode, this.stateName});

  StateListModel.fromJson(Map<String, dynamic> json) {
    stateId = json['state_id'];
    stateCode = json['state_code'];
    stateName = json['state_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state_id'] = this.stateId;
    data['state_code'] = this.stateCode;
    data['state_name'] = this.stateName;
    return data;
  }
}
