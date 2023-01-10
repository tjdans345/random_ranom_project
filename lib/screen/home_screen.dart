import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number/constant/color.dart';
import 'package:random_number/screen/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> randomNumbers = [123,456,789];

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
              const _Header(),
              _Body(randomNumbers: randomNumbers,),
              _Footer(buttonPressed: onRandomNumberGenerate)
            ],
          ),
        ),
      ),
    );
  }

  /// 랜덤 난수 생성 함수
  void onRandomNumberGenerate() {
    final rand = Random();
    final Set<int> newNumbers = {};
    while(newNumbers.length != 3) {
      newNumbers.add(rand.nextInt(1000));
    }
    setState(() {
      randomNumbers = newNumbers.toList();
    });
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "랜덤숫자 생성기",
          style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.w700),
        ),
        IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                return SettingsScreen();
              }));
            },
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
              .entries // key, value 값을 들고 올 수 있게 해준다.
              .map((element) => Padding(
            padding: EdgeInsets.only(bottom: element.value == randomNumbers.last ? 0 : 16.0 ),
            child: Row(
              children: element.value
                  .toString()
                  .split("")
                  .map((number) => Image.asset(
                "asset/img/$number.png",
                width: 50.0,
                height: 70.0,
              ))
                  .toList(),
            ),
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
