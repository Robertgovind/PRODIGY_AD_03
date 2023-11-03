import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                    width: 35,
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TimerContainer(),
                        Text(
                          ':',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        TimerContainer(),
                        Text(
                          ':',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        TimerContainer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Reset'),
                          ),
                        ),
                        Container(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Start'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  child: Text('+'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TimerContainer extends StatelessWidget {
  const TimerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.black),
      child: Center(
        child: Text(
          '12',
          style: GoogleFonts.raleway(fontSize: 35),
        ),
      ),
    );
  }
}
