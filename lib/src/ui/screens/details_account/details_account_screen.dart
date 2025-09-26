import 'package:dvp_components/src/domain/domain.dart';
import 'package:dvp_components/src/ui/interfaces/dvp_details_account_screen_interface.dart';
import 'package:dvp_components/src/ui/screens/details_account/models/details_account_model_ui.dart';
import 'package:dvp_components/src/ui/screens/details_account/presenters/details_account_presenter.dart';
import 'package:dvp_components/src/ui/screens/details_account/providers/details_account_provider.dart';
import 'package:dvp_components/src/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsAccountScreen extends StatefulWidget {
  final DetailsAccountArgs args;
  static const String routeName = 'details';
  const DetailsAccountScreen({super.key, required this.args});

  @override
  State<DetailsAccountScreen> createState() => _DetailsAccountScreenState();
}

class _DetailsAccountScreenState extends State<DetailsAccountScreen>
    implements DVPDetailsAccountScreenInterface {
  late DetailsAccountModelUI _model;
  late final DetailsAccountPresenter _presenter;
  late DVPLoading? _dvpLoading;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _presenter.provider,
      builder: (context, _) {
        final provider = context.watch<DetailsAccountScreenProvider>();

        return ScreenTemplate(
          appBar: AppBar(
            title: Text(_model.title),
          ),
          child: CardAccount(
            labelEmpty: _model.labelEmpty,
            account: provider.account,
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _dvpLoading = DVPLoading();
    _presenter = DetailsAccountPresenter(this, widget.args);
    _presenter.getUi(widget.args.modelUI);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final arg = ModalRoute.of(context)?.settings.arguments as String;
      _presenter.provider.setArg(arg);
      _presenter.loadData();
    });
  }

  @override
  void setUi(DetailsAccountModelUI model) {
    _model = model;
  }

  @override
  void showCompleted() {
    // TODO: implement showCompleted
  }

  @override
  void showError(ErrorItem error) {
    // TODO: implement showError
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
