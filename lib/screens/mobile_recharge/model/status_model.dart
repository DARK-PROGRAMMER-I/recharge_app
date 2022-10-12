class StatusModel {
  String? status;
  String? statusMsg;

  StatusModel({this.status, this.statusMsg});

  StatusModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusMsg = json['status_msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_msg'] = this.statusMsg;
    return data;
  }
}