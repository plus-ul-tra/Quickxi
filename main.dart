import 'package:flutter/material.dart';
import 'package:quickxi_app/customer/cargo.dart';
import 'package:quickxi_app/driver/driverMapFunc.dart';
import 'package:quickxi_app/screen/JoinScreen.dart';
import 'package:quickxi_app/screen/LoginScreen.dart';
import 'driver/watingScreen.dart';
import 'customer/map.dart';
import 'customer/mapWithFunc.dart';
import 'driver/driverMapFunc.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}

/// stless -> StatelessWidget 생성 단축키
/// StatelessWidget(HomeScreen)
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 68, 2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'asset/img/taxi.png',
          ),
          Text(
            'Quickxi',
            style: TextStyle(
              fontSize: 40.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '세상에 없던 혁신적인 택시 배달 대행',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),

              backgroundColor : Colors.white,
              foregroundColor:  Colors.black,
              minimumSize: Size(200, 40),
            ),
            child: Text('로그인',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),),
          ),
          SizedBox(
            height: 12.0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JoinScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),

              backgroundColor : Colors.white,
              foregroundColor:  Colors.black,
              minimumSize: Size(200, 40),
            ),
            child: Text('회원가입',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
          ),
          SizedBox(
            height: 12.0,
          ),
        ],
      ),
    );
  }
}
