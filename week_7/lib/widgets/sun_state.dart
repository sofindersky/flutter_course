import 'package:flutter/material.dart';

class SunState extends StatelessWidget {
  String icon;
  String time;
  String state;
  SunState({
    required this.icon,
    required this.time,
    required this.state,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            width: 350,
            height: 100,
            child: IntrinsicHeight(
                child: Row(
              children: [
                Column(
                  children: [
                    Image.asset(
                      this.icon,
                      height: 90,
                      width: 80,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      Text(
                        time.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                            color: Color.fromRGBO(234, 184, 69, 1),
                            fontSize: 20),
                      )
                    ],
                  ),
                )
              ],
            ))));
  }
}
