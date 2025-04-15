import 'dart:math';

void main() {
  int n = 5;
  var a = [3, 5, 3, 6, 3];
  print(numberSquare(n));
  print(maxNumber(a));
  var l = ['duy', 'nguen', 'an'];
  sortList(l);
  print(l);
  print(containCharacter(l));
}
// 1.1
/*
Write a program that takes two numbers as inputs and displays their sum.
*/

int sum(int a, int b) {
  return a + b;
}
//1.2
/*
Write a program that takes a string as 
input and displays the length of the string.
*/

int lengthString(String str) {
  return str.length;
}
//1.3
/*
  Write a program that takes a number as input and displays its square.
  */

double numberSquare(int n) {
  return sqrt(n);
}
//1.4
/*
Write a program that takes a list of 
numbers as input and displays the largest number in the list
*/

int maxNumber(List<int> a) {
  int i = 0;
  int n = a.length;
  int max = 0;
  for (i; i < n; i++) {
    if (a[i] > max) {
      max = a[i];
    }
  }
  return max;
}
//1.5
/*
Write a program that takes a list of strings
 as input and displays the shortest string in the list.
*/
// dùng compareTo so sánh 2 đối tượng , reduce trả về đối tượng duy nhất

String shortString(List<String> str) {
  if (str.isEmpty) return "";
  return str.reduce((a, b) => a.compareTo(b) > 0 ? a : b);
}
//1.6
/*Write a program that takes a list of strings as 
input and sorts the list in alphabetical order.
*/

void sortList(List<String> str) {
  if (str.isEmpty) return null;
  for (int i = 0; i < str.length - 1; i++) {
    for (int j = i + 1; j < str.length; j++) {
      if (str[i].compareTo(str[j]) > 0) {
        String temp = str[i];
        str[i] = str[j];
        str[j] = temp;
      }
    }
  }
}
//1.7
/*Write a program that takes a list of strings as input and sorts the list in
 alphabetical order. */

void sortAlphabetical(List<String> str) {
  if (str.isEmpty) return null;
  for (int i = 0; i < str.length - 1; i++) {
    for (int j = i + 1; j < str.length; j++) {
      if (str[i].compareTo(str[j]) > 0) {
        String temp = str[i];
        str[i] = str[j];
        str[j] = temp;
      }
    }
  }
}
//1.8
/*
Write a program that takes a list of numbers as input and returns
 the median of the numbers.(
  Tìm số trung vị ( số trung vị không phải số trung bình cộng ))
*/

double medianOfTheNumber(List<int> n) {
  n.sort();

  if (n.length % 2 == 0) {
    int mid = n.length ~/ 2;
    return n[mid].toDouble();
  } else {
    int mid1 = (n.length ~/ 2 - 1);
    int mid2 = (n.length ~/ 2);

    return ((n[mid1]) + n[mid2]) / 2.0;
  }
}
//1.9
/* Write a program that takes a string as input and returns the 
number of words in the string. ( tìm số từ trong một chuỗi, VD: “Hello world" => 2 )
*/

int lengthStr(String s) {
  return s.trim().length;
}
//1.10
/* Write a program that takes a list of strings as input and 
returns the number of strings that contain the letter 'a'.*/

List<String> containCharacter(List<String> str) {
  List<String> reuslt = [];
  for (var s in str) {
    s.contains('a') ? reuslt.add(s) : null;
  }
  return reuslt;
}
