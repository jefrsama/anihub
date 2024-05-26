import 'package:flutter/material.dart';
import 'login_page.dart'; 
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                        "Регистрация",
                        style: TextStyle(fontSize: 32, color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                    SizedBox(height: 40), 
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: SvgPicture.string(
                              '''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4M12 8h.01"/></svg>''',
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        labelText: 'Пароль',
                        labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        labelText: 'Повторите пароль',
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
                        'ЗАРЕГИСТРИРОВАТЬСЯ',
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
                          'Уже есть аккаунт? ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          },
                          child: Text(
                            'Войти',
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