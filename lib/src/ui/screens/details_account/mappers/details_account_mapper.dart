import '../models/details_account_model_ui.dart';

class ListAccountsMapper {
  DetailsAccountModelUI fromMap(Map<String, dynamic> json) {
    return DetailsAccountModelUI(
      title: json['title'],
      labelEmpty: json['labelEmpty'],
    );
  }
}
