import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/http_exception.dart';
import '../shared/dialog_utils.dart';
import 'auth_manager.dart';
enum AuthMode { signup, login }

class AuthCard extends StatefulWidget {
  const AuthCard({
    super.key,
  });
  @override
  State<AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.login;
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  final _isSubmitting = ValueNotifier<bool>(false);
  final _passwordController = TextEditingController();

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    _isSubmitting.value = true;
    try {
      if (_authMode == AuthMode.login) {
        // đăng nhập
        await context.read<AuthManager>().login(
              _authData['email']!,
              _authData['password']!,
            );
      } else {
        // Sign user up
        await context.read<AuthManager>().signup(
              _authData['email']!,
              _authData['password']!,
            );
      }
    } catch (error) {
      showErrorDialog(
          context,
          (error is HttpException)
              ? error.toString()
              : 'Authentication failed');
    }
    _isSubmitting.value = false;
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.login) {
      setState(() {
        _authMode = AuthMode.signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.login;
      });
    }
  }

  @override
  //giao diện đăng nhập, đăng ký
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      height: _authMode == AuthMode.signup ? 500 : 400,
      constraints: BoxConstraints(minHeight: _authMode == AuthMode.signup ?500 : 400),
      width: deviceSize.width * 0.75,
      //form
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //logo
              Image.network('https://dulichchat.com/wp-content/uploads/2019/02/logo-3-cho-web.png'),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),

              Text('Hello!! \nWelcome Back', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF82CD47)),),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
              _buildEmailField(),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
              _buildPasswordField(),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
              if (_authMode == AuthMode.signup) _buildPasswordConfirmField(),
              const SizedBox(
                height: 20,
              ),
              ValueListenableBuilder<bool>(
                valueListenable: _isSubmitting,
                builder: (context, isSubmitting, child) {
                  if (isSubmitting) {
                    //Một chỉ báo tiến trình vòng tròn Material Design, quay để cho biết rằng ứng dụng đang bận.
                    return const CircularProgressIndicator();
                  }
                  return _buildSubmitButton();
                },
              ),
              _buildAuthModeSwitchButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAuthModeSwitchButton() {
    return TextButton(
      onPressed: _switchAuthMode,
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
      ),
      child:
        Text('${_authMode == AuthMode.login ? 'SIGNUP' : 'LOGIN'} INSTEAD'),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: _submit,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
        textStyle: TextStyle(
          color: Theme.of(context).primaryTextTheme.headline6?.color,
        ),
      ),
      child: Text(_authMode == AuthMode.login ? 'LOGIN' : 'SIGN UP'),
    );
  }

  Widget _buildPasswordConfirmField() {
    return TextFormField(
      enabled: _authMode == AuthMode.signup,
      decoration: const InputDecoration(labelText: 'Confirm Password'),
      obscureText: true,
      validator: _authMode == AuthMode.signup
          ? (value) {
              if (value != _passwordController.text) {
                return 'Passwords do not match!';
              }
              return null;
            }
          : null,
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Password'),
      obscureText: true,
      controller: _passwordController,
      validator: (value) {
        if (value == null || value.length < 5) {
          return 'Password is too short!';
        }
        return null;
      },
      onSaved: (value) {
        _authData['password'] = value!;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'E-Mail'),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty || !value.contains('@')) {
          return 'Invalid email!';
        }
        return null;
      },
      onSaved: (value) {
        _authData['email'] = value!;
      },
    );
  }
}
