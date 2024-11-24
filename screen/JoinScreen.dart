import 'package:flutter/material.dart';

class JoinScreen extends StatelessWidget {
  const JoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 68, 2),
      appBar: AppBar(
        title: Text('회원가입',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: Color.fromARGB(255, 0, 68, 2),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(
              flex: 1,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.white),
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
                border: UnderlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'ID',
                labelStyle: TextStyle(color: Colors.white),
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
                border: UnderlineInputBorder(),
              ),
              obscureText: true, // 비밀번호 숨기기
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                labelStyle: TextStyle(color: Colors.white),
                border: UnderlineInputBorder(),
              ),
              obscureText: true, // 비밀번호 숨기기
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // 회원가입 로직 처리
              },
              child: Text('가입하기'),
            ),
            Spacer(
              flex: 3,
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
