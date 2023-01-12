import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number/component/number_row.dart';
import 'package:random_number/constant/color.dart';
import 'package:random_number/screen/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> randomNumbers = [123, 456, 789];
  int maxNumber = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(onPressed: onSettingsPop),
              _Body(
                randomNumbers: randomNumbers,
              ),
              _Footer(buttonPressed: onRandomNumberGenerate)
            ],
          ),
        ),
      ),
    );
  }

  void onSettingsPop() async {
    final result = await Navigator.of(context)
        .push<int>(MaterialPageRoute(builder: (BuildContext context) {
      return SettingsScreen(
        maxNumber: maxNumber,
      );
    }));

    if (result != null) {
      setState(() {
        maxNumber = result;
      });
    }
  }

  /// 랜덤 난수 생성 함수
  void onRandomNumberGenerate() {
    final rand = Random();
    final Set<int> newNumbers = {};
    while (newNumbers.length != 3) {
      newNumbers.add(rand.nextInt(maxNumber));
    }
    setState(() {
      randomNumbers = newNumbers.toList();
    });
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onPressed;

  const _Header({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "랜덤숫자 생성기",
          style: TextStyle(
              color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.w700),
        ),
        IconButton(
            // async 로 페이지 데이터를 전달 받는다.
            onPressed: onPressed,
            // const 를 사용하면 위젯 인스턴스를 처음 한 번 생성하고
            // 그 이후에 빌드가 일어나도 처음 만들어졌던 위젯을 사용한다.
            icon: const Icon(
              Icons.settings,
              color: redColor,
            ))
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> randomNumbers;

  const _Body({required this.randomNumbers, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: randomNumbers
              .asMap()
              // key, value 값을 들고 올 수 있게 해준다.
              // key, value 값을 이용하여 로직을 짤 때 유용함
              .entries
              .map((element) => Padding(
                    padding: EdgeInsets.only(
                        // 마지막 인덱스를 하드 코딩하지않고
                        // 배열이 늘어나더라도 동적으로 비교문을 만들기 위해 배열의 마지막 값과 비교하도록 만들었음
                        bottom: element.value == randomNumbers.last ? 0 : 16.0),
                    child: NumberRow(number: element.value),
                  ))
              .toList()),
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback buttonPressed;

  const _Footer({required this.buttonPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return // SizedBox 를 사용하는 이유는 ?
        // 뉘앙스의 차이 ~ Container 의 용도는 매우 다양하기 때문에
        // 더 직관적으로 목적을 알 수 있는 SizedBox 를 사용하는 것도 좋다/
        SizedBox(
      width: double.infinity,
      // 전체 사이즈를 넣고 싶으면 무한대 값을 넣어줘도 된다.
      // 무한대 값을 넣어줘도 화면을 벗어나지는 않는다.
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: redColor,
          ),
          onPressed: buttonPressed,
          child: const Text("생성하기!")),
    );
  }
}
