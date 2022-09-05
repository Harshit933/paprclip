import 'package:flutter/material.dart';
import 'package:paprclip/Brain.dart';
import 'package:paprclip/Const.dart';
import 'package:paprclip/Screens/screen1.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
  }
  Future getDetails () async {
    Networking net = Networking('https://api.stockedge.com/Api/SecurityDashboardApi/GetCompanyEquityInfoForSecurity/5051?l');
    var data = await net.getData();
    Networking net2 = Networking('https://api.stockedge.com/Api/SecurityDashboardApi/GetTechnicalPerformanceBenchmarkForSecurity/5051?lang=en');
    var datasecond = await net2.getData();
    Duration duration = Duration(seconds: 10);
    Future.delayed(duration);
    Navigator.push(this.context, MaterialPageRoute(builder: (context){
      return Overview(data, datasecond);
    }));

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Center(
        child: Text(
          'B A N K I N G',
          style: kover,
        ),
      ),
    );
  }
}
