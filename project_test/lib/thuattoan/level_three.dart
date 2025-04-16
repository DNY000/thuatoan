import 'dart:math';

void main() {
  // var a = [3, 10, 2, 1, 20];
  // print(maxDifferenceBetween(a));
  // print(longestIncreasingSubsequence(a));

  var str = ['duy', 'tran', 'huy', 'annnn', 'd', 'tran', 'huy'];
  print(largestOverlap(str));
  var nums = [1, 2, 3, 7, 8, 20];
  print(smallestPositiveInteger(nums));

  var str1 = 'abacab ';
  print(longestPalindromeLength(str1));
  // print(countPairsWithSum(nums, 10));
  // print(sortByDistinctChars(str));
}
//3.1
/* Write a program that takes a list of numbers as
 input and returns the second smallest number in the list.*/

int secondSmallestNumber(List<int> a) {
  a.sort();
  return a[1];
}

// cách 2
int secondSmallestNumber2(List<int> a) {
  List<int> b = a.toSet().toList();
  // loại bỏ các phần tử trùng
  b.remove(b.reduce((a, b) => a < b ? a : b));
  // xóa phần tử nhỏ nhất
  return b.reduce((a, b) => a < b ? a : b);
}
//3.2
/*Write a program that takes a list of integers as input and 
returns the maximum difference between any two elements in the list.
		VD: [1, 2, 91, 9, 100] 👉 99 ( ket qua cua 100 - 1 )
 */

int maxDifferenceBetween(List<int> a) {
  a.sort();
  return a[a.length - 1] - a[0];
}

// max2
int max2So(List<int> a) {
  int max1 = a[0];

  for (int i = 0; i < a.length - 1; i++) {
    for (int j = i + 1; j < a.length; j++) {
      max1 = max(a[i] + a[j], max1);
    }
  }
  return max1;
}

// cách 3
int max2So2(List<int> a) {
  int max1 = a[0];
  int max2 = a[1];
  for (int i = 0; i < a.length; i++) {
    if (a[i] > max1) {
      // cập nhật lại max 1
      max2 = max1;
      max1 = a[i];
    } else if (a[i] > max2) {
      // cập nhật max 2
      max2 = a[i];
    }
  }
  return max2 + max1;
}
//3.3
/*Write a program that takes a list of integers 
as input and returns the longest increasing subsequence of 
the numbers. ( Tìm độ dài của chuỗi con tịnh tiến dài nhất )

 */

int longestIncreasingSubsequence(List<int> nums) {
  if (nums.isEmpty) return 0;

  // Tạo một danh sách độ dài bằng nums có phần từ bằng 1
  List<int> lis = List.filled(nums.length, 1);
  for (int i = 1; i < nums.length; i++) {
    for (int j = 0; j < i; j++) {
      //   kiểm tra   phần tử trước j
      if (nums[i] > nums[j]) {
        //cập nhật lis
        lis[i] = lis[i] > lis[j] + 1 ? lis[i] : lis[j] + 1;
        // đảm bảo lis[i] lớn hơn phần tử trước nó
        //
      }
    }
  }
  return lis.reduce((a, b) => a > b ? a : b);
}
//3.4
/*Write a program that takes a list of strings as input and returns 
the two strings with the largest overlap of characters. 
 */

List<String> largestOverlap(List<String> str) {
  List<String> result = [];
  int max = 0;

  // Hàm tính số ký tự chung giữa 2 chuỗi
  int _overlapCount(String s1, String s2) {
    Set<String> set1 = s1.split('').toSet();
    Set<String> set2 = s2.split('').toSet();
    return set1.intersection(set2).length;
    // lấy phần giao của 2 tập hợp
  }

  for (int i = 0; i < str.length; i++) {
    for (int j = i + 1; j < str.length; j++) {
      int overlap = _overlapCount(str[i], str[j]);
      if (overlap > max) {
        max = overlap;
        result = [str[i], str[j]];
      }
    }
  }

  return result;
}

//3.5
/*
Write a program that takes a list of numbers as input and returns 
the smallest positive integer that cannot be represented as the 
sum of any subset of the list.
Ví dụ: [1, 2, 3, 7, 8, 20] => 42
Giải thích
Chạy vòng lặp từ 1 đến số dương vô cùng:
Số 1 có trong mảng => loại
… Tương tự với 2 vàng lặp từ 1 đến số dương vô cùng:
Số 1 có trong mảng => loại
… Tương tự với 2 3
Số 4 không có trong mảng nó là tổng của 1 và 3 👉 loại 4
… Tương tự đến 42 thì không có tập hợp số nào trong mảng là 42=> 42 là kết quả

*/
int smallestPositiveInteger(List<int> nums) {
  nums.sort();
  //sắp xếp các phần tử trong mảng
  int smallest = 1;
  for (int num in nums) {
    if (num > smallest) {
      break;
    } else if (num <= smallest) {
      smallest += num;
    }
  }
  return smallest;
}

//3.6
/*Write a program that takes two lists of integers as input and 
returns the median of the combined list.
Mở rộng của bài 1.8 nhưng với đầu vào là 2 mảng thay vì 1
 */
double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
  List<int> merged = [...nums1, ...nums2];
  // ... trích xuất các phần tử của mảng
  merged.sort();
  int n = merged.length;
  if (n % 2 == 0) {
    return (merged[n ~/ 2 - 1] + merged[n ~/ 2]) / 2.0;
  } else {
    return merged[n ~/ 2].toDouble();
  }
}

//3.7
int longestPalindromeLength(String str) {
  String cleanInput = str.replaceAll(' ', '').toLowerCase();
  // loại bỏ khoảng trắng và chuyển thành chữ thường
  Map<String, int> charCount = {};
  for (int i = 0; i < cleanInput.length; i++) {
    String char = cleanInput[i];
    charCount[char] = (charCount[char] ?? 0) + 1;
  }

  //  Tính độ dài palindrome dài nhất
  int length = 0;
  bool hasOdd = false;
  charCount.forEach((char, count) {
    if (count % 2 == 0) {
      length += count;
    } else {
      length += count - 1;
      hasOdd = true;
    }
  });
  if (hasOdd) length += 1;
  return length;
}

//3.8
/* Write a program that takes a list of numbers as input and 
returns the number of distinct pairs of numbers in the 
list that sum up to a target value.*/
// input list target = number
List<List<int>> countPairsWithSum(List<int> nums, int target) {
  // tạo 2 list chứa
  List<int> seem = [];
  List<String> pairs = [];
  for (int num in nums) {
    int complement = target - num;
    if (seem.contains(complement)) {
      String pair = '${min(num, complement)}-${max(num, complement)}';
      pairs.add(pair);
    } else {
      seem.add(num);
    }
  }
  List<List<int>> result = pairs
      .map(
        (e) => e.split('-').map(int.parse).toList(),
      )
      .toList();
  return result;
}

//3.10
/*Write a program that takes a list of strings as input and 
returns the list sorted by the number of distinct characters 
in each string, with the shortest strings appearing first.
 */

List<String> sortByDistinctChars(List<String> str) {
  str.sort(
    (a, b) {
      if (a.length != b.length) {
        return a.length.compareTo(b.length);
      }
      return a.compareTo(b);
    },
  );
  return str;
}
