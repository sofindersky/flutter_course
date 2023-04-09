import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherTile extends StatelessWidget {
  String location;
  String temperature;
  var today = DateFormat('EEE d MMM').format(DateTime.now());

  WeatherTile({
    super.key,
    required this.location,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 345,
        height: 255,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TimeExpression(day: "Today"),
                  Date(date: today),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Temperature(temperature: this.temperature),
                    const SizedBox(
                      width: 15,
                    ),
                    WeatherIcon(
                      icon: 'assets/images/weather_icon.png',
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
              Location(location: this.location),
            ],
          ),
        ));
  }
}

class TimeExpression extends StatelessWidget {
  String day;
  TimeExpression({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      day,
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: 'Poppins',
        fontSize: 26,
        color: Colors.white,
      ),
    );
  }
}

class Date extends StatelessWidget {
  String date;
  Date({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(date,
        style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontSize: 16));
  }
}

class Location extends StatelessWidget {
  String location;
  Location({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(
          Icons.pin_drop_outlined,
          color: Color.fromRGBO(234, 184, 69, 1),
          size: 25,
        ),
        const SizedBox(width: 10),
        Text(
          location,
          style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 16),
        )
      ],
    );
  }
}

class Temperature extends StatelessWidget {
  String temperature;
  Temperature({Key? key, required this.temperature}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: temperature.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 60),
            children: const [
          TextSpan(
              text: '°',
              style: TextStyle(
                color: Color.fromRGBO(234, 184, 69, 1),
              ))
        ]));
  }
}

class WeatherIcon extends StatelessWidget {
  String icon;
  WeatherIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.asset(
      this.icon,
      height: 100,
      width: 100,
    ));
  }
}
