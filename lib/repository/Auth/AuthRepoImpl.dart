import 'package:e_commerce_app/repository/Auth/AuthRepoContract.dart';

class AuthRepositoryImp extends AuthRepository {
  AuthRemoteDataSource dataSource;

  AuthRepositoryImp(this.dataSource);

  @override
  Future<String?> login(String email, String password) async {
    var result = await dataSource.login(email, password);
    return result.token;
  }

  @override
  Future<String?> register(String name, String email, String password,
      String rePassword, String phone) async {
    var result =
        await dataSource.register(name, email, password, rePassword, phone);
    return result.token;
  }
}
