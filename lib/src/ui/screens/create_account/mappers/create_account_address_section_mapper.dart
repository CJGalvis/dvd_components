import '../../../ui.dart';

class CreateAccountAddressSectionMapper {
  CreateAccountAddressSection fromMap(Map<String, dynamic> json) {
    return CreateAccountAddressSection(
        title: json['title'],
        textEmpty: json['textEmpty'],
        titleBottonSheet: json['titleBottonSheet'],
        actionButton: json['actionButton'],
        inputCityBottonSheet:
            DVPInputMapper().fromMap(json['inputCityBottonSheet']),
        inputLocationBottonSheet:
            DVPInputMapper().fromMap(json['inputLocationBottonSheet']),
        inputRegionBottonSheet:
            DVPInputMapper().fromMap(json['inputRegionBottonSheet']),
        buttonSheet: json['butonBottonSheet']);
  }
}
