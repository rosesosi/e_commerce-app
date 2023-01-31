import 'package:e_commerce_app/base/BaseState.dart';
import 'package:e_commerce_app/providers/AppConfigeProvider.dart';
import 'package:e_commerce_app/ui/home/HomeScreen.dart';
import 'package:e_commerce_app/ui/login/LoginNavigator.dart';
import 'package:e_commerce_app/ui/login/LoginViewModel.dart';
import 'package:e_commerce_app/ui/register/RegisterScreen.dart';
import 'package:e_commerce_app/ui/widgets/custom_form_field.dart';
import 'package:e_commerce_app/ui/widgets/form_label.dart';
import 'package:e_commerce_app/ui/widgets/form_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'Login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen, LoginViewModel>
    implements LoginNavigator {
  @override
  void goToHomeScreen() {
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }

  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordControler = TextEditingController();

  @override
  LoginViewModel initViewModel() {
    return LoginViewModel();
  }

  @override
  void initState() {
    super.initState();
    viewModel.appConfig =
        Provider.of<AppConfigeProvider>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.navigator = null;
    viewModel.appConfig = null;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/logo.png'),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Welcome Back To Route',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const Text(
                'please sign in with your email',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FormLabel('Email'),
                        CustomFormField(
                          'Enter your email',
                          keyboardType: TextInputType.emailAddress,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'please enter your email';
                            }
                          },
                          controller: emailController,
                        ),
                        FormLabel('Password'),
                        CustomFormField(
                          'Enter your Password',
                          hideText: true,
                          controller: passwordControler,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'please enter password';
                            }
                          },
                        ),
                        Text('Forget Password ?',
                            textAlign: TextAlign.end,
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                        SizedBox(
                          height: 20,
                        ),
                        FormSubmitButton('Sign In', () {
                          login();
                        }),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, RegisterScreen.routeName);
                          },
                          child: const Text(
                              'Dont have an account ? Create Account ',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    viewModel.Login(emailController.text, passwordControler.text);
  }
}
