// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              // judul //
              title: Text('Form Flutter'),
            ),
            body: MyPage()));
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int NISN = 0;
  String namaLengkap = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return
        // backgroundColor: Colors.deepPurple,

        Form(
      key: _formKey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text('NISN :'),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Some Text';
                          }
                          NISN = int.parse(value);
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text('Nama Lengkap :'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Some Text';
                          }
                          namaLengkap = value;
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  print('ditekan');
                  if (_formKey.currentState!.validate()) {
                    print('NISN : $NISN');
                    print('Nama lengkap : $namaLengkap');
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: SizedBox(
                      height: 50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Data Ditambahkan'),
                          Text('NISN : $NISN'),
                          Text('Nama lengkap : $namaLengkap'),
                        ],
                      ),
                    )));
                  }
                },
                child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}
