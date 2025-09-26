import 'package:dvp_components/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../domain/domain.dart';

class DVPAddAddreess extends StatefulWidget {
  final ValueChanged<AddressModel> onSelectedValue;
  final List<AddressModel> address;
  final List<String> regions;
  final List<String> cities;
  final CreateAccountAddressSection model;

  const DVPAddAddreess({
    super.key,
    required this.onSelectedValue,
    required this.address,
    required this.regions,
    required this.cities,
    required this.model,
  });

  @override
  State<DVPAddAddreess> createState() => _DVPAddAddreessState();
}

class _DVPAddAddreessState extends State<DVPAddAddreess> {
  final TextEditingController _locationController = TextEditingController();

  final FocusNode _locationFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  late String _selectedCity;

  late String _selectedRegion;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.model.title,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          if (widget.address.isEmpty)
            Text(
              widget.model.textEmpty,
              style: const TextStyle(fontSize: 18),
            )
          else
            ...widget.address.map((item) => AddresItem(addresItem: item)),
          Center(
            child: TextButton(
              onPressed: () => _showModal(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add),
                  Text(
                    widget.model.actionButton,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showModal(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    widget.model.titleBottonSheet,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        DVPInput(
                          focusNode: _locationFocusNode,
                          controller: _locationController,
                          labelText:
                              widget.model.inputLocationBottonSheet.label,
                          prefixIcon: Icons.add_home_outlined,
                          onChanged: (value) {},
                        ),
                        DVPDropdown(
                          onSelectedValue: (value) => _selectedRegion = value,
                          labelText: widget.model.inputRegionBottonSheet.label,
                          prefixIcon: Icons.location_searching_outlined,
                          dropdownValues: widget.regions,
                        ),
                        DVPDropdown(
                          onSelectedValue: (value) => _selectedCity = value,
                          labelText: widget.model.inputCityBottonSheet.label,
                          prefixIcon: Icons.location_city_outlined,
                          dropdownValues: widget.cities,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final newAddress = AddressModel(
                                location: _locationController.text,
                                region: _selectedRegion,
                                city: _selectedCity,
                              );
                              _locationController.text = '';
                              widget.onSelectedValue(newAddress);
                              Navigator.of(context).pop();
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.model.buttonSheet,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _locationController.dispose();
    _locationFocusNode.dispose();
  }
}
