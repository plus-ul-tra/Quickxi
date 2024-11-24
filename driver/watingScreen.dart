import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickxi_app/driver/acceptingScreen.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 68, 2),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 68, 2),
        title: Text('',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child:Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                width: double.infinity,
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('콜 대기중 ...',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 68, 2),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),),
                  ],
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                print('기사 수락 여부 창');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AcceptingScreen()),
                );
              },
              child: Text(
                '배차수락(임시)',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            Spacer(),
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
