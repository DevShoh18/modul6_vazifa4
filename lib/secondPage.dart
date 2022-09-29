import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController? textEditingControlleremail;
  TextEditingController? textEditingControllerusername;
  TextEditingController? textEditingControllerphonenumber;
  TextEditingController? textEditingControllerpassword;

  @override
  void initState() {
    textEditingControllerusername = TextEditingController();
    textEditingControlleremail = TextEditingController();
    textEditingControllerphonenumber = TextEditingController();
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Container(
                alignment: Alignment.center,
                child: const Text(
                  ' Create\nAccount',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w700),
                )),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,right: 20.0, left: 20),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: textEditingControllerusername,
                decoration: const InputDecoration(
                  hintText: 'User Name',
                  hintStyle:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,right: 20.0, left: 20),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: textEditingControlleremail,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  hintStyle:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,right: 20.0, left: 20),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: textEditingControllerphonenumber,
                decoration: const InputDecoration(
                  hintText: 'Phone Number',
                  hintStyle:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,right: 20.0, left: 20, ),
              child: TextField(
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                controller: textEditingControllerpassword,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  hintStyle:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              alignment: Alignment.center,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
            Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        String username = textEditingControllerusername!.text.trim();
                        String email = textEditingControlleremail!.text.trim();
                        String phone = textEditingControllerphonenumber!.text.trim();
                        String password = textEditingControllerpassword!.text.trim();
                      var box = Hive.box('box');
                      box.put('userName', username);
                      box.put('email', email);
                      box.put('phone', phone);
                      box.put('password', password);
                      },
                      child: const Text(
                        'SIGN IN',
                        style: TextStyle(color: Colors.blue, fontSize: 17),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
