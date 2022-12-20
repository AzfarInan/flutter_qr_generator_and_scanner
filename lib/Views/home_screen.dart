import 'package:flutter/material.dart';
import 'package:qr_rnd/Models/profile.dart';
import 'package:qr_rnd/Views/generate_screen.dart';
import 'package:qr_rnd/Views/individual_profile_view.dart';
import 'package:qr_rnd/Views/scan_screen.dart';
import 'package:qr_rnd/Widgets/primary_button.dart';
import 'package:qr_rnd/Utils/constants.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<Profile> profile = [
    Profile(id: 'cr7', name: 'Cristiano Ronaldo', age: 37, image: K.cr7),
    Profile(id: 'lm10', name: 'Lionel Messi', age: 34, image: K.lm10),
    Profile(id: 'km10', name: 'Kylian Mpbappe', age: 24, image: K.km10),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('QR Scanner & Generator'),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
              title: 'SCAN QR CODE',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Scan()),
                );
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            PrimaryButton(
              title: 'GENERATE QR CODE',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GenerateScreen()),
                );
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
          elevation: 1,
          child: ListView.builder(
              itemCount: profile.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IndividualProfile(
                              profile: profile[index],
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 16.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                profile[index].image,
                                height: 80,
                                width: 80,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Text(
                            profile[index].name,
                            style: K.textStyle,
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                );
              })),
    );
  }
}
