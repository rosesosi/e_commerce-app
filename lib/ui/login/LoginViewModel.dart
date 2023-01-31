import 'package:e_commerce_app/base/base_viewModel.dart';
import 'package:e_commerce_app/providers/AppConfigeProvider.dart';
import 'package:e_commerce_app/repository/Auth/AuthRepoContract.dart';
import 'package:e_commerce_app/ui/login/LoginNavigator.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator> {
  AppConfigeProvider appConfig;
  AuthRepository authRepository;

  // late AuthRemoteDataSource dataSource;
  // late ApiManager apiManager;

  LoginViewModel(this.authRepository, this.appConfig);

  // we should use dependancy injection
  // apiManager = ApiManager();
  // dataSource = AuthRemoteDataSourceImpl(apiManager);
  // authRepository = AuthRepositoryImp(dataSource);

  String? token = null;

  void Login(String email, String password) async {
    // appConfig = Provider.of<AppConfigeProvider>(context ,listen: false) ;

    try {
      navigator?.showLoading('Loading..');

      var token = await authRepository.login(email, password);
      navigator?.hideLoading();

      if (token == null) {
        navigator?.showMessage('unable to login , wrong user name or password');
        // navigator?.showMessage(response.message ?? '' , posActionTitle: 'ok');
        return;
      }
      appConfig.updateToken(token);
      navigator?.showMessage('successful login', posActionTitle: 'ok',
          posAction: () {
        navigator?.goToHomeScreen();
      }, isDismissible: false);
    } catch (e, stacktrace) {
      print(stacktrace);
      navigator?.hideLoading();
      navigator?.showMessage('error ,' + e.toString());
    }
  }
}
