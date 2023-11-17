import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ocean_hack/components/ehp_login_sub_text.dart';
import 'package:ocean_hack/components/ehp_scaffold.dart';
import 'package:ocean_hack/components/ehp_single_button.dart';
import 'package:ocean_hack/components/ehp_text_field.dart';
import 'package:ocean_hack/screens/auth/sign_up/constant.dart';
import 'package:ocean_hack/utils/form_utils.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool passwordObscure = true;
  bool confirmPasswordObscure = true;
  final _formKey = GlobalKey<FormBuilderState>();

  Map<String, dynamic> formValues = {
    SignUpFormConstant.name: '',
    SignUpFormConstant.email: '',
    SignUpFormConstant.password: '',
    SignUpFormConstant.confirmPassword: '',
  };

  @override
  Widget build(BuildContext context) {
    return EhpScaffold(
      pageTitle: 'Sign Up',
      body: FormBuilder(
        key: _formKey,
        initialValue: formValues,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 50,
            ),
            EhpTextField(
              onChanged: (_) {},
              name: SignUpFormConstant.name,
              placeHolder: "Name",
              validator: FormBuilderValidators.required(),
            ),
            EhpTextField(
              onChanged: (_) {},
              name: SignUpFormConstant.email,
              placeHolder: "Email",
              keyboardType: TextInputType.emailAddress,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.email(),
              ]),
            ),
            EhpTextField(
              onChanged: (_) {},
              name: SignUpFormConstant.password,
              placeHolder: 'Password',
              obscureText: passwordObscure,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.minLength(8),
              ]),
              suffixIcon: IconButton(
                splashRadius: 1,
                icon: Icon(
                  passwordObscure ? Icons.visibility_off : Icons.visibility,
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
            EhpTextField(
              onChanged: (_) {},
              name: SignUpFormConstant.confirmPassword,
              placeHolder: 'Confirm Password',
              obscureText: confirmPasswordObscure,
              suffixIcon: IconButton(
                splashRadius: 1,
                icon: Icon(
                  confirmPasswordObscure
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Theme.of(context).colorScheme.primary,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    confirmPasswordObscure = !confirmPasswordObscure;
                  });
                },
              ),
              validator: (val) {
                if (FormUtils.getValueBasedOnFieldName(
                        _formKey, SignUpFormConstant.password) !=
                    val) {
                  return "Make sure your passwords are the same";
                }
                return null;
              },
            ),
            EhpLoginSubText(
              text: 'Already have an account? ',
              onPressed: () => {
                //Navigator.pushNamed(context, RouteName.loginPage),
              },
            ),
            EhpSingleButton(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              text: 'Sign Up',
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
