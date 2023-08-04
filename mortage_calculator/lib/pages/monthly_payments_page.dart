import 'package:flutter/material.dart';
import 'package:mortage_calculator/helpers/custom_colors.dart';
import 'package:mortage_calculator/pages/mortgage_calculation_page.dart';

class MonthlyPaymentsPage extends StatelessWidget {
  const MonthlyPaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: CustomColors.darkPurple,
      body: Column(children: const [
        Align(
          alignment: Alignment.center,
          child: Header(
            title1: "Monthly",
            title2: "Payments",
            fontColor: Colors.white,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        // Build CUstom Circle progress bar
      ]),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }
}
