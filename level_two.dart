import 'dart:math';

void main() {
  var a = [2, 3, 5, 7, 2, 2, 3];
  print(outputSecondNumber(a));
  var s = ['duy', 'cuyngbuye', 'duygnueynahsa'];

  print(maxString(s));
  var s1 = "nguyenduy";
  var s2 = 'aduy';
  print(longSubsequence(s1, s2));
  print(sumDivisible(a));
  print('max bat ky');
  print(maxSubArraySum(a));
}
// 2.1
/* Write a program that takes a list of numbers as input and returns
 the second largest number in the list.
		VD: [70, 11, 20, 4, 100] 👉 70
*/

int outputSecondNumber(List<int> arr) {
  arr.sort();
  int n = arr.length;

  return arr[n - 2];
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
  int m = s1.length;
  int n = s2.length;
  // khởi tạo ma trận DP
  List<List<int>> dp = List.generate(m + 1, (i) => List.filled(n + 1, 0));
  for (int i = 1; i <= m; i++) {
    for (int j = 1; j <= n; j++) {
      dp[i][j] = (s1[i - 1] == s2[j - 1])
          ? dp[i - 1][j - 1] + 1
          : max(dp[i - 1][j], dp[i][j - 1]);
    }
  }

  String result = '';
  for (int i = m, j = n; i > 0 && j > 0;) {
    if (s1[i - 1] == s2[j - 1]) {
      result = s1[i - 1] + result;
      i--;
      j--;
    } else {
      (dp[i - 1][j] > dp[i][j - 1]) ? i-- : j--;
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
// 2.5
/* Write a program that takes a list of integers as input and returns
 the maximum sum of any contiguous subarray within the list.
*/

int maxSubArraySum(List<int> arr) {
  int maxCurrent = arr[0];
  int maxGlobal = arr[0];

  // Duyệt qua từng phần tử từ index 1
  for (int i = 1; i < arr.length; i++) {
    maxCurrent = max(arr[i], maxCurrent + arr[i]);
    maxGlobal = max(maxGlobal, maxCurrent);
  }

  return maxGlobal;
}
