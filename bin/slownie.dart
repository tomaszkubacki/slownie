import '../lib/slownie.dart';

void main() {
  

 
 for(int i = 20; i <= 1000;i++){
 var s = slownie(i.toString());
 print('expect(slownie("$i"), "$s");');
 }
 
}
