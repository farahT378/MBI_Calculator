import 'package:flutter/material.dart';
import 'dart:math';
import 'calculate.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double height = 160;
  int age = 20;
  int weight = 60;
  bool isMale = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[200],
          title: Text(
            'Calculator',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      color: !isMale ? Colors.pinkAccent[100] : Colors.grey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.female,
                            size: 60,
                          ),
                          Text('Female'),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      color: isMale ? Colors.blueAccent[100] : Colors.grey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.male,
                            size: 60,
                          ),
                          Text('Male'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: Container(
              color: Colors.orangeAccent[100],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Height'),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          'cm',
                        ),
                      ],
                    ),
                  ),
                  Slider(
                      value: height,
                      min: 80,
                      max: 200,
                      thumbColor: Colors.orange,
                      activeColor: Colors.orange[300],
                      inactiveColor: Colors.orange[100],
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      })
                ],
              ),
            )),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.lightGreen[100],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'weight',
                        ),
                        Text(
                          '$weight',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Colors.greenAccent,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(Icons.add),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            FloatingActionButton(
                              backgroundColor: Colors.greenAccent,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Icon(Icons.minimize),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    color: Colors.red[100],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Age',
                        ),
                        Text(
                          '$age',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(Icons.add),
                              backgroundColor: Colors.redAccent,
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Icon(Icons.minimize),
                              backgroundColor: Colors.redAccent,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
                onPressed: () {
                  double result = weight / pow(height / 100, 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => calculate(
                              age: age,
                              result: result.round(),
                              gender: isMale,
                            )),
                  );
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[100],
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Calculate',
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
