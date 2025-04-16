import 'package:flutter/material.dart';
import 'package:project_test/common/text.dart';
import 'package:project_test/giaodien1.dart';
import 'package:project_test/giaodien2.dart';
import 'package:project_test/main.dart';

class WrapDemo extends StatelessWidget {
  const WrapDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var text = Text1();
    // Danh sách các bài toán
    Map<String, String> baiTapListString = {
      'Bài 1.5': text.bai1_5,
      'Bài 1.7': text.bai1_7,
      // 'Bài 1.9': text.bai1_9,
      'Bài 1.10': text.bai1_10,
      'Bài 2.2': text.bai2_2,
      'Bài 2.3': text.bai2_3,
      'Bài 3.4': text.bai3_4,
      'Bài 3.7': text.bai3_7,
      'Bài 3.10': text.bai3_10,
    };
    Map<String, String> baiTapListInt = {
      'Bài 1.4': text.bai1_4,
      'Bài 1.6': text.bai1_6,
      'Bài 1.8': text.bai1_8,
      'Bài 2.1': text.bai2_1,
      'Bài 2.4': text.bai2_4,
      'Bài 2.5': text.bai2_5,
      'Bài 3.1': text.bai3_1,
      'Bài 3.2': text.bai3_2,
      'Bài 3.3': text.bai3_3,
      'Bài 3.5': text.bai3_5,
      'Bài 3.6': text.bai3_6,
      'Bài 3.8': text.bai3_8,
      'Bài 3.9': text.bai3_9,
    };

    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text("Thuật toán ListString",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black)),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: baiTapListString.entries.map((entry) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GiaoDienListString(
                            title: entry.key,
                            content: entry.value,
                          ), // Truyền tiêu đề bài toán
                        ),
                      );
                    },
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          entry.key,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const Text("Thuật toán ListInt",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black)),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: baiTapListInt.entries.map((entry) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GiaoDienListInt(
                            title: entry.key,
                            content: entry.value,
                          ), // Truyền tiêu đề bài toán
                        ),
                      );
                    },
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          entry.key,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          )),
    );
  }
}
