import 'package:flutter/material.dart';

class SetupProfile extends StatefulWidget {
  const SetupProfile({super.key});

  @override
  State<SetupProfile> createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile> {
  String? selectedAge;
  String? selectedEducation;
  String? selectedMark;
  String? selectedState;
  bool appearedExam = false;
  String? selectedExam;

  final List<String> ageGroups = [
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
  ];
  final List<String> educationLevels = ['10th', '12th', 'Diploma'];
  final List<String> marks = [
    'Below 60',
    '60-70',
    '70-80',
    '80-90',
    '90-95',
    '95 & above',
  ];
  final List<String> states = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Setup your profile",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                "Complete your profile to get the best career recommendations tailored for you.",
                style: TextStyle(
                  color: Colors.blueGrey.shade400,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: Image.asset(
                    "assets/images/img15.jpg",
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.account_circle,
                      size: 120,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              const Text(
                "Full Name",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),

              const SizedBox(height: 8),
              _buildTextField(
                hint: "Enter your full name",
                icon: Icons.person_rounded,
              ),

              const SizedBox(height: 20),

              const Text(
                "Age",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),

              const SizedBox(height: 8),
              _buildDropdown(
                hint: "Select age",
                icon: Icons.calendar_today_rounded,
                value: selectedAge,
                items: ageGroups,
                onChanged: (val) => setState(() => selectedAge = val),
              ),

              const SizedBox(height: 20),

              const Text(
                "Select your State",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),

              const SizedBox(height: 8),

              _buildDropdown(
                hint: "Select State",
                icon: Icons.location_on_rounded,
                value: selectedState,
                items: states,
                onChanged: (val) => setState(() => selectedState = val),
              ),
              const SizedBox(height: 20),

              const Text(
                "Education Level",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),

              const SizedBox(height: 8),
              _buildDropdown(
                hint: "Select education level",
                icon: Icons.school_rounded,
                value: selectedEducation,
                items: educationLevels,
                onChanged: (val) => setState(() => selectedEducation = val),
              ),

              const SizedBox(height: 10),
              if (selectedEducation != null) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Appeared for competitive exam?",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Switch(
                        value: appearedExam,
                        activeColor: Colors.blueAccent,
                        onChanged: (val) {
                          setState(() => appearedExam = val);
                        },
                      ),
                    ],
                  ),
                ),
              ],
              if (appearedExam) ...[
                const SizedBox(height: 20),
                const Text("Exam", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                const SizedBox(height: 20),
                _buildDropdown(
                  hint: "Select Exam",
                  icon: Icons.school_rounded,
                  value: selectedExam,
                  items: ["JEE", "NEET", "JEE Main", "NEET Main"],
                  onChanged: (val) => setState(() => selectedExam = val),
                ),
                const SizedBox(height: 20),
                _buildTextFieldPhone(hint: "Enter your marks", icon: Icons.grade_rounded)
              ],

              const SizedBox(height: 20),

              const Text(
                "Marks",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),

              const SizedBox(height: 8),
              _buildDropdown(
                hint: "Select Marks",
                icon: Icons.grade_rounded,
                value: selectedMark,
                items: marks,
                onChanged: (val) => setState(() => selectedMark = val),
              ),

              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      '/counseling_onboarding',
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward_rounded),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String hint, required IconData icon}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[600]),
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.blueAccent, width: 1.5),
        ),
      ),
    );
  }

  Widget _buildTextFieldPhone({required String hint, required IconData icon}) {
    return TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[600]),
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.blueAccent, width: 1.5),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String hint,
    required IconData icon,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.blueAccent, width: 1.5),
        ),
      ),
      hint: Text(hint, style: TextStyle(color: Colors.grey[600])),
      items: items.map((String item) {
        return DropdownMenuItem(value: item, child: Text(item));
      }).toList(),
      onChanged: onChanged,
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: Colors.blueAccent,
      ),
    );
  }
}