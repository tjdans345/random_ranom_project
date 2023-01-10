

void main() {

  final number = 123;

  // functional Programming
  final convertJpg = number.toString().split("").map((e) => "$e.jpg");

  // print(convertJpg);

  final numbers = [
    123,
    456,
    789,
    888
  ];

  final numbers2 = [
    123456789
  ];

  var list = numbers.map((e) => e.toString().split("").map((e) => "$e.jpg")).toList();
  var list2 = numbers2.map((e) => e.toString().split("").map((e) => "$e.jpg")).toList();

  // print(list);
  // print(list2);

  numbers.asMap().entries.map((e) => sayHello(e.toString()));

  // 마지막 Value 값
  print(numbers.last);

  // 789 일 때 즉 -> 마지막 값과 똑같을 때의 조건을 판별

  bool isTrue = false;

  numbers.asMap().entries.map((e) => print( "e.value : ${e.value} numbers.last : ${numbers.last} ${e.value == numbers.last}") ).toList();

  // print(isTrue);

}

void sayHello(String value) {
  print(value);
}