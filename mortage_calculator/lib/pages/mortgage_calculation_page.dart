import 'package:flutter/material.dart';
import 'package:mortage_calculator/pages/monthly_payments_page.dart';

import '../helpers/custom_colors.dart';

class MortgageCalculationPage extends StatelessWidget {
  const MortgageCalculationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigation to the new page
    // void navigateToPaymentPage() {
    //   Navigator.push(context,
    //       MaterialPageRoute(builder: (context) => const MonthlyPaymentsPage()));
    // }

    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23.0),
        child: Column(children: const [
          // Build Header
          Align(
            alignment: Alignment.center,
            child: Header(
              title1: "Calculate",
              title2: "Mortgage",
              fontColor: Colors.black,
            ),
          ),
          // Build CUstom TextField
          TextFieldWithSlider(
            labelTitle: "Home Price",
            prefixTitle: "\$",
            suffixTitle: "",
          ),
          SizedBox(
            height: 20,
          ),
          TextFieldWithSlider(
            labelTitle: "Down Payment",
            prefixTitle: "\$",
            suffixTitle: "12.31%",
          ),

          SizedBox(
            height: 20,
          ),

          // Build Loan Length
          LoanLength(),
          TextFieldWithSlider(
            labelTitle: "Interest Rate",
            prefixTitle: "",
            suffixTitle: "%",
          ),
          Spacer(),
          BottomButton(buttonText: "Calculate"),
          SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: const Icon(
        Icons.short_text,
        size: 33,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }
}

class Header extends StatelessWidget {
  final String title1;
  final String title2;
  final Color fontColor;

  const Header(
      {super.key,
      required this.title1,
      required this.title2,
      required this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title1,
          style: TextStyle(
              color: fontColor, fontSize: 35, fontWeight: FontWeight.bold),
        ),
        Text(
          title2,
          style: TextStyle(
              color: fontColor, fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class TextFieldWithSlider extends StatelessWidget {
  final labelTitle;
  final String prefixTitle;
  final String suffixTitle;

  const TextFieldWithSlider(
      {super.key,
      this.labelTitle,
      required this.prefixTitle,
      required this.suffixTitle});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    labelTitle,
                    style: const TextStyle(color: Colors.grey),
                  ),
                )),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      prefixTitle,
                      style: const TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      suffixTitle,
                      style: const TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0))),
            )
          ],
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: SizedBox(
            height: 5.0,
            child: Slider(
              value: 15.0,
              max: 100.0,
              min: 0,
              divisions: 5,
              activeColor: CustomColors.lightPurple,
              inactiveColor: CustomColors.lightPurple,
              onChanged: (double newValue) {},
            ),
          ),
        )
      ],
    );
  }
}

class LoanLength extends StatefulWidget {
  const LoanLength({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoanLengthState createState() => _LoanLengthState();
}

class _LoanLengthState extends State<LoanLength> {
  int selectedLoan = 0;
  @override
  Widget build(BuildContext context) {
    var loanYears = {30, 20, 15, 10};
    return SizedBox(
      height: 90,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Length of Loan",
                style: TextStyle(
                  color: Colors.grey,
                )),
            Text("Years",
                style: TextStyle(
                  color: Colors.grey,
                )),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: loanYears.map((e) => loanButton(e)).toList(),
        )
      ]),
    );
  }

  Widget loanButton(int numOfYears) {
    var isSelected = numOfYears == selectedLoan ? true : false;
    return InkWell(
      onTap: () {
        setState(() {
          selectedLoan = numOfYears;
        });
      },
      child: Container(
        height: 40,
        width: 78,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:
                isSelected ? CustomColors.lightPurple : CustomColors.grayColor),
        child: Text(
          numOfYears.toString(),
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? buttonPressed;

  const BottomButton({super.key, required this.buttonText, this.buttonPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 350,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(CustomColors.darkPurple),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const MonthlyPaymentsPage()),
          )
        },
      ),
    );
  }
}
