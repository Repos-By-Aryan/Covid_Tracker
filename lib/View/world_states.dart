import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/services.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen> with TickerProviderStateMixin {
  late final AnimationController _controller =
  AnimationController(duration: const Duration(seconds: 3), vsync: this)..repeat();
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    super.initState();
    _controller.dispose();
  }

  final colorList =<Color> [
    const Color (0xff4285F4),
    const Color(0xff1aa260) ,
    const Color(0xffde5246) ,
  ];
  @override
  Widget build(BuildContext context) {
   final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: screenHeight*0.05,),
            PieChart(
              animationDuration: const Duration(milliseconds: 1200),
              chartRadius: screenWidth/3,
              colorList: colorList,
                legendOptions: const LegendOptions(
                  legendPosition: LegendPosition.left
                ),
                chartType: ChartType.ring,
                dataMap: const {
              "Total":30,
              "Recovered":25,
              "Deaths":5,
            }),
            Padding(
              padding: EdgeInsets.symmetric(vertical:screenHeight*0.06),
              child: const Card(
                child: Column(
                  children: [
                    ReusableRow(value: "200", title:"Total" ),
                    ReusableRow(value: "200", title:"Total" ),
                    ReusableRow(value: "200", title:"Total" ),
                  ],
                ),
              ),
            ),
            Container(
              height:50,
              decoration:BoxDecoration(
                color: const Color(0xff1aa260),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(child: Text("Track Countries")),
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title,value;
  const ReusableRow({super.key,required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
