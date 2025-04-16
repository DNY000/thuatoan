import 'dart:math';

void main() {
  var a = [1, 1, 3, 2, 4];

  // print(bubbleSortMoves(a));
  print(countSubsequencesDP(a, 5));
  var str = ['abcdefg', 'abcde', 'abcdef', 'ab', 'abc'];
  // print(longestCommonSubstring(str));
  // print(maxProductOfThree(a));

  var str1 = ['duygng hghdf dfjdf ', 'duy', 'xin choa duy'];
  // print(sortByDistinctWords(str1));
  // print(smallestPositiveIntegerNoConsecutive(a));
  print(longestCommonSubstring1(str1));
  // print(maxProductOfThree(a));
  // print(longestIncreasingSubsequence(a));
  // print(sortByDistinctWords(str1));
  // print(smallestPositiveIntegerNoConsecutive(a));
  // print(longestIncreasingSubsequence(a));
  // print(largestOverlapWithK(str1, 2));
  // print(longestIncreasingSubsequence(a));
  // largestOverlapWithK(str, 4);
}

//4.1
/*Write a program that takes a list of integers as input and returns
 the minimum number of moves required to sort the list in ascending
  order using bubble sort.
		Đầu vào 1 dãy số bất kỳ
Đầu ra là số lần lặp để hoàn thành việc sắp xếp nổi bọt
Gợi ý: Tìm hiểu về sắp xếp nổi bọt ( bubble sort ). Tìm số lần sắp xếp nổi bọt cần để hoàn thành việc sắp xếp với mảng đầu vào 
VD: [3, 1, 4, 2, 6, 5] cần 4 lần sắp xếp để hoàn thành
 */
int bubbleSortMoves(List<int> arr) {
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
int countSubsequencesDP(List<int> arr, int target) {
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
int longestCommonSubstring(List<String> strings) {
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
//4.5

/* Write a program that takes a list of strings as input and returns the 
length of the longest common substring of the strings. ( mở rộng của 2.3 =>
 có thể bỏ qua )
*/

int longestCommonSubstring1(List<String> strings) {
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
int maxProductOfThree(List<int> arr) {
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
List<String> sortByDistinctWords(List<String> strings) {
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

int smallestPositiveIntegerNoConsecutive(List<int> nums) {
  nums.sort();
  int smallest = 1;
  for (int num in nums) {
    if (num > smallest) {
      break;
    } else if (num == smallest || num < smallest) {
      smallest += num;
    }
  }
  return smallest;
}

//4.9
/*Write a program that takes a list of integers as input and returns the length
  of the longest increasing subsequence of the numbers, with the additional
   constraint that no two adjacent elements in the subsequence can differ by
    more than 1. ( Khuyến khích dùng reduce ) */
int longestIncreasingSubsequence(List<int> arr) {
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
    return a; // trả về giá trị a để tiếp tục vòng lặp ví dụ  1 ,2
    //trả a để tiếp tục vòng lặp với a mới bằng 2
  });

  return maxLength;
}

/*Write a program that takes a list of strings as input and returns the two
 strings with the largest overlap of substrings, where the substrings 
 must be at lea	st k characters long (where k is a parameter to the function).
		Giống bài 2.3 nhưng thêm biến k là độ dài các ký tự trùng
 */
List<String> largestOverlapWithK(List<String> strings, int k) {
  int maxOverlap = 0;
  String resultStr1 = '', resultStr2 = '';

  // Hàm tính số lượng chuỗi con trùng nhau giữa hai chuỗi
  int _maxOverlap(String s1, String s2, int k) {
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
      int overlap = _maxOverlap(strings[i], strings[j], k);
      if (overlap > maxOverlap) {
        maxOverlap = overlap;
        resultStr1 = strings[i];
        resultStr2 = strings[j];
      }
    }
  }

  print('Chuỗi 1: $resultStr1');
  print('Chuỗi 2: $resultStr2');
  return [resultStr1, resultStr2];
}
