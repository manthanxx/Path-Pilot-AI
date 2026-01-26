import 'package:flutter/material.dart';

class Courses extends StatelessWidget {
  const Courses({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> courseList = [
      {
        "title": "Computer Science",
        "subtitle": "Engineering & Technology",
        "icon": Icons.computer_rounded,
        "color": Colors.blue,
      },
      {
        "title": "Data Science",
        "subtitle": "Analytics & Big Data",
        "icon": Icons.analytics_rounded,
        "color": Colors.orange,
      },
      {
        "title": "Business Admin",
        "subtitle": "Management & Leadership",
        "icon": Icons.business_center_rounded,
        "color": Colors.green,
      },
      {
        "title": "Digital Marketing",
        "subtitle": "Marketing & Social Media",
        "icon": Icons.ads_click_rounded,
        "color": Colors.purple,
      },
      {
        "title": "UI/UX Design",
        "subtitle": "Design & User Experience",
        "icon": Icons.brush_rounded,
        "color": Colors.pink,
      },
      {
        "title": "Psychology",
        "subtitle": "Behavioral Science",
        "icon": Icons.psychology_rounded,
        "color": Colors.teal,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
            size: 20,
          ),
        ),
        title: const Text(
          "Explore Courses",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search courses...",
                  prefixIcon: const Icon(Icons.search_rounded, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.blueAccent, width: 1),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                itemCount: courseList.length,
                itemBuilder: (context, index) {
                  final course = courseList[index];
                  return _buildCourseCard(
                    course["title"],
                    course["subtitle"],
                    course["icon"],
                    course["color"],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseCard(
    String title,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(icon, color: color, size: 28),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}