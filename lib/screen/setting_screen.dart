import 'package:flutter/material.dart';
import 'package:random_number/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  double maxNumber = 10000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: maxNumber.toInt().toString().split("").map((e) => Image.asset(
                    "asset/img/$e.png",
                    width: 50.0,
                    height: 70.0,
                  )).toList(),
                ),
              ),
              Slider(
                  value: maxNumber,
                  min: 10000,
                  max: 1000000,
                  onChanged: (double val) {
                    setState((){
                      maxNumber = val;
                    });
                  }
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: redColor
                  ),
                  onPressed: () {
                    // pop 을 할 때 홈 스크린으로 데이터를 전달해줘야한다.
                    // 파라미터로 전달하도록 하자
                    Navigator.of(context).pop();
                  },
                  child: Text("저장 ! "))
            ],
          ),
        ),
      )
    );
  }
}
