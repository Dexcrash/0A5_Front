import 'package:a05/assets/colors.dart';
import 'package:a05/blocs/createAccount_block.dart';
import 'package:a05/services/repository.dart';
import 'package:a05/ui_resources/Toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class AddKidView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddKidViewState();
  }
}

class AddKidViewState extends State<AddKidView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final pesoController = TextEditingController();
  final dateController = TextEditingController();
  final nameController = TextEditingController();
  final repo = Repository.getInstance();

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
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Agrega un bebé'),
          backgroundColor: $scaffoldBackground,
        ),
        body: Center(
            child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height*0.9,
                color: Colors.white,
                child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Name
                        SizedBox(height: 20.0),
                        TextField(
                            controller: nameController,
                            obscureText: false,
                            // style: style,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                hintText: "Nombre/Apodo",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(32.0)))),
                        // Peso
                        SizedBox(height: 20.0),
                        TextField(
                            controller: pesoController,
                            obscureText: false,
                            // style: style,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                hintText: "Peso actual en Kg",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(32.0)))),
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
                                    borderRadius:
                                        BorderRadius.circular(32.0)))),
                        // Sign In Button
                        SizedBox(height: 20.0),
                        Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(30.0),
                            color: $mainColor,
                            child: MaterialButton(
                                minWidth: MediaQuery.of(context).size.width,
                                padding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                onPressed: () => signInPress(),
                                child: Text(
                                  "Agregar Bebé",
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
        firstDate: DateTime(2000, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        String dateOfBirthStr = DateFormat('dd-MM-yyyy').format(selectedDate);
        dateController.text = dateOfBirthStr;
      });
  }

  signInPress() async {
    print("Agregar Nino pressed");
    if (!await repo.isConnected()) {
      Fluttertoast.showToast(
          msg: "No hay internet!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          fontSize: 30.0);
      return;
    }
    print("sign in");
    var nickname = nameController.text.trim();
    var date = dateController.text.trim();
    double peso = 0;
    try {
      peso = double.parse(pesoController.text.trim());
    } catch (Exception) {
      Toaster.showLongToast("Por favor ingrese un peso en numeros. Ej 10.2");
      return;
    }
    if (nickname == '' || date == '') {
      Toaster.showLongToast("Please Fill all fields!");
      return;
    }

    String response = await repo.addKid(nickname, date, peso);
    if (response.contains("Failed")) {
      Toaster.showLongToast("Sign In Error: Unexpected error :<");
      return;
    }
    Toaster.showLongToast("El niño fue agregado!");
    print(response);
    Navigator.pushNamedAndRemoveUntil(
        context, '/profile', (Route<dynamic> route) => false);
  }
}
