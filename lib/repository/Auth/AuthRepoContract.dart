import 'package:e_commerce_app/models/responces/LoginResponse.dart';
import 'package:e_commerce_app/models/responces/RegisterResponce.dart';

abstract class AuthRepository {
  ///return token incase of successful
  /// and return null in casse of failed login
  Future<String?> login(String email, String password);

  Future<String?> register(String name, String email, String password,
      String rePassword, String phone);
}

abstract class AuthRemoteDataSource {
  Future<LoginResponse> login(String email, String password);

  Future<RegisterResponce> register(String name, String email, String password,
      String rePassword, String phone);
}

// abstract class LocalDataSource {
//
// }
