import '../models/list_accounts_model_ui.dart';

class ListAccountsMapper {
  ListAccountsModelUI fromMap(Map<String, dynamic> json) {
    return ListAccountsModelUI(
      title: json['title'],
      textEmpty: json['textEmpty'],
    );
  }
}
