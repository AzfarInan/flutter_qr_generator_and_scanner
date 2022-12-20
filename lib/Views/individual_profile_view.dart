import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_rnd/Models/profile.dart';
import 'package:qr_rnd/Utils/constants.dart';

class IndividualProfile extends StatelessWidget {
  const IndividualProfile({Key? key, required this.profile}) : super(key: key);

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    final String dataString = profileToJson(profile);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profile"),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 24.0),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  profile.image,
                  height: 160,
                  width: 160,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            information(title: "Name", data: profile.name),
            information(title: "Age", data: profile.age.toString()),
            Expanded(
              child:  Center(
                child: RepaintBoundary(
                  child: QrImage(
                    data: dataString,
                    version: QrVersions.auto,
                    foregroundColor: Colors.black54,
                    embeddedImage: const AssetImage(K.insta),
                    size: MediaQuery.of(context).size.width * 0.6,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget information({required String title, required String data}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60.0),
      child: Table(
        children: [
          TableRow(
              children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$title: ",
                  style: K.textStyle,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  " $data",
                  style: K.textStyle,
                ),
              ],
            ),
          ]),
        ],
      ),
    );
  }
}
