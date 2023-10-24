void test1(){
  Future.value("hello").then((value) {
    print("value = $value");
  });

  Future.error("我是错误信息").then((value) => {
    print("value = $value")
  });

  Future<String>.delayed(Duration(seconds: 2),() {
    return "deley value";
  }).then((value){
    print("value1 = $value");
    return "hello value";
  }).then((value) {
    print("value2 = $value");
  });
}