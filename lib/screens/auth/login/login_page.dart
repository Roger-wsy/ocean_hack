import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ocean_hack/components/ehp_loading_dialog.dart';
import 'package:ocean_hack/components/ehp_login_sub_text.dart';
import 'package:ocean_hack/components/ehp_scaffold.dart';
import 'package:ocean_hack/components/ehp_single_button.dart';
import 'package:ocean_hack/components/ehp_text.dart';
import 'package:ocean_hack/components/ehp_text_field.dart';
import 'package:ocean_hack/constant/constant.dart';
import 'package:ocean_hack/routes/route_name.dart';
import 'package:ocean_hack/screens/auth/login/bloc/auth_bloc.dart';
import 'package:ocean_hack/screens/auth/login/constant.dart';
import 'package:ocean_hack/screens/bottom_nav/bottom_navigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordObscure = true;
  bool confirmPasswordObscure = true;
  bool dialogShown = false;
  final _formKey = GlobalKey<FormBuilderState>();

  Map<String, dynamic> formValues = {
    LoginFormConstant.email: '',
    LoginFormConstant.password: '',
  };

  @override
  Widget build(BuildContext context) {
    return
        // BlocListener<AuthBloc, AuthState>(
        //   listener: (context, state) {
        //     if (state is AuthError) {
        //       Navigator.pop(context);
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         SnackBar(
        //           content: EhpText(
        //             state.message,
        //             color: Colors.white,
        //           ),
        //           backgroundColor: Colors.red,
        //         ),
        //       );
        //     }
        //     if (state is AuthLoginSuccess) {
        //       Navigator.of(context, rootNavigator: true).pop();
        //       //Navigator.popAndPushNamed(context, RouteName.selectHospital);
        //     }

        //     if (state is AuthLoading) {
        //       showDialog(
        //         context: context,
        //         barrierDismissible: false,
        //         builder: (_) => const EhpLoadingDialog(),
        //       );
        //     }
        //   },
        //child:
        EhpScaffold(
            pageTitle: 'Login',
            body: FormBuilder(
              key: _formKey,
              initialValue: formValues,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  EhpTextField(
                    onChanged: (_) {},
                    name: LoginFormConstant.ic,
                    placeHolder: "IC Number",
                    keyboardType: TextInputType.number,
                    validator: FormBuilderValidators.compose(
                      [
                        (val) => val!.contains('-')
                            ? "Please enter your IC number without dash '-'"
                            : null,
                        FormBuilderValidators.required(),
                      ],
                    ),
                  ),
                  EhpText(
                    "Please enter your IC number without dash '-'",
                    padding: EhpPadding.containerCenter3,
                    color: Colors.grey.shade600,
                  ),
                  EhpTextField(
                    onChanged: (_) {},
                    name: LoginFormConstant.password,
                    placeHolder: 'Password',
                    obscureText: passwordObscure,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(8),
                    ]),
                    suffixIcon: IconButton(
                      splashRadius: 1,
                      icon: Icon(
                        passwordObscure
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Theme.of(context).colorScheme.primary,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          passwordObscure = !passwordObscure;
                        });
                      },
                    ),
                  ),
                  EhpLoginSubText(
                    text: 'Forget your password? ',
                    onPressed: () => {
                      //Navigator.pushNamed(context, RouteName.forgetPass),
                    },
                  ),
                  EhpSingleButton(
                    padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                    text: 'Login',
                    onPressed: () async {
                      // if (_formKey.currentState?.saveAndValidate() ?? false) {
                      //   context.read<AuthBloc>().add(
                      //         AuthLogin(
                      //           formData: _formKey.currentState?.value ??
                      //               {
                      //                 LoginFormConstant.ic: '',
                      //                 LoginFormConstant.password: '',
                      //               },
                      //         ),
                      //       );
                      // }
                      Navigator.pushNamed(
                        context,
                        RouteName.navbar,
                        arguments: BottomNavigationArgs(selectedIndex: 0),
                      );
                    },
                  ),
                ],
              ),
            )
            //   ),
            // );
            );
  }
}
