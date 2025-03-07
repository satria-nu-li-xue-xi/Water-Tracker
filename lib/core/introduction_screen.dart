import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:project_onepercent/features/Profile/presentation/pages/profile_pages.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            decoration: PageDecoration(
                pageColor: Color.fromARGB(255, 93, 204, 252),
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                bodyTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
            title: 'Drops Water Tracker',
            body: 'Stay hydrated and track your daily water intake',
            image: Center(
              child: Image.asset('images/intro1.png'),
            )),
        PageViewModel(
            title: 'Drops Water Tracker',
            body: 'Stay hydrated and track your daily water intake',
            image: Center(
              child: Image.asset('images/intro1.png'),
            )),
        PageViewModel(
            title: 'Drops Water Tracker',
            body: 'Stay hydrated and track your daily water intake',
            image: Center(
              child: Image.asset('images/intro1.png'),
            ))
      ],
      showBackButton: true,
      back: Icon(Icons.arrow_back_ios),
      showNextButton: true,
      next: Text('Next'),
      done: const Text('Done'),
      onDone: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileView(),
            ));
      },
    );
  }
}
