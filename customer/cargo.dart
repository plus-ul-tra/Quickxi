import 'package:flutter/material.dart';
import 'package:quickxi_app/customer/mapWithFunc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CargoScreen(),
    );
  }
}

class CargoScreen extends StatefulWidget {
  const CargoScreen({Key? key}) : super(key: key);

  @override
  _CargoScreenState createState() => _CargoScreenState();
}

class _CargoScreenState extends State<CargoScreen> {
  List<bool> _isChecked1 = [false, false, false, false];
  List<bool> _isChecked2 = [false, false, false, false];
  final List<String> _checkboxTitles1 = ['서류, 초소형', '소형 (+2,000원)', '중형 (+5,000원)', '대형 (+10,000원)'];
  final List<String> _checkboxTitles2 = ['귀중품이에요.', '깨지기 쉬워요.', '신선제품이에요.', '전자제품이에요.'];
  String _selectedTitle1 = '';
  List<String> _selectedTitles2 = [];
  String _quantity = '';

  void _onCheckBoxChanged(int group, int index, bool? value) {
    setState(() {

      if (group == 1) {
        for (int i = 0; i < _isChecked1.length; i++) {
          _isChecked1[i] = false;
        }
        _isChecked1[index] = value!;
        _selectedTitle1 = _isChecked1[index] ? _checkboxTitles1[index] : '';
      } else if (group == 2) {
        _isChecked2[index] = value!;
        if (_isChecked2[index]) {
          _selectedTitles2.add(_checkboxTitles2[index]);
        } else {
          _selectedTitles2.remove(_checkboxTitles2[index]);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '화물 등록',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 0, 68, 2),
      ),
      body: Padding(
        padding: EdgeInsets.all(26.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30),

            ...List.generate(_checkboxTitles1.length, (index) {
              return CheckboxListTile(
                title: Text(_checkboxTitles1[index]),
                value: _isChecked1[index],
                onChanged: (bool? value) {
                  _onCheckBoxChanged(1,index, value);
                },
              );
            }),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  _quantity = value;
                });
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '수량',
                border: OutlineInputBorder(),
                // 크기조절
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              ),
            ),
            Text('---------------------------------',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey
            ),),

            ...List.generate(_checkboxTitles2.length, (index) {
              return CheckboxListTile(
                title: Text(_checkboxTitles2[index]),
                value: _isChecked2[index],
                onChanged: (bool? value) {
                  _onCheckBoxChanged(2, index, value);
                },
              );
            }),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapScreen()),
                );
              },
                // 회원가입 로직 처리
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Color.fromARGB(255, 0, 68, 2),
                foregroundColor: Colors.white,
                minimumSize: Size(200, 40),
              ),
              child: Text(
                '등록하기',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Spacer(
              flex: 3,
            ),
            Text(
              'quickxi',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 68, 2),
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
