import 'package:e_commerce_app/base/base_navigator.dart';
import 'package:e_commerce_app/base/base_viewModel.dart';
import 'package:e_commerce_app/utiles/dialog_utils.dart';
import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseNavigator {
  late VM viewModel;

  VM initViewModel();

  @override
  void initState() {
    super.initState();
    viewModel = initViewModel();
    viewModel.navigator = this;
  }

  @override
  void showLoading(String message) {
    DialogUtils.showProgressDialog(context, message);
  }

  @override
  void hideLoading() {
    DialogUtils.hideDialog(context);
  }

  @override
  void showMessage(String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      String? negActionTitle,
      VoidCallback? negAction,
      bool isDismissible = true}) {
    DialogUtils.showMessage(context, message,
        posActionTitle: posActionTitle,
        posAction: posAction,
        negActionTitle: negActionTitle,
        negAction: negAction,
        isDismissible: isDismissible);
  }
}
