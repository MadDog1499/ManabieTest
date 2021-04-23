import 'package:flutter_test/flutter_test.dart';
import 'package:manabie/UI/CustomWidget/add_todo_dialog.dart';

void main() {
  //THESE TEST MUST PASS
  group("Validate Todo", () {
    List<String> list = ["B"];
    test('should return 1(pass)', () {
      var result = ValidateTitleAndDescription.validate("A", "SomeThing", list);
      expect(result, 1);
    });
    test('should return -1 (empty)', () {
      var result = ValidateTitleAndDescription.validate("", "", list);
      expect(result, -1);
    });
    test('should return 0 (exist)', () {
      var result = ValidateTitleAndDescription.validate("B", "hello", list);
      expect(result, 0);
    });
  });
}
