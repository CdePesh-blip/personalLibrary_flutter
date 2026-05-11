import 'package:flutter/material.dart';
import 'package:personal_library/configs/colors.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brownColor, // Dark earthy background
      body: SizedBox(
        width: 400,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                // The Profile Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(
                      0.05,
                    ), // Subtle glass effect
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.settings, color: Color(0xFFB0926A)),
                      ),
                      const CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(
                          'assets/images/oilpaint profile   .jpg',
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Peshy',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'pshaly@gmail.com',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'About me:',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      const Text(
                        'A fan of novels',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      const SizedBox(height: 25),
                      // Edit Profile Button
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFB0926A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Edit profile',
                            style: TextStyle(
                              color: Color(0xFF694f27),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: _buildBottomNav(),
    );
  }

  // Widget _buildBottomNav() {
  //   return BottomNavigationBar(
  //     type: BottomNavigationBarType.fixed,
  //     backgroundColor: Colors.transparent,
  //     elevation: 0,
  //     selectedItemColor: Colors.white,
  //     unselectedItemColor: Colors.white54,
  //     showSelectedLabels: false,
  //     showUnselectedLabels: false,
  //     items: const [
  //       BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: ''),
  //       BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
  //       BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
  //       BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: ''),
  //       BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
  //     ],
  //   );
  // }
}
