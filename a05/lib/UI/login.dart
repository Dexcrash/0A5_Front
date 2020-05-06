import 'package:a05/assets/colors.dart';
import 'package:a05/blocs/login_bloc.dart';
import 'package:a05/ui_resources/Toast.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginBloc = LoginBloc();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: $secondary,
        body: Center(
            child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
                color: $secondary,
                child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // SizedBox(
                        //   height: 200.0,
                        //   child: Image.asset("assets/images/iconName.png",
                        //       fit: BoxFit.contain),
                        // ),
                        // Email Field
                        SizedBox(height: 40.0),
                        TextField(
                            controller: emailController,
                            obscureText: false,
                            // style: style,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                hintText: "Email",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(32.0)))),
                        // Password Field
                        SizedBox(height: 20.0),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          // style: style,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintText: "Contraseña",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0))),
                        ),
                        SizedBox(height: 20.0),
                        Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(30.0),
                            color: $mainColor,
                            child: MaterialButton(
                                minWidth: MediaQuery.of(context).size.width,
                                padding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                onPressed: loginPress,
                                child: Text(
                                  "Iniciar Sesión",
                                  textAlign: TextAlign.center,
                                  // style: style.copyWith)
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0),
                                ))),
                        SizedBox(height: 20.0),
                        Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(30.0),
                            color: $colorTitle,
                            child: MaterialButton(
                                minWidth: MediaQuery.of(context).size.width,
                                padding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                onPressed: signInPress,
                                child: Text(
                                  "Crear Cuenta",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.0),
                                ))),
                      ],
                    )))
          ],
        )));
  }

  loginPress() async {
    if (!await loginBloc.isConnected()) {
      Toaster.showLongToast("Error al iniciar sesión: No hay internet");
      return;
    }
    String response = await loginBloc.login(
        emailController.text.trim(), passwordController.text.trim());
        print(response);
    if (response.contains("Failed")) {
      print("wrong credentials");
      Toaster.showLongToast(
          "Error al iniciar sesión: No existe una cuenta con esos credenciales");
    } else {
      print(response);
      loginBloc.saveUserId(response);
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/home', (Route<dynamic> route) => false);
    }
  }

  signInPress() {
    print("signIn");
    Navigator.pushNamed(context, "/createAccount");
  }
}
