import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Path Pilot",
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded, color: Colors.black87),
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.person, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting Section
            const Text(
              "Hi Manthan!",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 4),
            Text(
              "Let’s plan your career path today.",
              style: TextStyle(fontSize: 16, color: Colors.blueGrey.shade400),
            ),

            const SizedBox(height: 30),

            // Quick Actions Section
            Row(
              children: [
                _buildQuickCard(
                  context,
                  "Career\nCounseling",
                  Icons.psychology_rounded,
                  Colors.blue,
                  () => Navigator.pushNamed(context, '/counseling_onboarding'),
                ),
                const SizedBox(width: 12),
                _buildQuickCard(
                  context,
                  "Explore\nCourses",
                  Icons.menu_book_rounded,
                  Colors.orange,
                  () {},
                ),
                const SizedBox(width: 12),
                _buildQuickCard(
                  context,
                  "Find\nColleges",
                  Icons.school_rounded,
                  Colors.green,
                  () {},
                ),
              ],
            ),

            const SizedBox(height: 35),

            // Trending Courses Section
            _buildSectionHeader("Trending Courses", "See all"),
            const SizedBox(height: 15),
            _buildHorizontalCourseList([
              {"title": "Data Science", "image": "assets/images/img3.jpg"},
              {"title": "UI/UX Design", "image": "assets/images/img4.jpg"},
              {"title": "AI & ML", "image": "assets/images/img5.jpg"},
            ]),

            const SizedBox(height: 35),

            // Explore by Stream Section
            _buildSectionHeader("Explore by Stream", ""),
            const SizedBox(height: 10),
            _buildStreamCard("Science", "PCB, PCM & more", Icons.biotech_rounded, Colors.purple),
            _buildStreamCard("Commerce", "Accounts, Finance", Icons.account_balance_wallet_rounded, Colors.blue),
            _buildStreamCard("Arts", "History, Design", Icons.palette_rounded, Colors.orange),

            const SizedBox(height: 35),

            // Top Colleges Section
            _buildSectionHeader("Top Colleges", "See all"),
            const SizedBox(height: 15),
            _buildHorizontalCollegeList(["IIT Delhi", "BITS Pilani", "SRM University", "MIT"]),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickCard(BuildContext context, String title, IconData icon, Color color, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: color.withOpacity(0.08),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color.withOpacity(0.1)),
          ),
          child: Column(
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String actionText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87)),
        if (actionText.isNotEmpty)
          Text(actionText, style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _buildHorizontalCourseList(List<Map<String, String>> courses) {
    return SizedBox(
      height: 160,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: courses.length,
        separatorBuilder: (_, __) => const SizedBox(width: 15),
        itemBuilder: (context, index) {
          return Container(
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade50,
              border: Border.all(color: Colors.grey.shade100),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.asset(courses[index]["image"]!, height: 90, width: 140, fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    courses[index]["title"]!,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStreamCard(String title, String subtitle, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(subtitle, style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
            ],
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildHorizontalCollegeList(List<String> colleges) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: colleges.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return Chip(
            backgroundColor: Colors.white,
            side: BorderSide(color: Colors.grey.shade200),
            label: Text(colleges[index], style: const TextStyle(fontWeight: FontWeight.w500)),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          );
        },
      ),
    );
  }
}
