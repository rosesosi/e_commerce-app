import 'package:e_commerce_app/base/BaseState.dart';
import 'package:e_commerce_app/providers/AppConfigeProvider.dart';
import 'package:e_commerce_app/ui/home/HomeScreen.dart';
import 'package:e_commerce_app/ui/register/RegisterNavigator.dart';
import 'package:e_commerce_app/ui/register/RegisterViewModel.dart';
import 'package:e_commerce_app/ui/widgets/custom_form_field.dart';
import 'package:e_commerce_app/ui/widgets/form_label.dart';
import 'package:e_commerce_app/ui/widgets/form_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends BaseState<RegisterScreen, RegisterViewModel>
    implements RegisterNavigator {
  var formKey = GlobalKey<FormState>();

  @override
  RegisterViewModel initViewModel() {
    // TODO: implement initViewModel
    return RegisterViewModel();
  }

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordControler = TextEditingController();

  TextEditingController passwordConfirmController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel.appConfig =
        Provider.of<AppConfigeProvider>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    // TODO: implement dispose
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
            children: [
              Image.asset('assets/images/logo.png'),
              SizedBox(
                height: 8,
              ),
              Expanded(
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FormLabel('Full Name'),
                        CustomFormField(
                          'Enter your Full Name',
                          keyboardType: TextInputType.name,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'please enter full name';
                            }
                          },
                          controller: nameController,
                        ),
                        FormLabel('Email'),
                        CustomFormField(
                          'Enter your Email address',
                          keyboardType: TextInputType.emailAddress,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'please enter email';
                            }
                            //email formatet ?
                          },
                          controller: emailController,
                        ),
                        FormLabel('Phone'),
                        CustomFormField(
                          'Enter your Phone',
                          keyboardType: TextInputType.phone,
                          controller: phoneController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'please enter phone';
                            }
                            // phone formate and number 11 num
                          },
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
                        FormLabel('Confirm Passowrd'),
                        CustomFormField(
                          'Re-Enter your Password ',
                          hideText: true,
                          controller: passwordConfirmController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'please re-enter password';
                            }
                            if (passwordControler.text != text) {
                              return 'password not match, re-enter password ';
                            }
                          },
                        ),
                        FormSubmitButton('Sign Up', () {
                          register();
                        })
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

  void register() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    viewModel.register(
        nameController.text,
        emailController.text,
        passwordControler.text,
        passwordConfirmController.text,
        phoneController.text);
  }

  @override
  void goToHomeScreen() {
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}
