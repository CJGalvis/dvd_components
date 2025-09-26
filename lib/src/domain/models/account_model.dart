import '../../../dvp_components.dart';

class AccountModel {
  String? id;
  final String name;
  final String lastname;
  final String birthday;
  final List<AddressModel> address;

  AccountModel({
    this.id,
    required this.name,
    required this.lastname,
    required this.birthday,
    required this.address,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'lastname': lastname,
        'birthday': birthday,
        'address': address.map((a) => a.toJson()).toList(),
      };

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json['id'],
      name: json['name'],
      lastname: json['lastname'],
      birthday: json['birthday'],
      address: (json['address'] as List<dynamic>)
          .map((e) => AddressModel.fromJson(e))
          .toList(),
    );
  }
}
