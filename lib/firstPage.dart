import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:modul6_vazifa4/secondPage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController? textEditingControlleruser;
  TextEditingController? textEditingControllerpassword;

  void saver()  {
    String username = textEditingControlleruser!.text.trim();
    String password = textEditingControllerpassword!.text.trim();
    var box = Hive.box('box');
     box.put('username', username);
     box.put('password', password);
     print(box.get('username'));
     print(box.get('password'));
  }

  @override
  void initState(){
    textEditingControlleruser = TextEditingController();
    textEditingControllerpassword = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
              Color(0xFF1A1D37),
              Color(0xFF1A1D37),
              Color(0xFF1B1D3B),
              Color(0xFF1B1D3B),
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container(), flex: 1,),
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('images/img.png')),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35),
                  topLeft: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Welcome Back!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Sign in to continue",
              style: TextStyle(
                  color: Color(0xFFC0BEC6),
                  fontSize: 18,
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18.0, left: 18.0),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: textEditingControlleruser,
                decoration: const InputDecoration(
                  hintText: 'User Name',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(right: 18.0, left: 18.0),
              child: TextField(
                obscureText: true,
                toolbarOptions: const ToolbarOptions(
                  copy: true,
                ),
                style: const TextStyle(color: Colors.white),
                controller: textEditingControllerpassword,
                decoration: const InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                alignment: Alignment.center,
                child: const Text("Forget Password?", style: TextStyle(color: Colors.white, fontSize: 14),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: FloatingActionButton(
                  onPressed: () {
                    saver();
                  },
                  child: Icon(Icons.arrow_right_alt_rounded, color: Colors.white,),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
            Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?", style: TextStyle(color: Colors.white,fontSize: 17),),
                  TextButton(onPressed: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (_){
                     return SecondPage();
                   }));
                    }, child: const Text('SIGN UP', style: TextStyle(color: Colors.blue, fontSize: 17, fontWeight: FontWeight.w400),)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
