void main() {
  var a = [3, 1, 3, 4, 5, 6, 5];
  reverses(a);
  var s = ['duy', 'cuyngbuye', 'duygnueynahsa'];
  chunk(a, 4);
  var s1 = 'duy ngue nf            fjfj ';
  print(trimALl(s1));
}
//5.1
/*reverses: Cho đầu vào là 1 mảng, Viết một function để đảo ngược thứ tự phần 
tử trong mảng , yêu cầu không dùng hàm Reverses có sẵn của javascript 
( dùng forEach hoặc reduce ) */

void reverses(List<int> arr) {
  if (arr.isEmpty) return null;
  List<int> result = [];

  arr.forEach((element) {
    result.insert(0, element); // chèn lần lượt từng phần tử vào đầu danh sách
  });
  print(result);
}

/*chunk: Cho một mảng đầu vào, viết một function để chia đều mảng theo 
số phần chỉ định. 
Ví dụ: ['a', 'b', 'c', 'd']
chunk(['a', 'b', 'c', 'd'], 2); 👉 [['a', 'b'], ['c', 'd']]
chunk(['a', 'b', 'c', 'd'], 3); 👉 [['a', 'b', 'c'], ['d']]
 */
void chunk<T>(List<T> arr, int size) {
  if (arr.isEmpty) return null;
  List<List<T>> result = [];

  for (int i = 0; i < arr.length; i += size) {
    result.add(arr.sublist(i, i + size > arr.length ? arr.length : i + size));
  }
  print(result);
}

//5.3
/* uniq: Cho một mảng đầu vào, viết một function để loại bỏ các phần tử bị
 lặp trong mảng. 
Ví dụ [1, 2, 3, 2, 4] 👉 [1, 2, 3, 4]
*/
void uniq(List<int> arr) {
  if (arr.isEmpty) return null;
  List<int> result = [];
  arr.forEach(
    (element) {
      if (!result.contains(element)) {
        result.add(element);
      }
    },
  );
}

//5.4
/*uniq ArrayObject: Giống Uniq nhưng mở rộng cho 1 collection
 Ví dụ:
[{ 'x': 1, 'y': 2 }, { 'x': 2, 'y': 1 }, { 'y': 2, 'x': 1 }] 
👉 [{ ‘x': 1, 'y': 2 }, { 'x': 2, 'y': 1 }]
 */
void uniqArrayObject(List<Map<String, int>> arr) {
  if (arr.isEmpty) return null;
  List<Map<String, int>> result = [];

  arr.forEach((element) {
    if (!result.any((e) => e.toString() == element.toString())) {
      result.add(element);
    }
  });
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
Map<dynamic, List<Map<String, dynamic>>> groupBy(
    List<Map<String, dynamic>> collection, String field) {
  Map<dynamic, List<Map<String, dynamic>>> grouped = {};

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

String trimALl(String str) {
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
List<Map<String, dynamic>> mapKey(
    List<String> keys, List<Map<String, dynamic>> collections) {
  if (keys.isEmpty || collections.isEmpty) return [];
  List<Map<String, dynamic>> result = [];

  collections.forEach((e) {
    Map<String, dynamic> newMap = {};
    keys.forEach((key) {
      if (e.containsKey(key)) {
        // kiểm tra key có trong object không
        // nếu có thì thêm vào mảng mới
        newMap[key] = e[key];
      }
    });
    result.add(newMap);
  });

  return result;
}

//5.8
/*Switch Order: Viết function để thay đổi thứ tự order của các object. 
Ví dụ:
arr = [{id: 10, order: 0}, {id: 12, order: 1}, {id: 9, order: 2}, {id: 11, order: 3}]
switchOrder(9, 1)  // ( chuyển object có id bằng 9 lên vị trí order = 1, thay đổi lại giá trị của order )
👉 [{id: 10, order: 0}, {id: 9, order: 1}, {id: 12, order: 2}, {id: 11, order: 3}]
 */
void switchOrder(List<Map<String, dynamic>> arr, int id, int newOrder) {
  if (arr.isEmpty) return;

  // Tìm đối tượng có id cần thay đổi
  int currentIndex = arr.indexWhere((element) => element['id'] == id);
  if (currentIndex == -1) return; // Không tìm thấy đối tượng

  // Lấy đối tượng cần thay đổi và cập nhật order
  Map<String, dynamic> target = arr[currentIndex];
  target['order'] = newOrder;

  // Cập nhật thứ tự cho các đối tượng khác
  arr.forEach((element) {
    if (element['id'] != id) {
      if (element['order'] >= newOrder) {
        element['order'] += 1; // Đẩy các đối tượng khác xuống
      }
    }
  });

  // Sắp xếp lại danh sách theo thứ tự order
  arr.sort((a, b) => a['order'].compareTo(b['order']));

  print(arr);
}
