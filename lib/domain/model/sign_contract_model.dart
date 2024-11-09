// ignore_for_file: non_constant_identifier_names

class SignContractModel {
  SignContractModel({
    required this.status,
    required this.codesend_status,
  });

  final bool? status;
  final String? codesend_status;

  factory SignContractModel.fromJson(Map<String, dynamic> json) {
    return SignContractModel(
      status: json["status"],
      codesend_status: json["codesend_status"],
    );
  }
}

class CheckSignContractModel {
  CheckSignContractModel({
    required this.status,
    required this.message,
  });

  final status;
  final String? message;

  factory CheckSignContractModel.fromJson(Map<String, dynamic> json) {
    return CheckSignContractModel(
      status: json["status"],
      message: json["message"],
    );
  }
}
