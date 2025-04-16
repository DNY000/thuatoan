import 'package:flutter/material.dart';
import 'package:project_test/thuattoan/algorithms.dart';

class GiaoDienListInt extends StatefulWidget {
  final String title;
  final String content;
  const GiaoDienListInt(
      {super.key, required this.title, required this.content});

  @override
  State<GiaoDienListInt> createState() => _GiaoDienStateListInt();
}

class _GiaoDienStateListInt extends State<GiaoDienListInt> {
  final TextEditingController input1Controller = TextEditingController();
  final TextEditingController input2Controller = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.content,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: input1Controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(45)),
                ),
                labelText: 'Nhập chuỗi số',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            if (widget.title == 'Bài 3.8' || widget.title == 'Bài 3.6')
              TextField(
                controller: input2Controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(45)),
                  ),
                  labelText: 'Nhập chuỗi số',
                ),
                keyboardType: TextInputType.number,
              ),
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    result = handleAlgorithm1(
                      widget.title,
                      input1Controller.text,
                      input2Controller.text,
                    );
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
                  ),
                ),
                child: const Text('Tính toán',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    input1Controller.clear();
                    input2Controller.clear();
                    result = '';
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
                  ),
                ),
                child: const Text('Xóa',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ]),
            const SizedBox(height: 20),
            Text(
              'Kết quả: $result',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  String handleAlgorithm1(String title, String input1, String input2) {
    // Chuyển chuỗi input1 thành List<int> bằng cách tách theo khoảng trắng
    List<int> intList = input1
        .trim()
        .split(RegExp(r'\s+'))
        .map((e) => int.tryParse(e) ?? 0)
        .toList();

    switch (title) {
      case 'Bài 1.4':
        return 'Kết quả: ${Algorithms.maxNumber(intList)}';
      case 'Bài 1.8':
        return 'Kết quả: ${Algorithms.medianOfTheNumber(intList)}';

      case 'Bài 2.1':
        return 'Kết quả: ${Algorithms.max2(intList)}';
      case 'Bài 2.4':
        return 'Kết quả: ${Algorithms.sumDivisible(intList)}';
      case 'Bài 2.5':
        return 'Kết quả: ${Algorithms.maxSubArraySum(intList)}';
      case 'Bài 3.1':
        return 'Kết quả: ${Algorithms.secondSmallestNumber2(intList)}';
      case 'Bài 3.2':
        return 'Kết quả: ${Algorithms.max2So(intList)}';
      case 'Bài 3.3':
        return 'Kết quả: ${Algorithms.longestIncreasingSubsequence(intList)}';
      case 'Bài 3.5':
        return 'Kết quả: ${Algorithms.smallestPositiveInteger(intList)}';

      default:
        return 'Chưa có thuật toán cho bài này';
    }
  }
}
