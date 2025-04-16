import 'dart:math';

void main() {
  var a = [2, 3, 5, 7, 2, 2, 3];
  // print(outputSecondNumber(a));
  var s = ['duy', 'cuyngbuye', 'duygnueynahsa'];

  print(maxString(s));
  var s1 = "nguyenduy";
  var s2 = 'adgfgfffguy';
  print(longSubsequence(s1, s2));
  print(sumDivisible(a));
  // print('max bat ky');
  // print(maxSubArraySum(a));
  // print('max2 là ${max2(a)}');
}
// 2.1
/* Write a program that takes a list of numbers as input and returns
 the second largest number in the list.
		VD: [70, 11, 20, 4, 100] 👉 70
*/

// int outputSecondNumber(List<int> arr) {
//   arr.sort();
//   int n = arr.length;

//   return arr[n - 2];
// }

int max2(List<int> n) {
  var unque = n.toSet().toList();
  // loại bỏ số trùng lặp
  // xóa phần tử max 1
  // tìm phần tử max 2
  unque.remove(
      unque.reduce((value, element) => value > element ? value : element));
  var max2 = unque.reduce((a, b) => a > b ? a : b);
  return max2;
}
//2.2
/*Write a program that takes a list of strings as
 input and returns the longest word in the list.
 */

String maxString(List<String> s) {
  String maxLength = '';
  for (int i = 0; i < s.length; i++) {
    if (s[i].length > maxLength.length) {
      maxLength = s[i];
    }
  }
  return maxLength;
}
// 2.3
/* Write a program that takes two strings as input and returns the longest 
common subsequence of the two strings.
		VD: đầu vào [“abcdef", “abczyzcdef”], Đầu ra: “cdef"
*/

String longSubsequence(String s1, String s2) {
  // tạo ma trận dp
  int m = s1.length;
  int n = s2.length;
  List<List<int>> dp = List.generate(
    m + 1,
    (index) => List.filled(n + 1, 1),
  );
  // duyệt các phần tử cho vào ma trận
  for (int i = 1; i <= m; i++) {
    for (int j = 1; j <= n; j++) {
      if (s1[i - 1] == s2[j - 1]) {
        // lưu vào ma trần
        dp[i][j] = dp[i - 1][j - 1] + 1;
        // +1 bởi vì  cho biết ma trận này có thể mở rộng thêm 1 phần tử
      } else {
        // khác nhau thì lấy max để tối ưu
        dp[i][j] = max(dp[i - 1][j], dp[i][j - 1]);
      }
    }
  }
  //  truy hồi
  String result = '';
  int i = m;
  int j = n;
  while (i > 0 && j > 0) {
    // nếu i ||j== 0 thì ma trận rỗng
    if (s1[i - 1] == s2[j - 1]) {
      result = s1[i - 1] + result;
      i--;
      j--;
    } else {
      if (dp[i - 1][j] > dp[i][j - 1]) {
        i--;
      } else {
        j--;
      }
    }
  }
  return result;
}
//2.4
/*Write a program that takes a list of numbers as input and 
returns the sum of the numbers that are divisible by both 3 and 5.
 */

int sumDivisible(List<int> arr) {
  var list = arr.where((element) => element % 3 == 0 || element % 5 == 0);
  return list.reduce(
    (a, b) => a + b,
  );
}

// cách 2
bool isDivisible(int n) {
  return n % 3 == 0 || n % 5 == 0 ? true : false;
}

// chia hết cho 3 và 5
int chiahet(List<int> arr) {
  int sum = 0;
  for (int i = 0; i < arr.length; i++) {
    if (isDivisible(arr[i])) {
      sum += arr[i];
    } else {
      continue;
    }
  }

  return sum;
}

// 2.5
/* Write a program that takes a list of integers as input and returns
 the maximum sum of any contiguous subarray within the list.
*/

int maxSubArraySum(List<int> a) {
  int maxC = a[0];
  int maxG = a[0];
  // duyệt phần tử
  for (int i = 0; i < a.length; i++) {
    // cập nhật lại maxC và MaxG mỗi lần duyệt
    maxC = max(a[i], maxC + a[i]);
    maxG = max(maxG, maxC);
  }
  return maxG;
}
