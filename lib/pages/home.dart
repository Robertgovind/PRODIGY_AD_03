import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prodigy_ad_03/widgets/control_bottom.dart';
import 'package:prodigy_ad_03/widgets/timer_container.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String sMinutes = '00';
  String sSeconds = '00';
  String sMilisecond = '00';

  int minutes = 0;
  int seconds = 0;
  int miliseconds = 0;

  void startStopwatch() {
    Timer.periodic(const Duration(milliseconds: 1), (Timer) {
      incrementMilisecond();
    });
  }

  void incrementMilisecond() {
    setState(() {
      miliseconds++;
      sMilisecond = miliseconds.toString();

      if (miliseconds < 10) {
        sMilisecond = '0' + sMilisecond;
      }
      if (miliseconds > 1000) {
        setState(() {
          seconds++;
          miliseconds = 0;
        });
        if (seconds < 10) {
          sSeconds = '0' + sSeconds;
        }
        if (seconds <= 60) {
          setState(() {
            seconds++;
            sSeconds = seconds.toString();
          });
        } else {
          minutes++;
          sMinutes = minutes.toString();
          seconds = 0;
        }
        if (minutes < 10) {
          sMilisecond = '0' + sMinutes;
        }
      }
    });
  }

  void resetStopwatch() {
    setState(() {
      sMilisecond = '0';
      sSeconds = '0';
      sMinutes = '0';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/cback.jpg',
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
              child: Row(
                children: [
                  const Icon(Icons.arrow_back),
                  const SizedBox(
                    width: 45,
                  ),
                  Text(
                    'Stopwatch',
                    style: GoogleFonts.raleway(
                        fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TimerContainer(
                          text: sMinutes,
                        ),
                        const Text(
                          ':',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        TimerContainer(
                          text: sSeconds,
                        ),
                        const Text(
                          ':',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        TimerContainer(
                          text: sMilisecond,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ControlButton(
                          text: 'Start',
                          onPressed: () {
                            startStopwatch();
                          },
                        ),
                        ControlButton(
                          text: 'Reset',
                          onPressed: () {
                            resetStopwatch();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () {},
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
