// component 에는 여러 위젯에서 사용하는 중복되는 기능들을 따로 분리해서 빼놓으면 좋다
// 중복되는 위젯을 컴포터넌트화(공통 위젯 추출) 하여 코드 중복을 지우고 유지보수가 더 수월하게 만들 수 있다.
import 'package:flutter/material.dart';

class NumberRow extends StatelessWidget {
  final int number;

  const NumberRow({required this.number, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: number
          .toString()
          .split("")
          .map((number) => Image.asset(
                "asset/img/$number.png",
                width: 50.0,
                height: 70.0,
              ))
          .toList(),
    );
  }
}
