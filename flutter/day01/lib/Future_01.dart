import 'dart:io';

/*
* Future
* 他的功能就是异步处理数据，将结果已异步的形式返回回来。
* 如果成功，结果就在than中返回
* 如果失败，结果就在onError中返回
*
* 它还可以进行链式调用，解决多层级嵌套的问题，第一次than中既可以接受上一次返回的数据，也可以作为下一次数据的发送者，不用多层级嵌套
*
* */
main() {
  Future(() {
    sleep(const Duration(seconds: 3));
    return ("我是第一次的结果打印");
  }).then((value) {
    print("value = $value");

    sleep(const Duration(seconds: 2));
    return ("我是第二次的结果打印");
  }).then((value) {
    print("value = $value");

    sleep(const Duration(seconds: 1));
    return ("我是第三次的结果打印");
  }).then((value) {
    print("value = $value");
  });
}

void test1() {
  print("begin");

  var result = callBascl().then((value) => {print("result = $value")});
  print("end" + result.toString());

  resultHello().then((int value) {
    print("val = $value");
  })
      .catchError((error) {
    print("error = $error");
  });
}

Future callBascl() async {
  print("calculate");
  return Future(() {
    sleep(const Duration(seconds: 3));
    return "计算结果";
  });
}

Future<int> resultHello()  {
  return Future<int>(() {
    print("object");
    sleep(Duration(seconds: 2));
    throw Exception("我是错误异常，抛出异常");
    return 100;
  });
}
