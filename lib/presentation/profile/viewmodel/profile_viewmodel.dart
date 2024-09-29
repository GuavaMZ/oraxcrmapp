import 'package:flutter/foundation.dart';
import 'package:oraxcrm/app/data_holders.dart';

class ProfileViewModel extends ChangeNotifier{
  ValueListenable<String>  userName = ValueNotifier(DataHolders.userDataModel?.data?.firstname ?? '');

}