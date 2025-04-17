import 'dart:math';

class Algorithms {
  // Level 1
  static int sum(int a, int b) => a + b;

  static int lengthString(String str) => str.length;

  static double numberSquare(int n) => double.parse(sqrt(n).toStringAsFixed(5));

  static int maxNumber(List<int> a) => a.reduce(max);

  static String shortString(List<String> str) =>
      str.reduce((a, b) => a.length < b.length ? a : b);

  static List<String> sortList(List<String> str) {
    str.sort((a, b) => a.compareTo(b));
    return str;
  }

  // sap xep number  tăng dần
  static List<int> sortListNumber(List<int> a) {
    a.sort();
    return a;
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
    int max1 = 0;
    int max2 = 0;
    for (int a in n) {
      if (a > max1) {
        max2 = max1;
        max1 = a;
      } else if (a > max2 && a != max1) {
        max2 = a;
      }
    }
    return max2;
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
  //4.1
/*Write a program that takes a list of integers as input and returns
 the minimum number of moves required to sort the list in ascending
  order using bubble sort.
		Đầu vào 1 dãy số bất kỳ
Đầu ra là số lần lặp để hoàn thành việc sắp xếp nổi bọt
Gợi ý: Tìm hiểu về sắp xếp nổi bọt ( bubble sort ). Tìm số lần sắp xếp nổi bọt cần để hoàn thành việc sắp xếp với mảng đầu vào 
VD: [3, 1, 4, 2, 6, 5] cần 4 lần sắp xếp để hoàn thành
 */
  static int bubbleSortMoves(List<int> arr) {
    int count = 0;
    int n = arr.length;
    for (int i = 0; i < n - 1; i++) {
      for (int j = 0; j < n - i - 1; j++) {
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

//4.2
/*Write a program that takes a list of integers as input and returns
  the number of distinct subsequences of the list that sum up to a 
  target value.
VD: 
Đầu vào [1, 2, 3, 4, 5] và 5 👉 2 ( vì 2 + 3 và 1 + 4 bằng 5 )
Đầu vào [1, 1, 2, 3, 4] và 5 👉 4 ( vì 4 tổ hợp có tổng bằng 5 )
 */
  static int countSubsequencesDP(List<int> arr, int target) {
    List<int> dp = List.filled(target + 1, 0);
    dp[0] = 1;
    arr.sort();
    for (int num in arr) {
      for (int j = target; j >= num; j--) {
        dp[j] += dp[j - num];
      }
    }

    return dp[target];
  }

//4.3
/*Write a program that takes a list of strings as input and returns
 the length of the longest substring that appears in every 
 string in the list.VD: 
["abcdefg", "abcde", "abcdef", "ab", "abc"] => 2
["programming", "programmer", "program"] => 7
 */
  static longestCommonSubstring2(List<String> strings) {
    if (strings.isEmpty) return 0;
    String first = strings[0];
    int maxLength = 0;

    for (int i = 0; i < first.length; i++) {
      for (int j = i + 1; j <= first.length; j++) {
        String substring = first.substring(i, j);
        bool foundInAll = true;
        for (String str in strings) {
          if (!str.contains(substring)) {
            foundInAll = false;
            break;
          }
        }
        if (foundInAll) {
          maxLength = max(maxLength, substring.length);
        }
      }
    }

    return maxLength;
  }
  //4.4

  static int maxSumSubarrayNoConsecutive(List<int> nums) {
    if (nums.isEmpty) {
      return 0;
    }

    // If there's only one element, return it.
    if (nums.length == 1) {
      return nums[0];
    }

    // dp array to store the maximum sum at each index
    List<int> dp = List.filled(nums.length, 0);

    // Base case: the first element in the dp array is the first element in the input array
    dp[0] = nums[0];

    // Second element: It's either the first element or the second element itself
    dp[1] = nums[1] > nums[0] ? nums[1] : dp[0];

    // Fill the dp array by iterating through the list
    for (int i = 2; i < nums.length; i++) {
      // Option 1: Don't include nums[i-1] (skip it)
      // Option 2: Include nums[i], skip nums[i-1], and add it to dp[i-2]
      dp[i] = nums[i] + (nums[i - 1] != nums[i] - 1 ? dp[i - 2] : 0);

      // Option 3: Max of excluding the current number, or including it
      dp[i] = nums[i] > dp[i - 1] ? dp[i] : dp[i - 1];
    }

    // The maximum sum will be the last element in dp
    return dp[nums.length - 1];
  }

//4.5

/* Write a program that takes a list of strings as input and returns the 
length of the longest common substring of the strings. ( mở rộng của 2.3 =>
 có thể bỏ qua )
*/

  static longestCommonSubstring1(List<String> strings) {
    if (strings.isEmpty) return 0;

    String first = strings[0];
    int maxLength = 0;
    for (int i = 0; i < first.length; i++) {
      for (int j = i + 1; j <= first.length; j++) {
        String substring = first.substring(i, j);

        // Kiểm tra chuỗi con này có trong tất cả các chuỗi còn lại không
        bool foundInAll = true;
        for (String str in strings) {
          if (!str.contains(substring)) {
            foundInAll = false;
            break;
          }
        }
        if (foundInAll) {
          maxLength = max(maxLength, substring.length);
        }
      }
    }

    return maxLength;
  }

//4.6
/* Write a program that takes a list of integers as input and returns the 
maximum product of any three distinct elements in the list.
*/
  static int maxProductOfThree(List<int> arr) {
    if (arr.length < 3) return 0;
    arr.sort();
    int n = arr.length;
    return arr[n - 1] * arr[n - 2] * arr[n - 3];
  }

//4.7
/*Write a program that takes a list of strings as input and returns the list 
sorted by the number of distinct words in each string, with the longest
 strings appearing first.
(Khuyến khích dùng forEach với javascript )
Sắp xếp từ chuỗi dài nhất đến ngắn nhất, trong trường hợp có 2 chuỗi cùng độ 
dài thì sắp xếp theo thứ tự bảng chữ cái 
Ví dụ: ['the quick brown fox', 'the lazy dog jumps over the fence',
 'the cat in the hat']
Kết quả: ['the lazy dog jumps over the fence', 'the quick brown fox',
 'the cat in the hat']
 */
  static List<String> sortByDistinctWords(List<String> strings) {
    strings.sort((a, b) {
      if (a.length == b.length) {
        return a.length.compareTo(b.length);
      }
      return a.compareTo(b);
    });
    return strings;
  }

// 4.8
/*Write a program that takes a list of integers as input and returns the 
smallest positive integer that cannot be represented as the sum of any subset
 of the list, with the additional constraint that no subset can contain any
  consecutive integers. ( có thể bỏ qua ) */
//smallestPositiveIntegerNoConsecutive

  static int smallestPositiveIntegerNoConsecutive(List<int> nums) {
    final Set<int> resultSums = {}; // Set lưu tất cả các tổng hợp lệ
    nums = nums.where((e) => e > 0).toList(); // Lọc các số dương
    nums.sort(); // Sắp xếp mảng

    // Hàm đệ quy sinh tất cả các tập con không có số liên tiếp
    void generateSubset(int index, List<int> subset) {
      if (index == nums.length) {
        if (subset.isNotEmpty) {
          final sorted = List<int>.from(subset)
            ..sort(); // Clone và sort lại subset
          bool hasConsecutive = false;
          // Kiểm tra xem có số liên tiếp trong subset không
          for (int i = 1; i < sorted.length; i++) {
            if (sorted[i] == sorted[i - 1] + 1) {
              hasConsecutive = true;
              break;
            }
          }
          if (!hasConsecutive) {
            resultSums.add(sorted.reduce((a, b) =>
                a + b)); // Thêm tổng vào Set nếu không có số liên tiếp
          }
        }
        return;
      }

      // Không chọn phần tử tại index
      generateSubset(index + 1, List<int>.from(subset));

      // Chọn phần tử tại index và thêm vào subset
      final newSubset = List<int>.from(subset)..add(nums[index]);
      generateSubset(index + 1, newSubset);
    }

    // Khởi động quá trình sinh tất cả các subset
    generateSubset(0, []);

    // Tìm số dương nhỏ nhất không có trong resultSums
    int smallest = 1;
    while (resultSums.contains(smallest)) {
      smallest++;
    }

    return smallest;
  }

//4.9
/*Write a program that takes a list of integers as input and returns the length
  of the longest increasing subsequence of the numbers, with the additional
   constraint that no two adjacent elements in the subsequence can differ by
    more than 1. ( Khuyến khích dùng reduce ) */
  static int longestIncreasingSubsequence1(List<int> arr) {
    if (arr.isEmpty) return 0;
    int maxLength = 1;
    int currentLength = 1;

    arr.reduce((a, b) {
      if ((a - b).abs() == 1) {
        currentLength++;
        maxLength = max(maxLength, currentLength);
      } else {
        currentLength = 1;
      }
      return b; // trả về giá trị b để tiếp tục vòng lặp ví dụ  1 ,2
      //trả a để tiếp tục vòng lặp với a mới bằng 2
    });

    return maxLength;
  }

/*Write a program that takes a list of strings as input and returns the two
 strings with the largest overlap of substrings, where the substrings 
 must be at lea	st k characters long (where k is a parameter to the function).
		Giống bài 2.3 nhưng thêm biến k là độ dài các ký tự trùng
 */
  static List<String> largestOverlapWithK(List<String> strings, int k) {
    int maxOverlap = 0;
    String resultStr1 = '', resultStr2 = '';

    // Hàm tính số lượng chuỗi con trùng nhau giữa hai chuỗi
    int maxOverlap0(String s1, String s2, int k) {
      int overlap = 0;
      for (int i = 0; i <= s1.length - k; i++) {
        String substring1 = s1.substring(i, i + k);
        for (int j = 0; j <= s2.length - k; j++) {
          String substring2 = s2.substring(j, j + k);
          if (substring1 == substring2) {
            overlap++;
          }
        }
      }
      return overlap;
    }

    // Duyệt qua tất cả các cặp chuỗi trong danh sách
    for (int i = 0; i < strings.length; i++) {
      for (int j = i + 1; j < strings.length; j++) {
        int overlap = maxOverlap0(strings[i], strings[j], k);
        if (overlap > maxOverlap) {
          maxOverlap = overlap;
          resultStr1 = strings[i];
          resultStr2 = strings[j];
        }
      }
    }

    return [resultStr1, resultStr2];
  }

  // Level 5
  //5.1
/*reverses: Cho đầu vào là 1 mảng, Viết một function để đảo ngược thứ tự phần 
tử trong mảng , yêu cầu không dùng hàm Reverses có sẵn của javascript 
( dùng forEach hoặc reduce ) */

  static List<int> reverses(List<int> arr) {
    if (arr.isEmpty) return [];
    List<int> result = [];

    for (var element in arr) {
      result.insert(0, element); // chèn lần lượt từng phần tử vào đầu danh sách
    }
    return result;
  }

/*chunk: Cho một mảng đầu vào, viết một function để chia đều mảng theo 
số phần chỉ định. 
Ví dụ: ['a', 'b', 'c', 'd']
chunk(['a', 'b', 'c', 'd'], 2); 👉 [['a', 'b'], ['c', 'd']]
chunk(['a', 'b', 'c', 'd'], 3); 👉 [['a', 'b', 'c'], ['d']]
 */
  static List<List<T>> chunk<T>(List<T> arr, int size) {
    // if (arr.isEmpty) return;
    List<List<T>> result = [];

    for (int i = 0; i < arr.length; i += size) {
      result.add(arr.sublist(i, i + size > arr.length ? arr.length : i + size));
    }
    return result;
  }

//5.3
/* uniq: Cho một mảng đầu vào, viết một function để loại bỏ các phần tử bị
 lặp trong mảng. 
Ví dụ [1, 2, 3, 2, 4] 👉 [1, 2, 3, 4]
*/
  static List<int> uniq(List<int> arr) {
    if (arr.isEmpty) return [];
    List<int> result = [];
    for (var element in arr) {
      if (!result.contains(element)) {
        result.add(element);
      }
    }
    return result;
  }

//5.4
/*uniq ArrayObject: Giống Uniq nhưng mở rộng cho 1 collection
 Ví dụ:
[{ 'x': 1, 'y': 2 }, { 'x': 2, 'y': 1 }, { 'y': 2, 'x': 1 }] 
👉 [{ ‘x': 1, 'y': 2 }, { 'x': 2, 'y': 1 }]
 */
  static List<Map<String, String>> uniqArrayObject(
      List<Map<String, String>> arr) {
    if (arr.isEmpty) return [];
    List<Map<String, String>> result = [];

    for (var element in arr) {
      if (!result.any((e) => e.toString() == element.toString())) {
        result.add(element);
      }
    }
    return result;
  }

//5.5
/*Group by: Cho đầu vào là 1 collection ( array of object ), 
  Viết một function để trả ra 1 OBJECT mới chứa dữ liệu được group theo
   trường chỉ định. 
Ví dụ : 
const collect = [{a: 1, b: 2}, {a: 1, b: 3}, {a: 2, b: 2}];
groupBy(collect, ‘a'); 
👉 output {1: [{a: 1, b: 2}, {a: 1, b: 3}], 2: [{a: 2, b: 2}]}

groupBy(collect, ‘b'); 
👉 output {2: [{a: 1, b: 2}, {a: 2, b: 2}], 3: [{a: 1, b: 3}]}
 */
  static Map<String, List<Map<String, String>>> groupBy(
      List<Map<String, String>> collection, String field) {
    Map<String, List<Map<String, String>>> grouped = {};

    for (var item in collection) {
      // lấy value
      var key = item[field];
      if (key != null) {
        if (!grouped.containsKey(key)) {
          // tạo value là mảng trống cho key
          grouped[key] = [];
        }
        grouped[key]!.add(item);
        // thêm các item và value
      }
    }

    return grouped;
  }

//5.6
/*TrimAll: Viết function loại bỏ tất cả khoảng trắng đầu và cuối của một chuỗi
 bất kỳ, nếu có khoảng trắng ở giữa chuỗi đó thì chỉ giữ lại một khoảng trắng. 
VD:
“    hello     world    “ 👉 “hello world"  
“   I    am    good      “ 👉 “I am good”
 */

  static String trimALl(String str) {
    if (str.isEmpty) return str;
    return str
        .trim()
        .split(RegExp(r'\s+')) // biểu thức chính quy
        .join(' '); // Ghép lại các từ với một khoảng trắng duy nhất
  }

//5.7
/*MapKey: Cho 1 mảng các key, vào 1 mảng các object ,
 Viết một function để trả ra một mảng các object theo thứ tự mảng các key
 . ( Yêu cầu dùng hàm map )
Ví dụ
keys = [‘b', ‘a', ‘c']
collections = [{a: 1, b: 1, c: 2, d: 4, e: 5}, {a: 2, b:1, c: 5, d: 4, e: 5}, {d: 4, e: 5, a: 22, b:11, c: 51, }]
👉 [{b: 1, a: 1, c: 2}, {b: 1, a: 2, c: 5}, {b: 11, a: 22, c: 51}]
 */
//
  static List<Map<String, String>> mapKey(
      List<String> keys, List<Map<String, String>> collections) {
    if (keys.isEmpty || collections.isEmpty) return [];
    List<Map<String, String>> result = [];

    for (var e in collections) {
      Map<String, String> newMap = {};
      for (var key in keys) {
        if (e.containsKey(key)) {
          // kiểm tra key có trong object không
          // nếu có thì thêm vào mảng mới
          newMap[key] = e[key] as String;
        }
      }
      result.add(newMap);
    }

    return result;
  }

//5.8
/*Switch Order: Viết function để thay đổi thứ tự order của các object. 
Ví dụ:
arr = [{id: 10, order: 0}, {id: 12, order: 1}, {id: 9, order: 2}, {id: 11, order: 3}]
switchOrder(9, 1)  // ( chuyển object có id bằng 9 lên vị trí order = 1, thay đổi lại giá trị của order )
👉 [{id: 10, order: 0}, {id: 9, order: 1}, {id: 12, order: 2}, {id: 11, order: 3}]
 */
  static List<Map<String, int>> switchOrder(
      List<Map<String, int>> arr, int id, int newOrder) {
    if (arr.isEmpty) return [];

    // Tìm đối tượng có id cần thay đổi
    int currentIndex = arr.indexWhere((element) => element['id'] == id);
    if (currentIndex == -1) return []; // Không tìm thấy đối tượng

    // Lấy đối tượng cần thay đổi và cập nhật order
    Map<String, int> target = arr[currentIndex];
    target['order'] = newOrder;

    // Cập nhật thứ tự cho các đối tượng khác
    for (var element in arr) {
      if (element['id'] != id) {
        if (element['order']! >= newOrder) {
          element['order'] =
              (element['order'] ?? 0) + 1; // Đẩy các đối tượng khác xuống
        }
      }
    }

    // Sắp xếp lại danh sách theo thứ tự order
    arr.sort((a, b) => a['order']!.compareTo(b['order']!));

    return arr;
  }

  //5.9
  static Map<String, int> sumAll(List<Map<String, int>> arr) {
    final Map<String, int> result = {};

    for (final obj in arr) {
      obj.forEach((key, value) {
        int intValue = value;
        result[key] = (result[key] ?? 0) + intValue;
      });
    }

    return result;
  }

//3.1
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
        max1 = max(a[i] - a[j], max1);
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
    int overlapCount(String s1, String s2) {
      Set<String> set1 = s1.split('').toSet();
      Set<String> set2 = s2.split('').toSet();
      return set1.intersection(set2).length;
      // lấy phần giao của 2 tập hợp
    }

    for (int i = 0; i < str.length; i++) {
      for (int j = i + 1; j < str.length; j++) {
        int overlap = overlapCount(str[i], str[j]);
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
