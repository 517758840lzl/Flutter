import 'dart:math';

class Modifier {
  static void testConst() {
    const a = 10;
    // const b = result();  // 报错，因为const修饰的要在编译时期是一个常量.这个result()在编译器不确定，只有在运行时期才可以确定值
    const b = 12;
    const c = a + b;

    const array = const [1, 2, c];
    // array[1] = 10;
    print(array[1]);

    const d = 2;
    // var d = 2; 这种是不被允许的，const是修饰常量的，不可以出现变量
    const e = const [d, 2, 3];
  }

  void testConstInit() {
    // const person = Person();
    const dog = Dog("hello", 18);
  }

  void testFinal() {
    // final 修饰的变量只能赋值一次，赋值之后就不能进行改变了
    // 使用场景 a:修饰变量时我们需要指定初始值。b:修饰变量时我们可以不指定初始值，但是需要给出指定的构造函数，我们通过构造函数
    // 来对变量进行初始化。所以这里可以看到，他不一定要求在定义变量的时候就进行赋值操作，
    final name = "";
  }

  int result() {
    return Random().nextInt(1000);
  }
}

main() {
  Modifier.testConst();
}

class Person {
  var name;
  var int;
}

class Dog {
  final name;
  final age;
  // const 修饰对象，那么这个对象中所有的属性都需要使用final修饰符。
  const Dog(this.name, this.age);
}
