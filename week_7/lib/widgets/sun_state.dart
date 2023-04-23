import 'package:flutter/material.dart';

class SunState extends StatefulWidget {
  final String icon;
  final String time;
  final String state;

  SunState({
    required this.icon,
    required this.time,
    required this.state,
    Key? key,
  }) : super(key: key);

  @override
  _SunStateState createState() => _SunStateState();
}

class _SunStateState extends State<SunState>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _colorAnimation = ColorTween(
      begin: Theme.of(context).primaryColor,
      end: Color.fromRGBO(217, 197, 238, 1.0),
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTap() {
    setState(() {
      _colorAnimation = ColorTween(
        begin: Theme.of(context).primaryColor,
        end: const Color.fromRGBO(228, 197, 238, 1.0),
      ).animate(_animationController);
    });

    if (_animationController.status == AnimationStatus.completed) {
      _animationController.reverse();
    } else if (_animationController.status == AnimationStatus.dismissed) {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: AnimatedBuilder(
          animation: _colorAnimation,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                color: _colorAnimation.value ?? Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              width: 350,
              height: 100,
              child: child,
            );
          },
          child: IntrinsicHeight(
            child: Row(
              children: [
                Column(
                  children: [
                    Image.asset(
                      widget.icon,
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
                      Text(widget.state,
                          style: Theme.of(context).textTheme.headline2),
                      Text(
                        widget.time.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins',
                          color: Color.fromRGBO(234, 184, 69, 1),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
