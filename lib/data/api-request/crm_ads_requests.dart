import 'package:oraxcrm/domain/model/crm_ads_page_models.dart';
import 'package:oraxcrm/main.dart';

class CRMAdsRequests {
  Future getCategories() async {
    CrmCategoriesModel  categoriesModel = CrmCategoriesModel();
    try {
      final res = await supabase.rpc('getcategories');
      categoriesModel = CrmCategoriesModel.fromJson(res);
      print(categoriesModel);
      return categoriesModel;
    } catch (e) {
      return e;
    }

  }

  Future getAdvertises() async {
    CrmAdsModel  adsModel = CrmAdsModel();
    try {
      final res = await supabase.rpc('getads');
      adsModel = CrmAdsModel.fromJson(res);
      return adsModel;
    } catch (e) {
      return e;
    }
  }

  Future getSystemsAndApps() async {
    CrmAppsSystemsModel  crmAppsSystemsModel = CrmAppsSystemsModel();
    try {
      final res = await supabase.rpc('getAds');
      crmAppsSystemsModel = CrmAppsSystemsModel.fromJson(res);
      print(crmAppsSystemsModel);
      return crmAppsSystemsModel;
    } catch (e) {
      return e;
    }
  }
}