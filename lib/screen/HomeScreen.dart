import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("랜덤숫자 생성기"),
                IconButton(
                    onPressed: (){},
                    // const 를 사용하면 위젯 인스턴스를 처음 한 번 생성하고
                    // 그 이후에 빌드가 일어나도 처음 만들어졌던 위젯을 사용한다.
                    icon: const Icon(
                      Icons.settings
                    ))
              ],
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("123"),
                  Text("456"),
                  Text("789"),
                ],
              ),
            ),

            // SizedBox 를 사용하는 이유는 ?
            // 뉘앙스의 차이 ~ Container 의 용도는 매우 다양하기 때문에
            // 더 직관적으로 목적을 알 수 있는 SizedBox 를 사용하는 것도 좋다/
            SizedBox(
              // 전체 사이즈를 넣고 싶으면 무한대 값을 넣어줘도 된다.
              // 무한대 값을 넣어줘도 화면을 벗어나지는 않는다.
              child: ElevatedButton(
                  onPressed: (){},
                  child: const Text("생성하기!")
              ),
            )
          ],
        ),
      ),
    );
  }
}
   
