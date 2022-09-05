import 'package:flutter/material.dart';
import 'package:paprclip/Const.dart';
import 'package:flutter/cupertino.dart';
import 'package:percent_indicator/percent_indicator.dart';


class helperwidgetperformance extends StatefulWidget {
  helperwidgetperformance(this.year, this.str);
  final double year;
  final String str;

  @override
  State<helperwidgetperformance> createState() => _helperwidgetperformanceState();
}

class _helperwidgetperformanceState extends State<helperwidgetperformance> {

  late IconData icon ;
  late Color color ;
  late double setbar;


  @override
  void initState() {
    super.initState();
    set();
    setBar();
  }
  void set() {

    if(widget.year < 0) {
      icon = Icons.arrow_downward;
    } else {
      icon = Icons.arrow_upward;
    }

    if(widget.year < 0) {
      color = Colors.red;
    } else {
      color = Colors.green;
    }
  }

  void setBar() {
    if(widget.year < 0) {
      setbar = 0;
      return;
    }
    if(widget.year / 100 > 1) {
      setbar = 1;
    } else {
      setbar = widget.year.toDouble() / 100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        new LinearPercentIndicator(
          width: 140.0,
          lineHeight: 17.0,
          percent: setbar,
          barRadius: Radius.circular(10),
          backgroundColor: Colors.grey[200],
          progressColor: Colors.green,
        ),
        Text(
          '${widget.str}',
          style: kdesc,
        ),
        Text.rich(
          TextSpan(
            style: TextStyle(
              fontSize: 17,
            ),
            children: [
              WidgetSpan(
                child: Icon(icon, color: color),
              ),
              TextSpan(
                  text: ' ${widget.year}%',
                  style: kdesc
              ),
            ],
          ),
        )
      ],
    );

  }
}


