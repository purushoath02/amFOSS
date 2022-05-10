import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown),
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Color.fromARGB(255, 216, 204, 199),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Color.fromARGB(255, 216, 204, 199),

      pages: [
        PageViewModel(
          title: "Yoga SURGE",
          body: "Welcome to Yoga World\n Inhale the Future exhale the past",
          image: _buildImage('page1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "healthy Freak Exercise",
          body: "Letting go of the hardest asana",
          image: _buildImage('page2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Cycling",
          body:
              "You cannot always control what \n goes on outside . But you can \n always control the inside",
          image: _buildImage('page3.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Meditation",
          body: "The longest Journey starts with a single step",
          image: _buildImage('page4.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      showNextButton: false,
      showDoneButton: true,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.white,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome',
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
            title: const Text('Welcome'),
            backgroundColor: Color.fromARGB(255, 216, 204, 199)),
        body: Column(
          children: <Widget>[
            Container(
              color: Color.fromARGB(255, 255, 255, 255),
              child: new Image.asset('assets/welcome.png'),
              alignment: Alignment.center,
            ),
            Container(
              color: Color.fromARGB(255, 255, 255, 255),
              //alignment: Alignment.center,
              child: Text("My Name is G Purushoath",
                  style: TextStyle(fontSize: 25)),
            ),
            Container(
              color: Color.fromARGB(255, 255, 255, 255),
              //alignment: Alignment.center,
              child: Text("I'm a student at Amrita School of Engineering",
                  style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
            )
          ],
        ),
      ),
      color: Color.fromARGB(255, 255, 255, 255),
    );
  }
}
