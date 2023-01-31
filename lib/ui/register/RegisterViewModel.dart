import 'package:e_commerce_app/base/base_viewModel.dart';
import 'package:e_commerce_app/providers/AppConfigeProvider.dart';
import 'package:e_commerce_app/repository/Auth/AuthRepoContract.dart';
import 'package:e_commerce_app/ui/register/RegisterNavigator.dart';

class RegisterViewModel extends BaseViewModel<RegisterNavigator> {
  AuthRepository authRepository;
  AppConfigeProvider appConfig;

  // late AuthRemoteDataSource dataSource;
  // late ApiManager apiManager;

  RegisterViewModel(this.authRepository, this.appConfig);

  // // we should use dependancy injection
  // apiManager = ApiManager();
  // dataSource = AuthRemoteDataSourceImpl(apiManager);
  // authRepository = AuthRepositoryImp(dataSource);

  void register(String name, String email, String password,
      String passwordConfirm, String phone) async {
    // AppConfigeProvider appConfig = Provider.of<AppConfigeProvider>(context, listen: false);

    navigator?.showLoading('Loading...');
    try {
      var token = await authRepository.register(
          name, email, password, passwordConfirm, phone);

      navigator?.hideLoading();
      if (token == null) {
        navigator?.showMessage('unable to register , server error');
        // navigator?.showMessage( response.mergeErrors() ,
        //   posActionTitle: 'ok',
        // );
        return;
      }
      appConfig.updateToken(token);
      // appConfig?.updateUser(response.user);
      navigator?.showMessage('successful Register',
          posActionTitle: 'ok', isDismissible: false, posAction: () {
        navigator?.goToHomeScreen();
      });
    } catch (e) {
      navigator?.hideLoading();
      navigator?.showMessage('error ,' + e.toString(), posActionTitle: 'ok');
    }
  }
}
