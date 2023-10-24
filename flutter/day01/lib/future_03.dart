import 'dart:io';

/*
* Future与await、async转换
* 耗时操作前需要添加await，但是await的使用需要使用async，标志这个函数是异步执行
* await的使用，返回值必须是一个Future类型，一般字符串可以不用包装为Future，系统底层会自动包装
* */
main() {

  var future = createOrderMessage();

  future.then((value) => {
    print("result = $value")
  }).onError((error, stackTrace) => {
    print("error = $error")
  });
}

Future<String> fetchUserOrder() =>
    Future.delayed(
      const Duration(seconds: 2),
          () => 'Large Latte',
    );

Future<String> createOrderMessage() async {
  var order = await fetchUserOrder();
  return 'Your order is: $order';
}