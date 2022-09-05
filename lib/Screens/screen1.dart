import 'package:flutter/material.dart';
import 'package:paprclip/Const.dart';
import 'package:flutter/cupertino.dart';
import 'package:paprclip/widgets.dart';

class Overview extends StatefulWidget {

  Overview(this.info, this.infosecond);

  late final info;
  late final infosecond;

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {


  // data members for the overview
  late int id;
  late String sector;
  late String industry;
  late double market_cap;
  late var enter_value;
  late double share;
  late double pe;
  late double pedRatio;
  late double Yield;

  // data members for the performance

  late double oneday;
  late double oneweek;
  late double onemonth;
  late double sixmonth;
  late double oneyear;
  late double twoyear;
  late double fiveyear;
  late double tenyear;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    assignDetails(widget.info);
    assignDetails2(widget.infosecond);

  }


  void assignDetails (dynamic data)  async {


    id = data['ID'];
    print(id.toString());
    sector = data['SectorSlug'];
    print(sector);
    industry = data['IndustrySlug'];

    market_cap = data['MCAP'] / 10000000;
    String mark = market_cap.toStringAsFixed(2);
    market_cap = double.parse(mark);


    share = data['BookNavPerShare'];
    String sh = share.toStringAsFixed(2);
    share = double.parse(sh);

    pe = data['TTMPE'];
    pedRatio = data['PEGRatio'];
    String peg = pedRatio.toStringAsFixed(2);
    pedRatio = double.parse(peg);

    Yield =data['Yield'];
    String yld = Yield.toStringAsFixed(2);
    Yield = double.parse(yld);


    enter_value = data['EV'];
    if(enter_value == null) {
      enter_value = ' - ';
    } else {
      String entr = enter_value.toStringAsFixed(2);
      enter_value = double.parse(entr);
    }


  }

  void assignDetails2 (dynamic data) async {

    oneday = data[0]['ChangePercent'];
    String inString = oneday.toStringAsFixed(2);
    oneday = double.parse(inString);

    oneweek = data[1]['ChangePercent'];
    String oneweekstr = oneweek.toStringAsFixed(2);
    oneweek = double.parse(oneweekstr);

    onemonth = data[2]['ChangePercent'];
    String onemonthstr = onemonth.toStringAsFixed(2);
    onemonth = double.parse(onemonthstr);

    sixmonth = data[3]['ChangePercent'];
    String sixmonthstr = sixmonth.toStringAsFixed(2);
    sixmonth = double.parse(sixmonthstr);

    oneyear = data[4]['ChangePercent'];
    String oneyearstr = oneyear.toStringAsFixed(2);
    oneyear = double.parse(oneyearstr);

    twoyear = data[5]['ChangePercent'];
    String twoyearstr = twoyear.toStringAsFixed(2);
    twoyear = double.parse(twoyearstr);

    fiveyear = data[6]['ChangePercent'];
    String fiveyearstr = fiveyear.toStringAsFixed(2);
    fiveyear = double.parse(fiveyearstr);

    tenyear = data[7]['ChangePercent'];
    String tenyearstr = tenyear.toStringAsFixed(2);
    tenyear = double.parse(tenyearstr);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25),
      color: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Overview', style: kover,
              ),
              Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$sector',
                    style: kdesc,
                  ),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontSize: 17,
                      ),
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.food_bank, color: CupertinoColors.systemYellow,),
                        ),

                        TextSpan(
                          text: ' Banking',
                          style: kdesc
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Industry',
                    style: kdesc,
                  ),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontSize: 17,
                      ),
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.food_bank, color: CupertinoColors.systemYellow,),
                        ),

                        TextSpan(
                            text: ' $industry',
                            style: kdesc
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Market-Cap',
                    style: kdesc,
                  ),
                  Text(
                    '$market_cap Cr',
                    style: kdesc,
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Enterprise-Value(EV)',
                    style: kdesc,
                  ),
                  Text(
                    '$enter_value',
                    style: kdesc,
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bool value / Share',
                    style: kdesc,
                  ),
                  Text(
                    '$share',
                    style: kdesc,
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price Earning Ratio (PE)',
                    style: kdesc,
                  ),
                  Text(
                    '20.43',
                    style: kdesc,
                  )
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'PED ratio',
                    style: kdesc,
                  ),
                  Text(
                    '$pedRatio',
                    style: kdesc,
                  )
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dividend-Yield',
                    style: kdesc,
                  ),
                  Text(
                    '$Yield',
                    style: kdesc,
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Performance',
                style: kover,
              ),
              Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              helperwidgetperformance(oneday,'1 Day'),
              SizedBox(
                height: 14,
              ),
              helperwidgetperformance(oneweek, '1 week'),
              SizedBox(
                height: 14,
              ),
              helperwidgetperformance(onemonth, '1 month'),
              SizedBox(
                height: 14,
              ),
              helperwidgetperformance(sixmonth,'6 months'),
              SizedBox(
                height: 14,
              ),
              /// this has to change
              helperwidgetperformance(oneyear,'1 year'),
              SizedBox(
                height: 14,
              ),
              helperwidgetperformance(twoyear,'2 year'),
              SizedBox(
                height: 14,
              ),
              helperwidgetperformance(fiveyear, '5 year'),
              SizedBox(
                height: 14,
              ),
              helperwidgetperformance(tenyear, '10 year'),
              SizedBox(
                height: 14,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

