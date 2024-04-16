import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF212124), Color(0xFF212124)],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0x00F1B7B7), Color(0x66000000)],
                stops: [0.7095, 1.7123],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Color(0x00F742AF), Color(0x66000000)],
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
                      "Авторизация",
                      style: TextStyle(fontSize: 32, color: Color.fromARGB(255, 255, 255, 255))),
                    ),
                    SizedBox(height: 40), 
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        labelText: 'Username или email',
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
                        labelText: 'Пароль',
                        labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Обработка забытого пароля
                        },
                        child: Text('Забыли пароль?',
                        style: TextStyle(color: Color.fromRGBO(115, 153, 250, 1)),),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Обработка нажатия кнопки
                      },
                      child: Text(
                        'ВОЙТИ',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: Size(double.infinity, 50), 
                      ),
                    ),
                    SizedBox(height: 16),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 14, color: Colors.white), 
                        children: <TextSpan>[
                          TextSpan(text: 'Нет аккаунта? '),
                          TextSpan(
                            text: 'Создайте новый аккаунт!',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color.fromRGBO(115, 153, 250, 1)),
                            // recognizer: TapGestureRecognizer()
                            //   ..onTap = () {
                            //     Navigator.push(context, MaterialPageRoute(builder: (context) => YourRegisterPage()));
                            //   },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}