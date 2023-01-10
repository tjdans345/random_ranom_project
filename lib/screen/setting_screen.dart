import 'package:flutter/material.dart';
import 'package:random_number/component/number_row.dart';
import 'package:random_number/constant/color.dart';

class SettingsScreen extends StatefulWidget {

  final int maxNumber;


  const SettingsScreen({required this.maxNumber, Key? key}) : super(key: key);
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  // widget 을 사용 할 수 없는 이유는
  // State 는 StatefulWidget 이 생성되기전에 즉 State 가 StatefulWidget 에 붙기 전에
  // 미리 생성되기 때문에 widget 으로 접근할 수 없다.
  double maxNumber = 1000;

  @override
  void initState() {
    super.initState();
    maxNumber = widget.maxNumber.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Body(maxNumber: maxNumber),
              _Footer(maxNumber: maxNumber, onSliced: onSlicedChanged, onButtonPressed: onButtonPressed)
            ],
          ),
        ),
      )
    );
  }

  void onSlicedChanged (double val) {
    setState((){
      maxNumber = val;
    });
  }

  void onButtonPressed () {
    // pop 을 할 때 홈 스크린으로 데이터를 전달해줘야한다.
    // 파라미터로 전달하도록 하자
    Navigator.of(context).pop(maxNumber.toInt());
  }

}



class _Body extends StatelessWidget {
  final double maxNumber;
  const _Body({required this.maxNumber, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NumberRow(number: maxNumber.toInt()),
    );
  }
}

class _Footer extends StatelessWidget {
  final double maxNumber;
  final ValueChanged<double> onSliced;
  final VoidCallback onButtonPressed;

  const _Footer({required this.maxNumber, required this.onSliced, required this.onButtonPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
            value: maxNumber,
            min: 1000,
            max: 100000,
            onChanged: onSliced
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: redColor
            ),
            onPressed: onButtonPressed,
            child: Text("저장 ! "))
      ],
    );
  }
}
