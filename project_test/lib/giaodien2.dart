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
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                labelText: 'Nhập chuỗi văn bản',
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            if (widget.title == 'Bài 2.3')
              TextField(
                controller: input2Controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45),
                  ),
                  labelText: 'Nhập chuỗi văn bản',
                ),
                keyboardType: TextInputType.text,
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
                      widget.title == 'Bài 2.3' ? input2Controller.text : '',
                    );
                  });
                },
                child: const Text(
                  'Tính toán',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(width: 20),
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
            ]),
            const SizedBox(height: 20),
            Text(
              result,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  String handleAlgorithmString(String title, String input1, String input2) {
    List<String> stringList = input1.trim().split(RegExp(r'\s+'));
    List<String> stringList1 = input2.trim().split(RegExp(r'\s+'));

    String s1 = stringList.join(' ');
    String s2 = stringList.join(' ');
    switch (title) {
      case 'Bài 1.5':
        return 'Kết quả: ${Algorithms.shortString(stringList)}';
      case 'Bài 1.7':
        return 'Kết quả: ${Algorithms.sortList(stringList)}';
      case 'Bài 1.10':
        return 'Kết quả: ${Algorithms.containCharacter(stringList)}';
      case 'Bài 2.2':
        return 'Kết quả: ${Algorithms.maxString(stringList)}';
      case 'Bài 2.3':
        return 'Kết quả: ${Algorithms.longestCommonSubstring(s1, s2)}';
      case 'Bài 3.4':
        return 'Kết quả: ${Algorithms.largestOverlap(stringList)}';
      case 'Bài 3.7':
        return 'Kết quả: ${Algorithms.longestPalindromeLength(s1)}';
      case 'Bài 3.10':
        return 'Kết quả: ${Algorithms.sortByDistinctChars(stringList)}';
      default:
        return 'Chưa có thuật toán cho bài này';
    }
  }

  void clean() {
    input1Controller.clear();
    input2Controller.clear();
  }
}
