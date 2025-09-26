
import '../../../ui.dart';

class CreateAccountMapper {
  CreateAccountModelUI fromMap(Map<String, dynamic> json) {
    return CreateAccountModelUI(
      appBarTitle: json['appBarTitle'],
      title: json['title'],
      subtitle: json['subtitle'],
      inputName: DVPInputMapper().fromMap(json['inputName']),
      inputLastname: DVPInputMapper().fromMap(json['inputLastname']),
      inputBirthday: DVPInputMapper().fromMap(json['inputBirthday']),
      createAccountAddressSection:
          CreateAccountAddressSectionMapper().fromMap(json['createAccountAddressSection']),
    );
  }
}
