import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickxi_app/customer/map.dart';
import 'package:quickxi_app/driver/driverMapFunc.dart';
import 'package:quickxi_app/driver/watingScreen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _roleController = TextEditingController();
  //const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 68, 2),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 68, 2),
        title: Text('로그인',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(
              flex: 1,
            ),
            TextField(
              controller: _roleController,
              decoration: InputDecoration(
                labelText: '아이디',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20), // 입력 필드 간 간격
            TextField(
              obscureText: true, // 비밀번호 숨김 처리
              decoration: InputDecoration(
                labelText: '패스워드', // 입력 필드 레이블
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                String role = _roleController.text.trim().toLowerCase();
                if (role == 'guest') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapMain()),
                  );
                } else if (role == 'driver') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WaitingScreen()),
                  );
                } else {
                  // 잘못된 역할 입력 처리 (예: 알림 표시)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('올바른 역할을 입력하세요 (guest 또는 driver).')),
                  );
                }
              },
              child: Text(
                '로그인',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            TextButton(
              onPressed: () {
                print('비밀번호 찾기');
              },
              child: Text(
                '비밀번호 찾기',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              'quickxi',
              style: TextStyle(
                fontWeight: FontWeight.bold, // 글자 굵기를 bold로 설정
                color: Colors.white, // 글자 색상을 흰색으로 설정
                fontSize: 20, // 글자 크기 설정
              ),
            ),
          ],
        ),
      ),
    );
  }
}
