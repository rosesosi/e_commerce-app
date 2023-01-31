import 'package:e_commerce_app/api/ApiManager.dart';
import 'package:e_commerce_app/models/responces/LoginResponse.dart';
import 'package:e_commerce_app/models/responces/RegisterResponce.dart';
import 'package:e_commerce_app/repository/Auth/AuthRepoContract.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl(this.apiManager);

  @override
  Future<LoginResponse> login(String email, String password) async {
    var responce = await apiManager.Login(email, password);
    return responce;
  }

  @override
  Future<RegisterResponce> register(String name, String email, String password,
      String repassword, String phone) async {
    var responce =
        await apiManager.register(name, email, password, repassword, phone);
    return responce;
  }
}
