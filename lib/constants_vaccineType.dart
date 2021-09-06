import 'package:flutter/material.dart';


class VaccineImageFront extends StatelessWidget {
  late String i;
  VaccineImageFront({required this.i});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      padding: EdgeInsets.all(20),
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(i),
        ),
      ),
    );
  }
}

class VaccineTypeButton extends StatelessWidget {
  late String nameVaccine;
  late String theory;
  late VoidCallback onPress;

  VaccineTypeButton(
      {required this.onPress, required this.theory, required this.nameVaccine});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                nameVaccine,
                style: TextStyle(
                  color: Color(0xFF0D47A1),
                  fontSize: 50,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                theory,
                style: TextStyle(
                  color: Color(0xFF0D47A1),
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 6,
              blurRadius: 15,
              offset: Offset(0, 3),
            )
          ],
          color: Color(0xFF80D8FF),
          borderRadius: BorderRadius.circular(25.0),
        ),
        height: 300,
        width: double.infinity,
        margin: EdgeInsets.all(30),
      ),
    );
  }
}

