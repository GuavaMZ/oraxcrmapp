import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/data/api-request/clients_file_requests.dart';
import 'package:oraxcrm/domain/model/files_model.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilesViewmodel extends ChangeNotifier {
  bool lastPageFlag = false;
  List<FileElement>? filesList = [];

  Future getFiles(BuildContext context) async {
    ClientsFileRequests clientsFileRequests = ClientsFileRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FilesModel? filesModel;
    print(prefs.getString('usrToken'));
    if (lastPageFlag == false) {
      try {
        await clientsFileRequests.getFiles(
          {'Authorization': prefs.getString('usrToken')},
        ).then((res) async {
          if (res.statusCode == 200) {
            filesModel = FilesModel.fromJson(res.data);
            filesList!.addAll(filesModel!.data!.files);
            lastPageFlag = true;
          } else if (res.statusCode == 401) {
            if (context.mounted) {
              context.pushReplacement(Routes.loginRoute);
            }
          }
        });
        return filesModel?.data;
      } catch (e) {
        print(e);
      }
    }
  }
}
