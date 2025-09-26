import 'package:dvp_components/src/domain/domain.dart';
import 'package:dvp_components/src/ui/screens/list_accounts/models/list_accounts_model_ui.dart';
import 'package:dvp_components/src/ui/screens/list_accounts/presenters/list_accounts_presenter.dart';
import 'package:dvp_components/src/ui/screens/list_accounts/providers/list_accounts_provider.dart';
import 'package:dvp_components/src/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListAccountsScreen extends StatefulWidget {
  final ListAccountsArgs args;
  static const String routeName = 'list';
  const ListAccountsScreen({super.key, required this.args});

  @override
  State<ListAccountsScreen> createState() => _ListAccountsScreenState();
}

class _ListAccountsScreenState extends State<ListAccountsScreen>
    implements DVPListAccountsScreenInterface {
  late ListAccountsModelUI _model;
  late final ListAccountsPresenter _presenter;
  late DVPLoading? _dvpLoading;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _presenter.provider,
      builder: (context, _) {
        final provider = context.watch<ListAccountsScreenProvider>();

        return ScreenTemplate(
          appBar: AppBar(
            title: Text(_model.title),
          ),
          floatingButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => widget.args.onPressedFloatingButton.call(),
          ),
          child: provider.listAccounts.isNotEmpty
              ? ListView.builder(
                  itemCount: provider.listAccounts.length,
                  itemBuilder: (context, index) {
                    final item = provider.listAccounts[index];

                    return GestureDetector(
                      onTap: () => widget.args.onSelectItem.call(item),
                      child: CardBasic(
                        label: '${item.name} ${item.lastname}',
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(_model.textEmpty),
                ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _dvpLoading = DVPLoading();
    _presenter = ListAccountsPresenter(this, widget.args);
    _presenter.getUi(widget.args.modelUI);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _presenter.loadData();
    });
  }

  @override
  void setUi(ListAccountsModelUI model) {
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
