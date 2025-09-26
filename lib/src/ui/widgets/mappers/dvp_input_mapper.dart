import '../../ui.dart';

class DVPInputMapper {
  DVPInputModelUI fromMap(Map<String, dynamic> json) {
    return DVPInputModelUI(
      label: json['label'],
      prefixIcon: json['prefixIcon'],
    );
  }
}
