
import '../../../ui.dart';

class CreateAccountModelUI {
  final String appBarTitle;
  final String title;
  final String subtitle;
  final DVPInputModelUI inputName;
  final DVPInputModelUI inputLastname;
  final DVPInputModelUI inputBirthday;
  final CreateAccountAddressSection createAccountAddressSection;

  CreateAccountModelUI({
    required this.appBarTitle,
    required this.title,
    required this.subtitle,
    required this.inputName,
    required this.inputLastname,
    required this.inputBirthday,
    required this.createAccountAddressSection,
  });
}


