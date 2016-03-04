library slownie.test;

import 'package:test/test.dart';

import 'package:slownie/slownie.dart';

main() {
  group('minusowe ', () {

    test('do dziesięciu', () {
      expect(slownie("-1"), "minus jeden");
      expect(slownie("-2"), "minus dwa");
      expect(slownie("-3"), "minus trzy");
      expect(slownie("-4"), "minus cztery");
      expect(slownie("-5"), "minus pięć");
      expect(slownie("-6"), "minus sześć");
      expect(slownie("-7"), "minus siedem");
      expect(slownie("-8"), "minus osiem");
      expect(slownie("-9"), "minus dziewięć");

    });
    
    
    
  });
}