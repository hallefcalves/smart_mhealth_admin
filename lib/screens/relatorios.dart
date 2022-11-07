import 'package:flutter/material.dart';
import 'package:smart_mhealth_admin/components/appbar.dart';
import 'package:smart_mhealth_admin/components/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_mhealth_admin/components/logo.dart';
import 'package:smart_mhealth_admin/themes/color.dart';
import 'package:uuid/uuid.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../components/flutter_flow_widgets.dart';

class Relatorios extends StatelessWidget {
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 38),
    _SalesData('Apr', 32),
    _SalesData('May', 37)
  ];
  List<_CorretoAtraso> corretoAtraso = [
    _CorretoAtraso('Jan', 1),
    _CorretoAtraso('Feb', 10),
    _CorretoAtraso('Mar', 25),
    _CorretoAtraso('Apr', 16),
    _CorretoAtraso('May', 30)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarCustom(),
        endDrawer: const DrawerCustom(),
        body: Center(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(32, 30, 0, 20),
                child: Row(children: [
                  Text(
                    'Relatório Semanal',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: MyTheme.defaultTheme.primaryColor,
                    ),
                  ),
                  SizedBox(width: 55),
                  FFButtonWidget(
                    onPressed: () => {},
                    text: '+ Detalhes',
                    options: FFButtonOptions(
                      width: 90,
                      height: 30,
                      color: MyTheme.defaultTheme.backgroundColor,
                      textStyle: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          color: primaryColor),
                      borderSide: const BorderSide(
                        color: primaryColor,
                        width: 1,
                      ),
                      borderRadius: 100,
                    ),
                  )
                ]),
              ),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(32, 0, 32, 0),
                  child: Container(
                      color: Colors.white,
                      height: 250,
                      width: 320,
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        //Initialize the spark charts widget
                        child: SfSparkBarChart.custom(
                          axisCrossesAt: 10,
                          xValueMapper: (int index) => data[index].year,
                          yValueMapper: (int index) => data[index].sales,
                          dataCount: 5,
                          color: Color.fromARGB(148, 100, 193, 236),
                          firstPointColor: Color.fromRGBO(185, 223, 217, 1),
                          lastPointColor: Color.fromRGBO(255, 208, 208, 1),
                          highPointColor: Color.fromARGB(122, 89, 102, 177),
                          negativePointColor: Color.fromRGBO(255, 208, 208, 1),
                          labelDisplayMode: SparkChartLabelDisplayMode.all,
                          trackball: const SparkChartTrackball(
                              activationMode: SparkChartActivationMode.tap),
                        ),
                      ))),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(32, 30, 0, 20),
                child: Row(children: [
                  Text(
                    'Relatório Mensal',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: MyTheme.defaultTheme.primaryColor,
                    ),
                  ),
                  SizedBox(width: 55),
                  FFButtonWidget(
                    onPressed: () => {},
                    text: '+ Detalhes',
                    options: FFButtonOptions(
                      width: 90,
                      height: 30,
                      color: MyTheme.defaultTheme.backgroundColor,
                      textStyle: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          color: primaryColor),
                      borderSide: const BorderSide(
                        color: primaryColor,
                        width: 1,
                      ),
                      borderRadius: 100,
                    ),
                  )
                ]),
              ),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(32, 0, 32, 0),
                  child: Container(
                      color: Colors.white,
                      height: 250,
                      width: 320,
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        //Initialize the spark charts widget
                        child: SfSparkBarChart.custom(
                          axisCrossesAt: 10,
                          xValueMapper: (int index) => data[index].year,
                          yValueMapper: (int index) => data[index].sales,
                          dataCount: 5,
                          color: Color.fromARGB(148, 100, 193, 236),
                          firstPointColor: Color.fromRGBO(185, 223, 217, 1),
                          lastPointColor: Color.fromRGBO(255, 208, 208, 1),
                          highPointColor: Color.fromARGB(122, 89, 102, 177),
                          negativePointColor: Color.fromRGBO(255, 208, 208, 1),
                          labelDisplayMode: SparkChartLabelDisplayMode.all,
                          trackball: const SparkChartTrackball(
                              activationMode: SparkChartActivationMode.tap),
                        ),
                      ))),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(32, 30, 0, 20),
                child: Row(children: [
                  Text(
                    'Correto vs Atraso',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: MyTheme.defaultTheme.primaryColor,
                    ),
                  ),
                  SizedBox(width: 55),
                  FFButtonWidget(
                    onPressed: () => {},
                    text: '+ Detalhes',
                    options: FFButtonOptions(
                      width: 90,
                      height: 30,
                      color: MyTheme.defaultTheme.backgroundColor,
                      textStyle: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          color: primaryColor),
                      borderSide: const BorderSide(
                        color: primaryColor,
                        width: 1,
                      ),
                      borderRadius: 100,
                    ),
                  )
                ]),
              ),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(32, 0, 32, 0),
                  child: Container(
                      color: Colors.white,
                      height: 250,
                      width: 320,
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        //Initialize the spark charts widget
                        child: SfSparkLineChart.custom(
                          axisLineColor: Color.fromARGB(129, 28, 28, 29),
                          axisCrossesAt: 0,
                          xValueMapper: (int index) =>
                              corretoAtraso[index].year,
                          yValueMapper: (int index) =>
                              corretoAtraso[index].time,
                          dataCount: 5,
                          color: Color.fromARGB(148, 100, 193, 236),
                          firstPointColor: Color.fromRGBO(185, 223, 217, 1),
                          lastPointColor: Color.fromRGBO(255, 208, 208, 1),
                          highPointColor: Color.fromARGB(122, 89, 102, 177),
                          negativePointColor: Color.fromRGBO(255, 208, 208, 1),
                          labelDisplayMode: SparkChartLabelDisplayMode.all,
                          trackball: const SparkChartTrackball(
                              activationMode: SparkChartActivationMode.tap),
                        ),
                      ))),
            ],
          ),
        ));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class _CorretoAtraso {
  _CorretoAtraso(this.year, this.time);

  final String year;
  final double time;
}
