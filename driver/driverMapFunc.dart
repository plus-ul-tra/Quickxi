import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quickxi_app/driver/watingScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DriverScreen(),
    );
  }
}

class DriverScreen extends StatefulWidget {
  @override
  _DriverScreenState createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  int _selectedIndex = 0;
  static const LatLng _sourceLocation = LatLng(37.282470, 127.900079);
  static const LatLng _destLocation = LatLng(37.280129, 127.9120728);
  double _progressValue = 0.1;

  Widget _buildUI() {
    switch (_selectedIndex) {
      case 0:
        return Center(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 0,horizontal: 30),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child :
                      Text('배차 정보',
                          style:TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ))
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 35),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //거리 추후 동적값 수정
                      Text('거리 : 1.8 km (+16,000원)',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                        ),),
                      SizedBox(height: 10),
                      Text('물품 : 소형 2 개 (+2,000원)',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                        ),),
                      SizedBox(height: 10),
                      Text('예상 소요시간 : 7 분',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                        ),),
                      SizedBox(height: 20),
                      Text('총 금액 : 18,000원',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),),
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child:Column(
                            children: [
                              ElevatedButton(onPressed: (){setState(() {
                                _selectedIndex = 1;
                              });},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),

                                  backgroundColor : Colors.white,
                                  foregroundColor:  Colors.black,
                                  minimumSize: Size(200, 40),
                                ),
                                child: Text('배차 시작',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),),
                              ),
                            ],
                          )
                      ),

                    ],

                  ),
                ),


              ],

            )
        );
      case 1:
      //결제 수단
        return Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      ' 배송중',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Text(
                  '----------------------------------------------',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // 텍스트를 양 끝단에 배치
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '출발지',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '도착지',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: LinearProgressIndicator(
                    value: _progressValue,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      // n 시간 변동
                      '예상 소요 시간 : 7 분',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    child:Column(
                      children: [
                        ElevatedButton(onPressed: (){setState(() {
                          _selectedIndex = 2;
                        });},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),

                            backgroundColor : Colors.white,
                            foregroundColor:  Colors.black,
                            minimumSize: Size(200, 40),
                          ),
                          child: Text('배송 완료',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),),
                        ),
                      ],
                    )
                ),
              ],
            ),
        );
      case 2:
      //배달 완료,
        return Center(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 0,horizontal: 30),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child :
                      Text('배달을 완료하였습니다.',
                          style:TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ))
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 35),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //금액 추후 동적값 수정
                      Text('금액 : 18,000 원',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),),
                      SizedBox(height: 10),
                      Text('수령자 : guest 님',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),),
                      SizedBox(height: 10),
                      Text('소요시간 : 7 분',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),),
                      SizedBox(height: 10),
                      SizedBox(height: 50,),
                      Container(
                          alignment: Alignment.center,
                          child:Column(
                            children: [
                              ElevatedButton(onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => WaitingScreen()),
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
                                child: Text('완료.',
                                  style: TextStyle(
                                    fontSize: 20,
                                    //fontWeight: FontWeight.bold,
                                  ),),
                              ),

                            ],
                          )
                      ),

                    ],

                  ),
                ),


              ],

            )
        );

      default:
        return Center(
          child: Text('배달완료'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quicxi',
          style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 0, 68, 2),
      ),
      body: Stack(
        children: [
          // Google Map
          Positioned.fill(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _sourceLocation,
                zoom: 14,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('sourceLocation'),
                  position: _sourceLocation,
                ),
                Marker(
                  markerId: MarkerId('destinationLocation'),
                  position: _destLocation,
                ),
              },
            ),
          ),
          // UI 영역
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              child: Container(
                color: Color.fromARGB(255, 0, 68, 2),
                height: 300,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      //child:
                    ),
                    //),
                    Expanded(
                      child: _buildUI(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar:PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 0, 68, 2),
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.clear, color: Colors.transparent),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.clear, color: Colors.transparent),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.clear, color: Colors.transparent),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
