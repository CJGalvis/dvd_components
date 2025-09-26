import 'package:dvp_components/src/ui/screens/create_account/presenters/create_account_presenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/domain.dart';
import '../../helpers/message_handler_helper.dart';
import '../../ui.dart';
import 'providers/create_screen_provider.dart';

class CreateAccountScreen extends StatefulWidget {
  final CreateAccountArgs args;
  static const String routeName = 'create';

  const CreateAccountScreen({super.key, required this.args});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen>
    implements DVPCreateAccountScreenInterface {
  late CreateAccountModelUI _model;
  late final CreateAccountPresenter _presenter;
  late DVPLoading? _dvpLoading;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _presenter.provider,
      builder: (context, _) {
        final provider = context.watch<CreateAccountScreenProvider>();

        return ScreenTemplate(
          appBar: AppBar(
            title: Text(_model.appBarTitle),
          ),
          child: Center(
            child: ListView(
              padding: const EdgeInsets.all(15),
              shrinkWrap: true,
              children: [
                DVPHeader(
                  title: _model.title,
                  subtitle: _model.subtitle,
                ),
                DVPInput(
                  labelText: _model.inputName.label,
                  prefixIcon: Icons.badge_outlined,
                  focusNode: provider.nameFocusNode,
                  controller: provider.nameController,
                  onChanged: provider.updateName,
                ),
                DVPInput(
                  labelText: _model.inputLastname.label,
                  prefixIcon: Icons.badge_outlined,
                  focusNode: provider.lastnameFocusNode,
                  controller: provider.lastnameController,
                  onChanged: provider.updateLastname,
                ),
                DVPInputCalendar(
                  labelText: _model.inputBirthday.label,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1970),
                  lastDate: DateTime.now(),
                  focusNode: provider.dateFocusNode,
                  controller: provider.dateController,
                  onSelectedValue: (value) => provider.updateBirthday(value),
                ),
                DVPAddAddreess(
                  model: _model.createAccountAddressSection,
                  regions: provider.regions,
                  cities: provider.cities,
                  address: provider.addressList,
                  onSelectedValue: provider.addAddress,
                ),
                Visibility(
                  visible: provider.enableButton,
                  child: ElevatedButton(
                    onPressed: () => _presenter.createUser(),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Create',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.login),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _dvpLoading = DVPLoading();
    _presenter = CreateAccountPresenter(this, widget.args);
    _presenter.getUi(widget.args.modelUI);
     WidgetsBinding.instance.addPostFrameCallback((_) {
      _presenter.loadData();
    });
  }

  @override
  void setUi(CreateAccountModelUI model) {
    _model = model;
  }

  @override
  void showCompleted() {
    MessageHelper.showSnackBar(
      context,
      message: 'Creación exitosa',
    );
    widget.args.onCompleted.call();
  }

  @override
  void showError(ErrorItem error) {
    MessageHelper.showSnackBar(
      context,
      message: error.message,
      isError: true,
    );
  }

  @override
  void showLoading() {
    _dvpLoading?.show(context);
  }

  @override
  void hideLoading() {
    _dvpLoading?.hide();
  }
}
