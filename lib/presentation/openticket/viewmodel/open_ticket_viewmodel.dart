import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oraxcrm/app/data_holders.dart';
import 'package:oraxcrm/data/api-request/departments_requests.dart';
import 'package:oraxcrm/data/api-request/open_ticket_requests.dart';
import 'package:oraxcrm/data/api-request/priorties_requests.dart';
import 'package:oraxcrm/data/api-request/projects_requests.dart';
import 'package:oraxcrm/domain/model/department_model.dart';
import 'package:oraxcrm/domain/model/priorties_model.dart';
import 'package:oraxcrm/domain/model/projects_model.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class OpenTicketViewmodel extends ChangeNotifier {
  TextEditingController subjectController = TextEditingController();
  TextEditingController ticketDescriptionController = TextEditingController();

  String? department;
  String? departmentID;
  String? priority;
  String? priorityID;
  String? project;
  String? projectID;

  List<Data> derpartmentsList = [];
  List<DataPriorty> priortiesList = [];
  List<Dataprojects> projectsList = [];

  bool getPriortiesLastPageFlag = false;
  bool getDepartmentsLastPageFlag = false;
  bool getUserProjectsLastPageFlag = false;

  final ImagePicker mediaPicker = ImagePicker();
  List<XFile>? imageFileList = [];

  Dio dio = Dio();

  Future getPriorty(BuildContext context) async {
    PriortiesRequests priortiesRequests = PriortiesRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    PriortyModel? priortyModel;
    print(prefs.getString('usrToken'));
    if (getPriortiesLastPageFlag == false) {
      try {
        await priortiesRequests.getPriorties(
          {'Authorization': prefs.getString('usrToken')},
        ).then((res) async {
          if (res.statusCode == 200) {
            priortyModel = PriortyModel.fromJson(res.data);
            priortiesList.addAll(priortyModel!.dataPriorty!);
            getPriortiesLastPageFlag = true;
          } else if (res.statusCode == 401) {
            if (context.mounted) {
              context.pushReplacement(Routes.loginRoute);
            }
          }
        });
        return priortyModel?.dataPriorty;
      } catch (e) {
        print(e);
      }
    }
    notifyListeners();
  }

  Future getDepartments(BuildContext context) async {
    DepartmentsRequests departmentsRequests = DepartmentsRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DepartmentModel? departmentModel;
    print(prefs.getString('usrToken'));
    if (getDepartmentsLastPageFlag == false) {
      try {
        await departmentsRequests.getDepartments(
          {'Authorization': prefs.getString('usrToken')},
        ).then((res) async {
          if (res.statusCode == 200) {
            departmentModel = DepartmentModel.fromJson(res.data);
            derpartmentsList.addAll(departmentModel!.data!);
            getDepartmentsLastPageFlag = true;
          } else if (res.statusCode == 401) {
            if (context.mounted) {
              context.pushReplacement(Routes.loginRoute);
            }
          }
        });
        return departmentModel?.data;
      } catch (e) {
        print(e);
      }
    }
    notifyListeners();
  }

  Future getProjects(BuildContext context) async {
    ProjectsRequests projectsRequests = ProjectsRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ProjectsModel? projectsModel;
    print(prefs.getString('usrToken'));
    if (getUserProjectsLastPageFlag == false) {
      try {
        await projectsRequests.getProjects(
          {'Authorization': prefs.getString('usrToken')},
        ).then((res) async {
          if (res.statusCode == 200) {
            projectsModel = ProjectsModel.fromJson(res.data);
            projectsList.addAll(projectsModel!.dataprojects!);
            getUserProjectsLastPageFlag = true;
          } else if (res.statusCode == 401) {
            if (context.mounted) {
              context.pushReplacement(Routes.loginRoute);
            }
          }
        });
        return projectsModel?.dataprojects;
      } catch (e) {
        print(e);
      }
    }
    notifyListeners();
  }

  Future adsImagesPicker() async {
    if (DataHolders.androidVersion.contains('13') ||
        DataHolders.androidVersion.contains('14')) {
      try {
        await Permission.photos.request();
        await Permission.storage.request();
      } catch (e) {
        // Fluttertoast.showToast(msg: e.toString());
      }
    } else {
      try {
        await Permission.storage.request();
      } catch (e) {
        // Fluttertoast.showToast(msg: e.toString());
      }
    }
    try {
      if (await Permission.photos.isGranted ||
          await Permission.storage.isGranted) {
        try {
          final List<XFile> selectedImages =
              await mediaPicker.pickMultiImage(imageQuality: 60);
          if (selectedImages.isNotEmpty) {
            imageFileList!.addAll(selectedImages);
          }
          if (imageFileList!.length > 1) {
            imageFileList!.removeRange(1, imageFileList!.length);
          }
        } on PlatformException catch (e) {
          // Fluttertoast.showToast(msg: e.toString());
        } catch (e) {
          // Fluttertoast.showToast(msg: e.toString());
        }
        notifyListeners();
      }
    } catch (e) {
      // Fluttertoast.showToast(msg: e.toString());
    }
  }

  deletePhoto(int index) {
    imageFileList!.removeAt(index);
    notifyListeners();
  }

  toggleNotifyListener() {
    notifyListeners();
  }

  // Future addReply(String ticketId, Map<String, dynamic> body) async {
  //   OpenTicketRequests openTicketRequests = OpenTicketRequests();
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   try {
  //     final res = await openTicketRequests.addReply(ticketId,
  //         header: {
  //           'Authorization': prefs.getString('usrToken'),
  //         },
  //         body: body);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future sendTicket(FormData body) async {
    OpenTicketRequests openTicketRequests = OpenTicketRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final res = await openTicketRequests.sendTicket(header: {
        'Authorization': prefs.getString('usrToken'),
        "Content-type": "multipart/form-data"
      }, body: body);
      return res;
    } catch (e) {
      print(e);
    }
  }
}
