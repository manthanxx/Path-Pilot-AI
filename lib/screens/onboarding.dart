import 'dart:async';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late ScrollController _scrollController1;
  late ScrollController _scrollController2;
  late ScrollController _scrollController3;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _scrollController1 = ScrollController();
    _scrollController2 = ScrollController();
    _scrollController3 = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startScrolling();
    });
  }

  void _startScrolling() {
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (_scrollController1.hasClients) {
        if (_scrollController1.offset >= _scrollController1.position.maxScrollExtent) {
          _scrollController1.jumpTo(_scrollController1.position.minScrollExtent);
        } else {
          _scrollController1.animateTo(
            _scrollController1.offset + 1,
            duration: const Duration(milliseconds: 50),
            curve: Curves.linear,
          );
        }
      }

      if (_scrollController2.hasClients) {
        if (_scrollController2.offset <= _scrollController2.position.minScrollExtent) {
          _scrollController2.jumpTo(_scrollController2.position.maxScrollExtent);
        } else {
          _scrollController2.animateTo(
            _scrollController2.offset - 1,
            duration: const Duration(milliseconds: 50),
            curve: Curves.linear,
          );
        }
      }

      if (_scrollController3.hasClients) {
        if (_scrollController3.offset >= _scrollController3.position.maxScrollExtent) {
          _scrollController3.jumpTo(_scrollController3.position.minScrollExtent);
        } else {
          _scrollController3.animateTo(
            _scrollController3.offset + 1,
            duration: const Duration(milliseconds: 50),
            curve: Curves.linear,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController1.dispose();
    _scrollController2.dispose();
    _scrollController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> images1 = ["assets/images/img9.jpg", "assets/images/img14.jpg", "assets/images/img6.jpg", "assets/images/img12.jpg"];
    final List<String> images2 = ["assets/images/img3.jpg", "assets/images/img4.jpg", "assets/images/img7.jpg", "assets/images/img11.jpg"];
    final List<String> images3 = ["assets/images/img5.jpg", "assets/images/img10.jpg", "assets/images/img13.jpg", "assets/images/img8.jpg"];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Row(
              children: [
                const Text(
                  "  Welcome to",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  " Path Pilot",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Row(
              children: [
                const Text(
                  "  Your personal career compass",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.blueGrey,
                    fontStyle: FontStyle.italic,
                  ),),
            ],),
            const SizedBox(height: 30),
            // Image Scrolling Section
            Expanded(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    _buildScrollingRow(_scrollController1, images1),
                    const SizedBox(height: 15),
                    _buildScrollingRow(_scrollController2, images2),
                    const SizedBox(height: 15),
                    _buildScrollingRow(_scrollController3, images3),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  Text("Login or Sign up", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.blueAccent),),
                  const SizedBox(height: 20),
                  TextField(
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixText: "+91 ",
                      hintText: "00000-00000",
                      prefixIcon: const Icon(Icons.phone_android, color: Colors.blueAccent),
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.black,
                        elevation: 5,
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Get Started",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward_rounded, size: 22),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildScrollingRow(ScrollController controller, List<String> images) {
    // Duplicate images to create a loop effect
    final repeatedImages = [...images, ...images, ...images];
    return SizedBox(
      height: 120,
      child: ListView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: repeatedImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: _buildImageContainer(repeatedImages[index], 160, 120),
          );
        },
      ),
    );
  }

  Widget _buildImageContainer(String assetPath, double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(assetPath),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
    );
  }
}
