import 'package:blutooth_app/styles/colors.dart';
import 'package:blutooth_app/view/chat/chat_screen.dart';
import 'package:blutooth_app/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SearchBluetoothDevices extends StatefulWidget {
  @override
  _SearchBluetoothDevicesState createState() => _SearchBluetoothDevicesState();
}

class _SearchBluetoothDevicesState extends State<SearchBluetoothDevices>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Bluetooth Device Image
              Image.asset(
                'assets/bluetooth.png',
                height: height * 0.3,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              // Description Text
              Text(
                'Discover and connect to nearby Bluetooth devices seamlessly.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 40),
              // Animated Search Button
              FadeTransition(
                opacity: _fadeAnimation,
                child: GestureDetector(
                  onTap: () {
                    // Perform the Bluetooth search logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Searching for devices...')),
                    );
                    Future.delayed(Duration(seconds: 2), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: width * 0.7,
                    height: height * 0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.1),
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue.withOpacity(.5),
                          Colors.blueAccent,
                        ],
                      ),
                    ),
                    child: Text(
                      'Search Devices',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
