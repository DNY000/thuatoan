import 'dart:math';

class Algorithms {
  // Level 1
  static int sum(int a, int b) => a + b;

  static int lengthString(String str) => str.length;

  static double numberSquare(int n) => sqrt(n);

  static int maxNumber(List<int> a) => a.reduce(max);

  static String shortString(List<String> str) =>
      str.reduce((a, b) => a.length < b.length ? a : b);

  static List<String> sortList(List<String> str) {
    str.sort((a, b) => a.compareTo(b));
    return str;
  }

  static double medianOfTheNumber(List<int> n) {
    n.sort();
    int mid = n.length ~/ 2;
    return n.length % 2 == 0 ? (n[mid - 1] + n[mid]) / 2.0 : n[mid].toDouble();
  }

  static int lengthStr(String s) => s.trim().split(RegExp(r'\s+')).length;

  static List<String> containCharacter(List<String> str) =>
      str.where((s) => s.contains('a')).toList();

  // Level 2
  static int max2(List<int> n) {
    var unique = n.toSet().toList();
    unique.remove(unique.reduce(max));
    return unique.reduce(max);
  }

  static String maxString(List<String> s) =>
      s.reduce((a, b) => a.length > b.length ? a : b);

  static String longestCommonSubstring(String s1, String s2) {
    int m = s1.length, n = s2.length;
    List<List<int>> dp = List.generate(m + 1, (_) => List.filled(n + 1, 0));
    int maxLength = 0;
    int endIndex = 0;

    for (int i = 1; i <= m; i++) {
      for (int j = 1; j <= n; j++) {
        if (s1[i - 1] == s2[j - 1]) {
          dp[i][j] = dp[i - 1][j - 1] + 1;
          if (dp[i][j] > maxLength) {
            maxLength = dp[i][j];
            endIndex = i;
          }
        }
      }
    }

    return s1.substring(endIndex - maxLength, endIndex);
  }

  static int sumDivisible(List<int> arr) =>
      arr.where((e) => e % 3 == 0 || e % 5 == 0).reduce((a, b) => a + b);

  static int maxSubArraySum(List<int> a) {
    int maxC = a[0], maxG = a[0];
    for (int i = 1; i < a.length; i++) {
      maxC = max(a[i], maxC + a[i]);
      maxG = max(maxG, maxC);
    }
    return maxG;
  }

  // Level 3

  // Level 4
  static int bubbleSortMoves(List<int> arr) {
    int count = 0;
    for (int i = 0; i < arr.length - 1; i++) {
      for (int j = 0; j < arr.length - i - 1; j++) {
        if (arr[j] > arr[j + 1]) {
          int temp = arr[j];
          arr[j] = arr[j + 1];
          arr[j + 1] = temp;
          count++;
        }
      }
    }
    return count;
  }

  static int countSubsequencesDP(List<int> arr, int target) {
    List<int> dp = List.filled(target + 1, 0);
    dp[0] = 1;
    for (int num in arr) {
      for (int j = target; j >= num; j--) {
        dp[j] += dp[j - num];
      }
    }
    return dp[target];
  }

  static int longestCommonSubstring1(List<String> strings) {
    if (strings.isEmpty) return 0;
    String first = strings[0];
    int maxLength = 0;
    for (int i = 0; i < first.length; i++) {
      for (int j = i + 1; j <= first.length; j++) {
        String substring = first.substring(i, j);
        if (strings.every((str) => str.contains(substring))) {
          maxLength = max(maxLength, substring.length);
        }
      }
    }
    return maxLength;
  }

  static int maxProductOfThree(List<int> arr) {
    if (arr.length < 3) return 0;
    arr.sort();
    return arr[arr.length - 1] * arr[arr.length - 2] * arr[arr.length - 3];
  }

  // Level 5
  static void reverses(List<int> arr) {
    List<int> result = [];
    arr.forEach((element) => result.insert(0, element));
    print(result);
  }

  static void chunk<T>(List<T> arr, int size) {
    List<List<T>> result = [];
    for (int i = 0; i < arr.length; i += size) {
      result.add(arr.sublist(i, i + size > arr.length ? arr.length : i + size));
    }
    print(result);
  }

  static void uniq(List<int> arr) {
    List<int> result = [];
    arr.forEach((element) {
      if (!result.contains(element)) result.add(element);
    });
    print(result);
  }

  static Map<dynamic, List<Map<String, dynamic>>> groupBy(
      List<Map<String, dynamic>> collection, String field) {
    Map<dynamic, List<Map<String, dynamic>>> grouped = {};
    for (var item in collection) {
      var key = item[field];
      if (key != null) {
        grouped.putIfAbsent(key, () => []).add(item);
      }
    }
    return grouped;
  }

  static int secondSmallestNumber(List<int> a) {
    a.sort();
    return a[1];
  }

// cách 2
  static int secondSmallestNumber2(List<int> a) {
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

  static int maxDifferenceBetween(List<int> a) {
    a.sort();
    return a[a.length - 1] - a[0];
  }

// max2
  static int max2So(List<int> a) {
    int max1 = a[0];

    for (int i = 0; i < a.length - 1; i++) {
      for (int j = i + 1; j < a.length; j++) {
        max1 = max(a[i] + a[j], max1);
      }
    }
    return max1;
  }

// cách 3
  static int max2So2(List<int> a) {
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

  static int longestIncreasingSubsequence(List<int> nums) {
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

  static List<String> largestOverlap(List<String> str) {
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
  static int smallestPositiveInteger(List<int> nums) {
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
  static double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
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
  static int longestPalindromeLength(String str) {
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
  static List<List<int>> countPairsWithSum(List<int> nums, int target) {
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

  static List<String> sortByDistinctChars(List<String> str) {
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
}
