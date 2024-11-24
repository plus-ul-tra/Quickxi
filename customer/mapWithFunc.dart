import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quickxi_app/customer/shippingForCustomer.dart';
import 'package:quickxi_app/driver/watingScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late int _selectedIndex = 0;
  static const LatLng _sourceLocation = LatLng(37.282470, 127.900079);
  static const LatLng _destLocation = LatLng(37.280129, 127.9120728);

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
                    Text('비용 안내',
                        style:TextStyle(
                          color: Colors.black,
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
                    Text('거리 : 1.8 km (16,000원)',
                      style: TextStyle(
                        fontSize: 15,
                        //fontWeight: FontWeight.bold,
                      ),),
                    SizedBox(height: 10),
                    Text('물품 : 소형 2 개 (2,000원)',
                      style: TextStyle(
                        fontSize: 15,
                        //fontWeight: FontWeight.bold,
                      ),),
                    SizedBox(height: 10),
                    Text('예상 소요시간 : 7 분',
                      style: TextStyle(
                        fontSize: 15,
                        //fontWeight: FontWeight.bold,
                      ),),
                    SizedBox(height: 20),
                    Text('총 금액 : 18,000원',
                      style: TextStyle(
                        fontSize: 15,
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

                                backgroundColor : const Color.fromARGB(255, 0, 68, 2),
                                foregroundColor:  Colors.black,
                                minimumSize: Size(200, 40),
                              ),
                              child: Text('결제하기',
                                style: TextStyle(
                                  color: Colors.white,
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
              Padding(padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text('결제 수단',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor : const Color.fromARGB(255, 220, 219, 219),
                  foregroundColor:  Colors.black,
                  minimumSize: Size(300, 50),
                ),
                  child: Text('신용/체크카드'),
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor : const Color.fromARGB(255, 220, 219, 219),
                  foregroundColor:  Colors.black,
                  minimumSize: Size(300, 50),
                ),
                child: Text('휴대폰'),
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Shipping()),
                );
              },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor : const Color.fromARGB(255, 220, 219, 219),
                  foregroundColor:  Colors.black,
                  minimumSize: Size(300, 50),
                ),
                child: Text('만나서 결제',
                style: TextStyle(
                ),),
              ),
            ],

          )
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
                        color: Colors.black,
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
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 10),
                    Text('수령자 : 000 님',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),),
                    SizedBox(height: 10),
                    Text('예상 소요시간 : n 분',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),),
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.center,
                      child:Column(
                        children: [
                          ElevatedButton(onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor : const Color.fromARGB(255, 220, 219, 219),
                              foregroundColor:  Colors.black,
                              minimumSize: Size(200, 30),
                            ),
                            child: Text('물품 수령 완료했어요.',
                            style: TextStyle(
                              fontSize: 13,
                              //fontWeight: FontWeight.bold,
                            ),),
                          ),
                          ElevatedButton(onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor : const Color.fromARGB(255, 220, 219, 219),
                              foregroundColor:  Colors.black,
                              minimumSize: Size(200, 30),
                            ),
                            child: Text('물품을 받지 못했어요.',
                              style: TextStyle(
                                fontSize: 13,
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
                color: Colors.white,
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
      bottomNavigationBar: BottomNavigationBar(
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
    );
  }
}
