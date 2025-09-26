import '../../../../dvp_components.dart';

class CreateAccountAddressSection {
  final String title;
  final String textEmpty;
  final String actionButton;
  final String titleBottonSheet;
  final DVPInputModelUI inputLocationBottonSheet;
  final DVPInputModelUI inputRegionBottonSheet;
  final DVPInputModelUI inputCityBottonSheet;
  final String buttonSheet;

  CreateAccountAddressSection({
    required this.title,
    required this.textEmpty,
    required this.actionButton,
    required this.titleBottonSheet,
    required this.inputLocationBottonSheet,
    required this.inputRegionBottonSheet,
    required this.inputCityBottonSheet,
    required this.buttonSheet
  });
}