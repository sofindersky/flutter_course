import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:weater/models/weather_model2.dart';
import 'package:weater/services/weather_api_client.dart';
import 'package:weater/theme/theme.dart';
import 'package:weater/widgets/description_tille.dart';

import 'widgets/horizontal_tile.dart';
import 'widgets/sun_state.dart';
import 'widgets/weather_tile.dart';

void main() {
  runApp(const MyApp());
}

MyTheme myTheme = MyTheme();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      defaultThemeId: "light",
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      themes: [
        AppTheme(
            id: 'dark', data: MyTheme.darkTheme, description: 'Dark Theme'),
        AppTheme(
            id: 'light', data: MyTheme.lightTheme, description: 'Light Theme'),
      ],
      child: ThemeConsumer(
        child: Builder(builder: (themeContext) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MyHomePage(),
            theme: ThemeProvider.themeOf(themeContext).data,
          );
        }),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherApiClient client = WeatherApiClient();

  Future<WeatherModel> getData() async {
    return await client.getCurrentWeather("Kyiv");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Switch(
                value: ThemeProvider.controllerOf(context).theme.id == 'dark',
                onChanged: (v) {
                  ThemeProvider.controllerOf(context)
                      .setTheme(v ? 'dark' : 'light');
                })
          ],
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              int? temp = snapshot.data?.main?.temp?.floor();
              int? feelsLike = snapshot.data?.main?.feelsLike?.floor();
              int? sunrise = snapshot.data?.sys?.sunrise;
              int? sunset = snapshot.data?.sys?.sunset;

              DateTime? sunriseTime = sunrise != null
                  ? DateTime.fromMillisecondsSinceEpoch(sunrise * 1000)
                  : null;
              String? formattedsunriseTime = sunriseTime != null
                  ? DateFormat('hh:mm a').format(sunriseTime)
                  : null;
              String? formattedsunsetTime = sunset != null
                  ? DateFormat('hh:mm a').format(
                      DateTime.fromMillisecondsSinceEpoch(sunset * 1000))
                  : null;

              return Center(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: WeatherTile(
                            location: "${snapshot.data?.name}",
                            temperature: temp?.toString() ?? '--',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 330,
                                child: Row(
                                  children: [
                                    HorizontalTile(
                                      number: "${snapshot.data?.wind?.speed}",
                                      conditions: 'km/h',
                                      measurements: 'Wind',
                                    ),
                                    HorizontalTile(
                                      number:
                                          "${snapshot.data?.main?.humidity}",
                                      conditions: '%',
                                      measurements: 'Humidity',
                                    ),
                                    HorizontalTile(
                                      number: feelsLike?.toString() ?? '--',
                                      conditions: '°',
                                      measurements: 'Feels Like',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SunState(
                            icon: 'assets/images/sunrise.png',
                            time: formattedsunriseTime ?? '--',
                            state: "Sunrise"),
                        SunState(
                            icon: 'assets/images/sunset (1).png',
                            time: formattedsunsetTime ?? '--',
                            state: "Sunset"),
                        DescriptionWidget(
                            description:
                                "${snapshot.data?.weather?[0].description}",
                            main: "${snapshot.data?.weather?[0].main}")
                      ],
                    ),
                  ),
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
