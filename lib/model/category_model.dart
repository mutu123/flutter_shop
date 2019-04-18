class CategoryBigModel {
  String code;
  String message;
  List<Data> data;

  CategoryBigModel({this.code, this.message, this.data});

  factory CategoryBigModel.fromJson(Map<String, dynamic> json) {
    List<Data> data = [];
    if (json['data'] != null) {
      var dataJson = json['data'] as List;
      data = dataJson.map((v) => (Data.fromJson(v))).toList();
    }
    return CategoryBigModel(
        code: json['code'], message: json['message'], data: data ?? null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String mallCategoryId;
  String mallCategoryName;
  List<BxMallSubDto> bxMallSubDto;
  Null comments;
  String image;

  Data(
      {this.mallCategoryId,
      this.mallCategoryName,
      this.bxMallSubDto,
      this.comments,
      this.image});

  factory Data.fromJson(Map<String, dynamic> json) {
    var bxMallSubDtoJson = json['bxMallSubDto'] as List;
    List<BxMallSubDto> bxMallSubDto = bxMallSubDtoJson.map((i) {
      return BxMallSubDto.fromJson(i);
    }).toList();

    return Data(
        mallCategoryId: json['mallCategoryId'],
        mallCategoryName: json['mallCategoryName'],
        comments: json['comments'],
        image: json['image'],
        bxMallSubDto: bxMallSubDto);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallCategoryId'] = this.mallCategoryId;
    data['mallCategoryName'] = this.mallCategoryName;
    if (this.bxMallSubDto != null) {
      data['bxMallSubDto'] = this.bxMallSubDto.map((v) => v.toJson()).toList();
    }
    data['comments'] = this.comments;
    data['image'] = this.image;
    return data;
  }
}

class BxMallSubDto {
  String mallSubId;
  String mallCategoryId;
  String mallSubName;
  String comments;

  BxMallSubDto(
      {this.mallSubId, this.mallCategoryId, this.mallSubName, this.comments});

  factory BxMallSubDto.fromJson(Map<String, dynamic> json) {
    return BxMallSubDto(
        mallSubId: json['mallSubId'],
        mallCategoryId: json['mallCategoryId'],
        mallSubName: json['mallSubName'],
        comments: json['comments']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallSubId'] = this.mallSubId;
    data['mallCategoryId'] = this.mallCategoryId;
    data['mallSubName'] = this.mallSubName;
    data['comments'] = this.comments;
    return data;
  }
}
