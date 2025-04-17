import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:project_test/thuattoan/algorithms.dart';

class GiaoDienListString extends StatefulWidget {
  final String title;
  final String content;
  const GiaoDienListString(
      {super.key, required this.title, required this.content});

  @override
  State<GiaoDienListString> createState() => _GiaoDienState();
}

class _GiaoDienState extends State<GiaoDienListString> {
  final TextEditingController input1Controller = TextEditingController();
  final TextEditingController input2Controller = TextEditingController();
  final TextEditingController input3Controller = TextEditingController();
  String result = '';
  final Set<String> titlesNeedingInput2 = {
    'Bài 2.3',
    'Bài 4.10',
    'Bài 5.2',
    'Bài 5.5',
    'Bài 5.7',
    'Bài 5.8',
  };
  final Set<String> showButtonExample = {
    'Bài 5.4',
    'Bài 5.5',
    'Bài 5.7',
    'Bài 5.8',
    'Bài 5.9',
  };
  bool check(String title) {
    if (title == 'Bài 4.10' || title == 'Bài 5.2' || title == 'Bài 5.8') {
      return true;
    }
    return false;
  }

  List<List<Map<String, int>>> rawList = [
    [
      {'x': 1, 'y': 2},
      {'x': 2, 'y': 1},
      {'y': 2, 'x': 1},
    ],
    [
      {
        'a': 10,
        'b': 20,
      },
      {'a': 10, 'b': 20},
      {
        'a': 10,
        'b': 20,
      },
    ],
    [
      {
        'x': 5,
        'y': 10,
      },
      {'y': 10, 'x': 5},
      {
        'x': 5,
        'y': 10,
      },
    ]
  ];
  void randomPick() {
    final picked = rawList[Random().nextInt(rawList.length)];
    final flatText = picked.map((e) => e.toString()).join(", ");
    input1Controller.text = flatText;
  }

  List<List<Map<String, int>>> example = [
    [
      {"id": 10, "order": 7},
      {"id": 12, "order": 1},
      {"id": 9, "order": 2},
      {"id": 11, "order": 3}
    ],
    [
      {"a": 1, "b": 2},
      {"a": 2, "b": 1},
      {"a": 9, "b": 2},
      {"a": 11, "b": 3}
    ]
  ];
  List<Map<String, int>> randomPick1() {
    final List<Map<String, int>> picked =
        example[Random().nextInt(example.length)];

    final flatText = picked.map((e) => e.toString()).join(",");

    input1Controller.text = flatText;
    return picked;
  }

//  bool checkArayObject(W)
  @override
  Widget build(BuildContext context) {
    final keyBoardHeight = MediaQuery.of(context).viewInsets.bottom * 0.7;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(widget.title),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: keyBoardHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.content,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: input1Controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45),
                ),
                labelText: 'Nhập  văn bản ',
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            if (titlesNeedingInput2.contains(widget.title))
              TextField(
                controller: input2Controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45),
                  ),
                  labelText:
                      check(widget.title) ? 'Nhập số K' : 'Nhập chuỗi văn bản',
                ),
                maxLength: check(widget.title) ? 2 : null,
                keyboardType: check(widget.title)
                    ? const TextInputType.numberWithOptions(
                        decimal: false, signed: false)
                    : TextInputType.text,
              ),
            // const SizedBox(height: 20),
            if (widget.title == 'Bài 5.8')
              TextField(
                controller: input3Controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45),
                  ),
                  labelText: check(widget.title)
                      ? 'Nhập vị trí chuyển'
                      : 'Nhập chuỗi văn bản',
                ),
                maxLength: check(widget.title) ? 2 : null,
                keyboardType: check(widget.title)
                    ? const TextInputType.numberWithOptions(
                        decimal: false, signed: false)
                    : TextInputType.text,
              ),
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    result = handleAlgorithmString(
                        widget.title,
                        input1Controller.text,
                        input2Controller.text,
                        input3Controller.text);
                  });
                },
                child: const Text(
                  'Tính toán',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    clean();
                    result = '';
                  });
                },
                child: const Text(
                  'Xóa',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(width: 10),
              if (showButtonExample.contains(widget.title))
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                  ),
                  onPressed: () {
                    if (widget.title == 'Bài 5.2' ||
                        widget.title == 'Bài 5.5' ||
                        widget.title == 'Bài 5.7') {
                      randomPick();
                    } else if (widget.title == 'Bài 5.9' ||
                        widget.title == 'Bài 5.8') {
                      randomPick1();
                    }
                  },
                  child: const Text(
                    'Vi dụ',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
            ]),
            const SizedBox(height: 20),
            Text(
              'Kết quả: $result',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  List<Map<String, String>> convertInputToListOfMaps(String input) {
    final data = '[${input.replaceAll("'", '"')}]'
        .replaceAllMapped(RegExp(r'(\w+)\s*:'), (m) => '"${m[1]}":')
        .replaceAllMapped(RegExp(r':\s*([\d.]+)'), (m) => ': "${m[1]}"');

    final decoded = jsonDecode(data) as List;

    return decoded.map((e) {
      final map = Map<String, dynamic>.from(e as Map); // <- fix lỗi ở đây
      return map.map((k, v) => MapEntry(k.toString(), v.toString()));
    }).toList();
  }

  String handleAlgorithmString(
      String title, String input1, String input2, String input3) {
    List<String> stringList = input1.trim().split(RegExp(r'\s+'));
    List<String> stringList1 = input2.trim().split(RegExp(r'\s+'));

    String s1 = stringList.join(' ');

    switch (title) {
      case 'Bài 1.2':
        return ' ${Algorithms.lengthString(input1)}';
      case 'Bài 1.5':
        return ' ${Algorithms.shortString(stringList)}';
      case 'Bài 1.7':
        return ' ${Algorithms.sortList(stringList)}';
      case 'Bài 1.9':
        return ' ${Algorithms.lengthStr(input1)}';
      case 'Bài 1.10':
        return ' ${Algorithms.containCharacter(stringList)}';
      case 'Bài 2.2':
        return ' ${Algorithms.maxString(stringList)}';
      case 'Bài 2.3':
        return ' ${Algorithms.longestCommonSubstring(input1.trim(), input2.trim())}';
      case 'Bài 3.4':
        return ' ${Algorithms.largestOverlap(stringList)}';
      case 'Bài 3.7':
        return ' ${Algorithms.longestPalindromeLength(s1)}';
      case 'Bài 3.10':
        return ' ${Algorithms.sortByDistinctChars(stringList)}';
      case 'Bài 4.3':
        return ' ${Algorithms.longestCommonSubstring2(stringList)}';
      case 'Bài 4.5':
        return ' ${Algorithms.longestCommonSubstring1(stringList)}';
      case 'Bài 4.7':
        return ' ${Algorithms.sortByDistinctWords(stringList)}';
      case 'Bài 4.10':
        return ' ${Algorithms.largestOverlapWithK(stringList, int.parse(input2))}';
      case 'Bài 5.2':
        return ' ${Algorithms.chunk(stringList, int.parse(input2))}';
      case 'Bài 5.4':
        return ' ${Algorithms.uniqArrayObject(convertInputToListOfMaps(input1))}';
      case 'Bài 5.5':
        return ' ${Algorithms.groupBy(convertInputToListOfMaps(input1), input2)}';
      case 'Bài 5.6':
        return ' ${Algorithms.trimALl(input1)}';
      case 'Bài 5.7':
        return ' ${Algorithms.mapKey(stringList1, convertInputToListOfMaps(input1))}';
      case 'Bài 5.8':
        return ' ${Algorithms.switchOrder(randomPick1(), int.parse(input2), int.parse(input3))}';

      case 'Bài 5.9':
        return ' ${Algorithms.sumAll(randomPick1())}';

      default:
        return 'Chưa có thuật toán cho bài này';
    }
  }

  void clean() {
    input1Controller.clear();
    input2Controller.clear();
  }
}
