import 'package:custom_radio/custom_radio.dart';
import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {



  String radioValue = 'First';

  @override
  State<RadioButton> createState() => _RadioButtonState();

}

class _RadioButtonState extends State<RadioButton> with SingleTickerProviderStateMixin {

  _RadioButtonState() {
    customBuilder = (BuildContext context, List<dynamic> animValues, Function updateState, String value) {
      return GestureDetector(
        onTap: () {
          setState(() {
            widget.radioValue = value;
          });
        },
        child: Container(
          width: double.infinity,
          height: animValues[0] * 40 + 60,
          color: animValues[1],
          child: Center(
              child: Text(
                  value
              )
          ),
        ),
      );
    };
    simpleBuilder = (BuildContext context, List<double> animValues, Function updateState, String value) {
      final alpha = (animValues[0] * 255).toInt();
      return GestureDetector(
          onTap:  () {
            setState(() {
              widget.radioValue = value;
            });
          },
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              height: 50,
                width: 120,
                padding: EdgeInsets.all(0.0),
                margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Theme.of(context).primaryColor.withAlpha(alpha),

                ),
                child: Text(
                  value,
                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                  fontSize: 16),
                )
            ),
          )
      );
    };
    dynamicBuilder = (BuildContext context, List<dynamic> animValues, Function updateState, String value) {
      return GestureDetector(
          onTap: () {
            setState(() {
              widget.radioValue = value;
            });
          },
          child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 12.0),
              padding: EdgeInsets.all(32.0 + animValues[0] * 12.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: animValues[1],
                  border: Border.all(
                      color: animValues[2],
                      width: 2.0
                  )
              ),
              child: Text(
                value,
                style: Theme.of(context).textTheme.body1.copyWith(
                    fontSize: 20.0,
                    color: animValues[2]
                ),
              )
          )
      );
    };
  }

  RadioBuilder<String, dynamic> customBuilder;
  RadioBuilder<String, double> simpleBuilder;
  RadioBuilder<String, dynamic> dynamicBuilder;

  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 100),
        vsync: this
    );
    _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.ease
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomRadio<String, double>(
                  value: 'First',
                  groupValue: widget.radioValue,
                  duration: Duration(milliseconds: 200),
                  animsBuilder: (AnimationController controller) => [
                    CurvedAnimation(
                        parent: controller,
                        curve: Curves.easeInOut
                    )
                  ],
                  builder: simpleBuilder
              ),
              CustomRadio<String, double>(
                  value: 'Second',
                  groupValue: widget.radioValue,
                  duration: Duration(milliseconds: 500),
                  animsBuilder: (AnimationController controller) => [
                    CurvedAnimation(
                        parent: controller,
                        curve: Curves.easeInOut
                    )
                  ],
                  builder: simpleBuilder
              ),
              CustomRadio<String, double>(
                  value: 'Third',
                  groupValue: widget.radioValue,
                  duration: Duration(milliseconds: 500),
                  animsBuilder: (AnimationController controller) => [
                    CurvedAnimation(
                        parent: controller,
                        curve: Curves.easeInOut
                    )
                  ],
                  builder: simpleBuilder
              ),
            ],
          ),
          Divider(),
          Divider(),
        ],
      );

  }

}
