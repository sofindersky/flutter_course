import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  String main;
  String description;
  String icon = 'assets/images/weather_icon.png';
  DescriptionWidget({Key? key, required this.description, required this.main})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        height: 200,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(
              main,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Text(
              description.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Image.asset(
              this.icon,
              height: 110,
              width: 110,
            )
          ]),
        ));
  }
}
