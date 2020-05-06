import 'package:a05/assets/colors.dart';
import 'package:a05/blocs/createAccount_block.dart';
import 'package:a05/ui_resources/Toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class CreateAccount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreateAccountState();
  }
}

class CreateAccountState extends State<CreateAccount> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final dateController = TextEditingController();

  final bloc = CreateAccountBloc();

  String genderValue = "Género";
  DateTime selectedDate = DateTime.now();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(
            color: Colors.white,
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
                                borderRadius: BorderRadius.circular(32.0)))),
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
                    // Name
                    SizedBox(height: 20.0),
                    TextField(
                        controller: nameController,
                        obscureText: false,
                        // style: style,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            hintText: "Nombre",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0)))),
                    // Phone
                    // SizedBox(height: 20.0),
                    // TextField(
                    //     controller: phoneController,
                    //     obscureText: false,
                    //     decoration: InputDecoration(
                    //         contentPadding:
                    //             EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    //         hintText: "Teléfono",
                    //         border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(32.0)))),
                    //Date Selector
                    SizedBox(height: 20.0),
                    TextField(
                        readOnly: true,
                        controller: dateController,
                        obscureText: false,
                        onTap: () => _selectDate(context),
                        // style: style,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            hintText: "Fecha de Nacimiento",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0)))),
                    //Gender Selector
                    SizedBox(height: 20.0),
                    dropDownGender(context),
                    // Sign In Button
                    SizedBox(height: 20.0),
                    Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(30.0),
                        color: $colorTitle,
                        child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            padding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            onPressed: () => signInPress(),
                            child: Text(
                              "Create Account",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            ))),
                  ],
                )))
      ],
    )));
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1970, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        String dateOfBirthStr = DateFormat('dd/MM/yyyy').format(selectedDate);
        dateController.text = dateOfBirthStr;
      });
  }

  Widget dropDownGender(BuildContext context) {
    return Material(
      elevation: 5.0,
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: DropdownButton<String>(
          value: genderValue,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Color(0xFFF7CE3E)),
          underline: Container(
            height: 2,
          ),
          onChanged: (String newValue) {
            setState(() {
              genderValue = newValue;
            });
          },
          items: <String>[
            'Género',
            'Hombre',
            'Mujer',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: TextStyle(color: Color(0xFF0A1612))),
            );
          }).toList(),
        ),
      ),
    );
  }

  signInPress() async {
    print("Sign In Pressed");
    if (!await bloc.isConnected()) {
      Fluttertoast.showToast(
          msg: "No hay internet!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          fontSize: 30.0);
      return;
    }
    print("sign in");
    var gender = genderValue;
    var name = nameController.text.trim();
    var email = emailController.text.trim();
    var date = dateController.text.trim();
    var pass = passwordController.text;
    var phone = "nel";
    print("Phone: '" + phone + "'");
    if (gender == "Género" ||
        name == "" ||
        email == "" ||
        date == "" ||
        pass == "" ||
        phone == "") {
      Toaster.showLongToast("Please Fill all fields!");
      return;
    }
    String response = await bloc.signIn(email, pass, name, phone, date, gender);
    if (response.contains("422")) {
      Toaster.showLongToast(
          "Sign In Error: There's already an account with that E-Mail!");
      return;
    } else if (response.contains("Failed")) {
      Toaster.showLongToast("Sign In Error: Unexpected error :<");
      return;
    }
    Toaster.showLongToast("Accound Created, now Log In!");
    print(response);
    Navigator.pushNamed(context, '/login');
  }
}
