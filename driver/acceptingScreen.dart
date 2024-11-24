import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'driverMapFunc.dart';

class AcceptingScreen extends StatelessWidget {
  const AcceptingScreen({super.key});

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
                    //추후 목적지, 도착지 동적으로 변경
                    Text('연세대학교 미래캠퍼스 컨버젼스 홀',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                    Icon(Icons.arrow_downward_rounded, size:40),
                    Text('매지 현대아파트',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                    SizedBox(height: 100),
                    // 화물 종류 갯수,
                    Text('요청 화물 : 소형 2개',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),),
                    //가격
                    Text('가격 : 18,000원',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),),
                  ],
                ),
              ),
            ),
            //배차 수락 -> driverMapFunc.dart로
            ElevatedButton(
              onPressed: () {
                print('기사 수락 여부 창');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DriverScreen()),
                );
              },
              child: Text(
                '배차 수락',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 20),
            //배차 거절 다시 대기 화면으로
            ElevatedButton(
              onPressed: () {Navigator.pop(context);
              },
              child: Text(
                '배차 거절',
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
