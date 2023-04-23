import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String pressureIcon;
  final String visibilityIcon;
  final String max;
  final String min;
  final String pressure;

  final String maxTemperature;
  final String minTemperature;
  final String visibilityValue;
  final String pressureValue;
  bool showMood = false;

  Details({
    Key? key,
    String? pressureIcon,
    String? seaLevelIcon,
    String? max,
    String? min,
    String? pressure,
    bool? showMood,
    required this.maxTemperature,
    required this.minTemperature,
    required this.pressureValue,
    required this.visibilityValue,
  })  : pressureIcon = pressureIcon ?? 'assets/images/barometer-.png',
        visibilityIcon = seaLevelIcon ?? 'assets/images/eye.png',
        max = max ?? 'Max temp: ',
        min = min ?? 'Min temp: ',
        pressure = pressure ?? 'Pressure: ',
        showMood = showMood ?? false,
        super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    var happy = 'assets/images/happiness.png';
    var sad = 'assets/images/sad.png';

    return Scaffold(
        appBar: AppBar(title: const Text('Details')),
        body: Center(
            child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          width: 375,
          height: 635,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DetailsRow(
                    icon: 'assets/images/cold.png',
                    text: 'Min temp: ',
                    value: this.widget.minTemperature),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DetailsRow(
                    icon: 'assets/images/hot.png',
                    text: 'Max temp: ',
                    value: this.widget.maxTemperature),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DetailsRow(
                    icon: 'assets/images/barometer-.png',
                    text: 'Pressure: ',
                    value: this.widget.pressureValue),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DetailsRow(
                    icon: 'assets/images/eye.png',
                    text: 'Visibility: ',
                    value: this.widget.visibilityValue),
              ),
              widget.showMood
                  ? Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                              onTap: () => Navigator.pop(context, true),
                              child: Image.asset(happy, height: 90, width: 80)),
                          GestureDetector(
                              onTap: () => Navigator.pop(context, false),
                              child: Image.asset(sad, height: 90, width: 80))
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        )));
  }
}

class DetailsArguments {
  final String maxTemperature;
  final String minTemperature;
  final String visibilityValue;
  final String pressureValue;

  DetailsArguments({
    required this.maxTemperature,
    required this.minTemperature,
    required this.visibilityValue,
    required this.pressureValue,
  });
}

class DetailsRow extends StatefulWidget {
  final String icon;
  final String text;
  final String value;

  DetailsRow(
      {Key? key, required this.icon, required this.text, required this.value})
      : super(key: key);

  @override
  _DetailsRowState createState() => _DetailsRowState();
}

class _DetailsRowState extends State<DetailsRow>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fontSizeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _fontSizeAnimation = Tween<double>(begin: 18, end: 24).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.easeInOutBack),
    );
  }

  void _onTap() {
    if (_animationController.status == AnimationStatus.completed) {
      _animationController.reverse();
    } else if (_animationController.status == AnimationStatus.dismissed) {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: _onTap,
                child: RotationTransition(
                  turns: _animationController,
                  child: Image.asset(widget.icon, height: 90, width: 80),
                ),
              ),
            ],
          ),
          Expanded(
            flex: 2,
            child: Padding(
                padding: EdgeInsets.all(16.0),
                child: AnimatedBuilder(
                    animation: _fontSizeAnimation,
                    builder: (context, child) {
                      return Text(
                        widget.text,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: _fontSizeAnimation.value),
                      );
                    })),
          ),
          const SizedBox(
            width: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.value,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 30),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
