import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/screens/create_account_screen.dart';
import 'package:project/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  AuthService _service = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(108, 241, 240, 240),
      appBar: AppBar(
        title: Text('Welcome to Movies Day'),
      ),



      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              
              
              Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),

              
              TextField(
                style: TextStyle(fontSize: 18),
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              SizedBox(height: 8),
              TextField(
                style: TextStyle(fontSize: 18),
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              SizedBox(height: 35),


              ElevatedButton(
                onPressed: () async {
                  bool res = await _service.login(
                    _emailController.text,
                    _passwordController.text,
                  );
                  if (res) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Logged in')),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(title: 'Movies Day'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 50), // กำหนดขนาดของปุ่ม
                  textStyle:
                      TextStyle(fontSize: 25), // กำหนดขนาดฟอนต์ของ Text ในปุ่ม
                ),
                child: Text('Login'),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CreateAccountScreen(),
                    ),
                  );
                },
                
                child: Text(
                  'Create new account>>',
                  style: TextStyle(
                    fontSize: 18, // กำหนดขนาดฟอนต์
                    color: Colors.green,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
