import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  bool number(String title) {
    if (title == 'Bài 1.1') {
      return true;
    }
    return false;
  }

  final Set<String> showInput2 = {
    'Bài 3.8',
    'Bài 3.6',
    'Bài 4.2',
    'Bài 1.1',
  };
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
                  hintText: 'Các số được ngăn cách bởi dấu (-)',
                  labelText: 'Nhập chuỗi số',
                  floatingLabelBehavior: FloatingLabelBehavior.auto
                  // enabledBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.blue, width: 1),
                  //   borderRadius: BorderRadius.all(Radius.circular(45)),
                  // ),
                  // focusedBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.all(Radius.circular(45)),
                  //   borderSide:
                  //       BorderSide(color: Colors.blue, width: 2), // 👉 khi focus
                  // ),

                  ),
              keyboardType: number(widget.title)
                  ? const TextInputType.numberWithOptions(
                      decimal: false, signed: false)
                  : TextInputType.number,
              inputFormatters: [
                number(widget.title)
                    ? FilteringTextInputFormatter.digitsOnly
                    : FilteringTextInputFormatter.allow(RegExp(r'[\d\-]')),
              ],
            ),
            const SizedBox(height: 20),
            if (showInput2.contains(widget.title))
              TextField(
                controller: input2Controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(45)),
                    ),
                    labelText: 'Nhập chuỗi số',
                    hintText: 'Các số được ngăn cách bởi dấu (-)',
                    floatingLabelBehavior: FloatingLabelBehavior.auto),
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: false, signed: false),
                // maxLength: number(widget.title) ? 1 : 10,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
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
        .split('-')
        .map((e) => e.trim())
        .map((e) => int.tryParse(e) ?? 0)
        .toList();

    List<int> intList1 = input2
        .split('-')
        .map((e) => e.trim())
        .map((e) => int.tryParse(e) ?? 0)
        .toList();

    switch (title) {
      case 'Bài 1.1':
        return ' ${Algorithms.sum(int.parse(input1), int.parse(input2))}';
      case 'Bài 1.3':
        return ' ${Algorithms.numberSquare(int.parse(input1))}';
      case 'Bài 1.4':
        return ' ${Algorithms.maxNumber(intList)}';
      case 'Bài 1.8':
        return ' ${Algorithms.medianOfTheNumber(intList)}';
      case 'Bài 1.6':
        return ' ${Algorithms.sortListNumber(intList)}';

      case 'Bài 2.1':
        return ' ${Algorithms.max2(intList)}';
      case 'Bài 2.4':
        return ' ${Algorithms.sumDivisible(intList)}';
      case 'Bài 2.5':
        return ' ${Algorithms.maxSubArraySum(intList)}';
      case 'Bài 3.1':
        return ' ${Algorithms.secondSmallestNumber2(intList)}';
      case 'Bài 3.2':
        return ' ${Algorithms.maxDifferenceBetween(intList)}';
      case 'Bài 3.3':
        return ' ${Algorithms.longestIncreasingSubsequence(intList)}';
      case 'Bài 3.5':
        return ' ${Algorithms.smallestPositiveInteger(intList)}';
      case 'Bài 3.6':
        return ' ${Algorithms.findMedianSortedArrays(intList, intList1)}';
      case 'Bài 3.8':
        return ' ${Algorithms.countPairsWithSum(intList, int.parse(input2))}';
      case 'Bài 4.1':
        return ' ${Algorithms.bubbleSortMoves(intList)}';
      case 'Bài 4.2':
        return ' ${Algorithms.countSubsequencesDP(intList, int.parse(input2))}';
      case 'Bài 4.4':
        return ' ${Algorithms.maxSumSubarrayNoConsecutive(intList)}';
      case 'Bài 4.6':
        return ' ${Algorithms.maxProductOfThree(intList)}';
      case 'Bài 4.8':
        return ' ${Algorithms.smallestPositiveIntegerNoConsecutive(intList)}';
      case 'Bài 4.9':
        return ' ${Algorithms.longestIncreasingSubsequence1(intList)}';
      case 'Bài 5.1':
        return ' ${Algorithms.reverses(intList)}';
      case 'Bài 5.3':
        return ' ${Algorithms.uniq(intList)}';
      default:
        return 'Chưa có thuật toán cho bài này';
    }
  }
}
