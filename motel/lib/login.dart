import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      color: Colors.yellow,
      home: const LoginPage(
        title: "Dang nhap",
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  @override
  State<LoginPage> createState() => _LoginPageState();

  final String title;
}

class _LoginPageState extends State<LoginPage> {
  _showDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('AlertDialog Title'),
            content: const Text('AlertDialog description'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Icon(
                  Icons.phone_android,
                  size: 60,
                ),

                const SizedBox(height: 40),

                //hello
                Text(
                  "XIN CHÀO!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.bebasNeue(fontSize: 52),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Chào mừng đã quay trở lại!",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),

                //user name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12.0)),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Nhập số điện thoại hoặc email",
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                //password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12.0)),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Nhập mật khẩu",
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                //login
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: InkWell(
                    onTap: () => _showDialog(context),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(12.0)),
                      child: const Center(
                        child: Text(
                          "Đăng nhập",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                //sigin
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Bạn chưa phải là thành viên?",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    InkWell(
                      child: Text(
                        " Đăng ký,",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent),
                      ),
                    ),
                    InkWell(
                      child: Text(
                        " Tiếp tục",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
