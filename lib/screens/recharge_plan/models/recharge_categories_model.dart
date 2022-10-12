class RechargeCategoriesModel {
  List<CategoryDataModel>? data;

  RechargeCategoriesModel({this.data});

  RechargeCategoriesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CategoryDataModel>[];
      json['data'].forEach((v) {
        data!.add(new CategoryDataModel.fromJson(v));
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

class CategoryDataModel {
  int? categoryId;
  String? categoryName;
  int? operatorId;
  int? circleId;

  CategoryDataModel({this.categoryId, this.categoryName, this.operatorId, this.circleId});

  CategoryDataModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    operatorId = json['operator_id'];
    circleId = json['circle_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['operator_id'] = this.operatorId;
    data['circle_id'] = this.circleId;
    return data;
  }
}
