import 'package:flutter/material.dart';

class AnimatedToggleButton extends StatefulWidget {
  final Function changeState;
  bool boolValue;
  Widget buttonOn;
  Widget buttonOff;

  AnimatedToggleButton({this.changeState, this.boolValue,this.buttonOn,this.buttonOff});

  @override
  _AnimatedToggleButtonState createState() => _AnimatedToggleButtonState();
}

class _AnimatedToggleButtonState extends State<AnimatedToggleButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.changeState();
          widget.boolValue = !widget.boolValue;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          color: widget.boolValue ? Colors.greenAccent[100] : Colors.grey[400],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: Duration(milliseconds: 1000),
              curve: Curves.easeIn,
              top: 5.0,
              left: widget.boolValue ? 63 : 0,
              right: widget.boolValue ? 0 : 63,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 1000),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    child: child,
                    turns: animation,
                  );
                },
                child: widget.boolValue
                    ? widget.buttonOn
                    : widget.buttonOff
              ),
            )
          ],
        ),
      ),
    );
  }
}
