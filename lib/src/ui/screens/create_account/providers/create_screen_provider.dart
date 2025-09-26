import 'package:dvp_components/dvp_components.dart';
import 'package:flutter/material.dart';

class CreateAccountScreenProvider extends ChangeNotifier {
  final nameController = TextEditingController();
  final lastnameController = TextEditingController();
  final dateController = TextEditingController();

  final nameFocusNode = FocusNode();
  final lastnameFocusNode = FocusNode();
  final dateFocusNode = FocusNode();

  final List<AddressModel> _addressList = [];
  List<AddressModel> get addressList => List.unmodifiable(_addressList);

  List<String> _regions = [];
  List<String> get regions => List.unmodifiable(_regions);

  List<String> _cities = [];
  List<String> get cities => List.unmodifiable(_cities);

  bool get enableButton =>
      nameController.text.isNotEmpty &&
      lastnameController.text.isNotEmpty &&
      dateController.text.isNotEmpty &&
      addressList.isNotEmpty;

  void updateName(String value) => notifyListeners();
  void updateLastname(String value) => notifyListeners();
  void updateBirthday(String value) => notifyListeners();

  void addAddress(AddressModel address) {
    _addressList.add(address);
    notifyListeners();
  }

  void setRegions(List<String> regions) {
    _regions = regions;
    notifyListeners();
  }

  void setCities(List<String> cities) {
    _cities = cities;
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    lastnameController.dispose();
    dateController.dispose();
    nameFocusNode.dispose();
    lastnameFocusNode.dispose();
    dateFocusNode.dispose();
    super.dispose();
  }
}
