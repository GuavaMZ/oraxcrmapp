class CrmCategoriesModel {
  List<CrmCategoriesData>? data;
  CrmCategoriesModel({this.data});

   CrmCategoriesModel.fromJson(List json) {
     if (json.isNotEmpty) {
      data = <CrmCategoriesData>[];
      for (var v in json) {
        data!.add(CrmCategoriesData.fromJson(v));
      }
    }
  }
}

class CrmCategoriesData {
  int? categoryId;
  String? categoryNameAr;
  String? categoryNameEn;
  String? categoryIcon;

  CrmCategoriesData(
      {this.categoryId,
      this.categoryNameAr,
      this.categoryNameEn,
      this.categoryIcon});
  
  factory CrmCategoriesData.fromJson(Map<String, dynamic> json) {
    return CrmCategoriesData(
        categoryId: json['category_id'],
        categoryNameAr: json['category_name_ar'],
        categoryNameEn: json['category_name_en'],categoryIcon: json['category_icon']);
  }
}

class CrmAdsModel {
  List? data;
  CrmAdsModel({this.data});

  CrmAdsModel.fromJson(List json) {
    if (json.isNotEmpty) {
      data = <CrmAdsData>[];
      for (var v in json) {
        data!.add(CrmAdsData.fromJson(v));
      }
    }
  }
}

class CrmAdsData {
  int? adId;
  String? adsImage;
  String? shadowColor;

  CrmAdsData({this.adId, this.adsImage, this.shadowColor});

  factory CrmAdsData.fromJson(Map<String, dynamic> json) {
    return CrmAdsData(
        adId: json['ad_id'],
        adsImage: json['ads_image'],
        shadowColor: json['shadow_color']);
  }
}

class CrmAppsSystemsModel {
  List<CrmAppsSystemsData>? data;
  CrmAppsSystemsModel({this.data});

   CrmAppsSystemsModel.fromJson(List json) {
         if (json.isNotEmpty) {
      data = <CrmAppsSystemsData>[];
      for (var v in json) {
        data!.add(CrmAppsSystemsData.fromJson(v));
      }
    }
  }
}

class CrmAppsSystemsData {
  int? sysId;
  String? sysName;
  int? categoryId;
  String? price;
  String? priceOffer;
  String? description;
  String? images;
  String? categoryNameAr;
  String? categoryNameEn;

  CrmAppsSystemsData(
      {this.sysId,
      this.sysName,
      this.categoryId,
      this.price,
      this.priceOffer,
      this.description,
      this.images,
      this.categoryNameAr,
      this.categoryNameEn});

  factory CrmAppsSystemsData.fromJson(Map<String, dynamic> json) {
    return CrmAppsSystemsData(
      sysId: json['sys_id'],
      sysName: json['name'],
      categoryId: json['category_id'],
      price: json['price'],
      priceOffer: json['price_offer'],
      description: json['description'],
      images: json['images'],
      categoryNameAr: json['category_name_ar'],
        categoryNameEn: json['category_name_en'],
    );
  }
}
