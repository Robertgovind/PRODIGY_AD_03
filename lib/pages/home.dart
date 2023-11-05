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

  Timer? timer;

  bool isStarted = false;

  void startStopwatch() {
    timer = Timer.periodic(const Duration(milliseconds: 1), (Timer) {
      incrementMilisecond();
      isStarted = true;
    });
  }

  void incrementMilisecond() {
    setState(() {
      if (miliseconds < 99) {
        miliseconds++;
        sMilisecond = miliseconds.toString();
      } else {
        incrementSecond();
      }

      if (miliseconds < 10) {
        sMilisecond = '0' + sMilisecond;
      }
    });
  }

  void incrementSecond() {
    setState(() {
      if (seconds < 59) {
        miliseconds = 0;
        sMilisecond = '00';
        seconds++;
        sSeconds = seconds.toString();
      } else {
        incrementMinutes();
      }

      if (seconds < 10) {
        sSeconds = '0' + sSeconds;
      }
    });
  }

  void incrementMinutes() {
    setState(() {
      if (seconds < 59) {
        miliseconds = 0;
        seconds = 0;
        sMilisecond = '00';
        sSeconds = '00';
        minutes++;
        sMinutes = minutes.toString();
      } else {
        miliseconds = 0;
        seconds = 0;
        minutes = 0;
        sMilisecond = '00';
        sSeconds = '00';
        sMinutes = '00';
      }

      if (minutes < 10) {
        sMinutes = '0' + sMinutes;
      }
    });
  }

  void resetStopwatch() {
    setState(() {
      timer?.cancel();
      miliseconds = 0;
      seconds = 0;
      minutes = 0;
      sMilisecond = '00';
      sSeconds = '00';
      sMinutes = '00';
      isStarted = false;
    });
  }

  void pauseStopwatch() {
    timer?.cancel();
    isStarted = false;
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
                  const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  Text(
                    'Stopwatch',
                    style: GoogleFonts.raleway(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                        color: Colors.white),
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
                          text: isStarted ? 'Pause' : 'Start',
                          onPressed: isStarted
                              ? () {
                                  pauseStopwatch();
                                }
                              : () {
                                  startStopwatch();
                                },
                          logo: isStarted ? Icons.pause : Icons.play_arrow,
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
