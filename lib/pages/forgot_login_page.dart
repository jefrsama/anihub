import 'package:flutter/material.dart';
import 'register_page.dart'; 

class ForgotLoginPage extends StatefulWidget {
  const ForgotLoginPage({Key? key}) : super(key: key);

  @override
  _ForgotLoginPageState createState() => _ForgotLoginPageState();
}

class _ForgotLoginPageState extends State<ForgotLoginPage> {
  int _themeIndex = 0; //index to track theme

  final List<List<Color>> _colorThemes = [
    [Color(0xFF212124), Color.fromARGB(255, 33, 36, 33), Color(0x00F1B7B7), Color(0x66000000), Color(0x00F742AF), Color(0x66000000)],
    [Colors.pink[100]!, Colors.orange[200]!, Colors.pink[100]!, Colors.pink[100]!, Colors.pink[100]!, Colors.pink[100]!],
    [Colors.deepOrange[200]!, Colors.amber[200]!, Colors.deepOrange[200]!, Colors.deepOrange[200]!, Colors.deepOrange[200]!, Colors.deepOrange[200]!],
  ];

  void _changeTheme() {
    setState(() {
      _themeIndex = (_themeIndex + 1) % _colorThemes.length; // Cycle themes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [_colorThemes[_themeIndex][0], _colorThemes[_themeIndex][1]],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [_colorThemes[_themeIndex][2], _colorThemes[_themeIndex][3]],
                stops: [0.7095, 1.7123],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [_colorThemes[_themeIndex][4], _colorThemes[_themeIndex][5]],
                stops: [0.7814, 1.2221],
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    SizedBox(height: 189), 
                    Center(
                      child: Text(
                        "Введите свой почтовый адрес для кода подтверждения",
                        style: TextStyle(fontSize: 32, color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                    SizedBox(height: 40), 
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Добавить логику
                      },
                      child: Text(
                        'ВЫСЛАТЬ',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: Size(double.infinity, 50), 
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Нет аккаунта? ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RegisterPage()),
                            );
                          },
                          child: Text(
                            'Создайте новый аккаунт!',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color.fromRGBO(115, 153, 250, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeTheme,
        tooltip: 'Change Theme',
        child: Icon(Icons.color_lens),
      ),
    );
  }
}
    