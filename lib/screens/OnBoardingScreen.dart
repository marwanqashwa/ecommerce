import 'package:ecommerce/screens/LogInScreen.dart';
import 'package:flutter/material.dart';
import 'Splash.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingPages = [
    {
      'title': 'Discover More',
      'description': 'Uncover exciting products that match your style.\nStart exploring and grab exclusive offers now!',
      'image': 'assets/images/onboarding1.jpg'
    },
    {
      'title': 'Personalize Your Journey',
      'description': 'Customize your shopping experience with tailored recommendations.\nFind items that suit your taste perfectly.',
      'image': 'assets/images/onboarding2.jpg'
    },
    {
      'title': 'Seamless Checkout',
      'description': 'Enjoy a fast and secure checkout process.\nGet your orders delivered quickly and reliably to your door.',
      'image': 'assets/images/onboarding3.jpg'
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingPages.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingPage(
                title: onboardingPages[index]['title']!,
                description: onboardingPages[index]['description']!,
                imagePath: onboardingPages[index]['image']!,
              );
            },
          ),

          Positioned(
            bottom: 50,
            right: 20,
            child: GestureDetector(
              onTap: () {
                if (_currentPage == onboardingPages.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                } else {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _currentPage == onboardingPages.length - 1
                      ? Icons.check
                      : Icons.arrow_forward,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      height: 10,
      width: _currentPage == index ? 25 : 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: _currentPage == index
            ? const Color.fromARGB(255, 235, 106, 67)
            : Colors.grey,
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const OnboardingPage({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Image.asset(imagePath, height: 220),
          SizedBox(height: 40),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}