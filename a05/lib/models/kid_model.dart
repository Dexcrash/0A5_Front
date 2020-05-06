import 'package:intl/intl.dart';

class Kid {
  String nickname;
  double pesoActual;
  DateTime fechaNacimiento;
  int meses;
  int edad;

  Kid({
    this.nickname,
    this.edad,
    this.fechaNacimiento,
    this.meses,
    this.pesoActual,
  });

  static Kid fromMap(Map json) {
    String nickname = json['nickname'];
    DateFormat format = DateFormat("dd-MM-yyyy");
    DateTime fechaNacimiento = format.parse(json['fecha_nacimiento']);
    int edad = calculateAge(fechaNacimiento);
    int meses = calculateMonths(fechaNacimiento);
    double pesoActual = json['peso_actual'];
    return Kid(
      edad: edad,
      fechaNacimiento: fechaNacimiento,
      meses: meses,
      nickname: nickname,
      pesoActual: pesoActual,
    );
  }

  static calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  static int calculateMonths(DateTime birthDate) {
    // DateTime currentDate = DateTime.now();
    // int age = currentDate.year - birthDate.year;
    // int month1 = currentDate.month;
    // int month2 = birthDate.month;
    // int months = 0;
    // if (month2 > month1) {
    //   age--;
    //   months = 12 - month2 - month1;
    // } else if (month1 == month2) {
    //   int day1 = currentDate.day;
    //   int day2 = birthDate.day;
    //   months = month2 - month1;
    //   if (day2 > day1) {
    //     age--;
    //   }
    // }
    // return age * 12 + (months);
    final date2 = DateTime.now();
    final difference = date2.difference(birthDate).inDays/30;
    print(date2.difference(birthDate).inDays);
    print(birthDate);
    return difference.round();
  }
}
