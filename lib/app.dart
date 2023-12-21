import 'package:flutter/material.dart';
import 'package:myapp/home.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2F87CF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF2F87CF),
        title: const Text(
          "Multan",
          style: TextStyle(fontSize: 25),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.calendar_month,
              size: 30,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Icon(
                Icons.cloud,
                color: Colors.white,
                size: 230,
              ),
            ),
            const Text(
              "23\u00B0",
              style: TextStyle(
                  fontSize: 120,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Text(
              "Heavy Rain",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            const Text(
              "20 Dec 2023, 2:50PM",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  flex: 12,
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 41, 155, 248),
                        borderRadius: BorderRadius.circular(4)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.wind_power_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Wind",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                        Text(
                          "12.2km/h",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 12,
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 41, 155, 248),
                        borderRadius: BorderRadius.circular(4)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.water,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Humidity",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                        Text(
                          "50%",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  flex: 12,
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 41, 155, 248),
                        borderRadius: BorderRadius.circular(4)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.remove_red_eye,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Visibility",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                        Text(
                          "5 km",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 12,
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 41, 155, 248),
                        borderRadius: BorderRadius.circular(4)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.air,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Pressure",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                        Text(
                          "1003 mb",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const Weather(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                child: Text(
                  "Next 7 Days",
                  style: TextStyle(fontSize: 22),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
