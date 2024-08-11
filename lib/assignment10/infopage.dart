import 'package:flutter/material.dart';

void main() => runApp(
      const MaterialApp(home: MyApp()),
    );

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(180, 75),
                      ),
                      gradient: LinearGradient(
                        colors: [Colors.deepPurple, Colors.purple],
                      ),
                    ),
                  ),
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Positioned(
                    top: 120,
                    child: Column(
                      children: [
                        const Text(
                          'Anna Avetisyan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 45.0,
                          // backgroundImage: AssetImage("assets/photos/profilep.png",)
                          child: Icon(
                            Icons.person,
                            size: 75,
                            color: Colors.deepPurple[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          buildInfoTile(Icons.person_outline_sharp, 'Anna Avetisyan'),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          buildInfoTile(Icons.calendar_month_outlined, 'Birthday'),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          buildInfoTile(Icons.smartphone, '818 123 4567'),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          buildInfoTile(Icons.camera_alt_outlined, 'Instagram account'),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          buildInfoTile(Icons.email_outlined, 'info@aplusdesign.co'),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          buildInfoTile(Icons.visibility_outlined, 'Password'),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Colors.deepPurple, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInfoTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Text(
          title,
        ),
      ),
    );
  }
}
