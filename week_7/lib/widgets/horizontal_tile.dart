import 'package:flutter/material.dart';

class HorizontalTile extends StatelessWidget {
  String number;
  String measurements;
  String conditions;

  HorizontalTile(
      {Key? key,
      required this.number,
      required this.measurements,
      required this.conditions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      width: 110,
      height: 65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
              text: TextSpan(
            text: number.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 16),
            children: [
              TextSpan(
                  text: conditions,
                  style:
                      const TextStyle(color: Color.fromRGBO(234, 184, 69, 1))),
            ],
          )),
          Text(
            measurements,
            style: const TextStyle(
              height: 1,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
              fontSize: 16,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
