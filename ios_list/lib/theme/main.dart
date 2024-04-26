import 'package:flutter/material.dart';

main() => runApp(const LZLApp());
/*
* primarySwatch 导航栏、tabBar、floatbutton、switch的颜色
* primaryColor 导航栏、tabBar
* accetColor floatButton、switch
* primarySwatch 相当于是primaryColor和acceptColor的合集。
* 以上颜色已经被废弃，所有的颜色都可以使用每一个属性的theme来设置。
* */
class LZLApp extends StatelessWidget {
  const LZLApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LZLHomePage(),
      theme: ThemeData(
          // primarySwatch: Colors.red,
          // primaryColor: Colors.black,

          colorScheme: ColorScheme(
            primary: Colors.green,
            secondary: Colors.green,
            surface: Colors.white,
            background: Colors.grey.shade200,
            error: Colors.red,
            onPrimary: Colors.white,
            onSecondary: Colors.black,
            onSurface: Colors.black,
            onBackground: Colors.black,
            onError: Colors.white,
            brightness: Brightness.light,
          ),
          buttonTheme: const ButtonThemeData(
          height: 20,
          minWidth: 10,
          buttonColor: Colors.yellow
        ),
          // 这种设置是统一设置颜色
          bottomAppBarTheme:const BottomAppBarTheme(
            color: Colors.yellow
          ),

        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 30)
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.pink
        ),

      ),

    );
  }
}

class LZLHomePage extends StatefulWidget {
  const LZLHomePage({super.key});

  @override
  State<LZLHomePage> createState() => _LZLHomePageState();
}

class _LZLHomePageState extends State<LZLHomePage> {

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter"),
        // 设置单个导航栏的颜色
        backgroundColor: Colors.yellow,
      ),
      body: const LZLHomeContent(),
      floatingActionButton: FloatingActionButton(onPressed: ()=>{},child:const Icon(Icons.add),),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: "首页",
            icon: Icon(Icons.add)
          ),
          BottomNavigationBarItem(
            label: "我的",
            icon: Icon(Icons.message)
          )
        ],
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class LZLHomeContent extends StatelessWidget {
  const LZLHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("hello flutter",style: TextStyle(fontSize: 24),),
    );
  }
}


