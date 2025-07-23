import 'package:express_lingua/core/utils/app_colors.dart';
import 'package:flutter/material.dart';


class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.home), // ganti sesuai asset
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Akun Saya", // ganti sesuai string resources
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF757575), // gray_solid
              ),
            ),
            const SizedBox(height: 16),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Color(0xB3CFD8DC),
                    backgroundImage: AssetImage('assets/photo_profile.png'),
                  ),
                ),
                Positioned(
                  child: Visibility(
                    visible: false, // progress bar visibility
                    child: const CircularProgressIndicator(),
                  ),
                ),
                Positioned(
                  child: Visibility(
                    visible: false, // refresh icon visibility
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.refresh), // ganti dengan asset kalau perlu
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "Ukuran gambar maksimal 2MB",
              style: TextStyle(fontSize: 12, color: Colors.blue),
            ),
            const SizedBox(height: 10),
            const Text(
              "ID: 12345678",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10, // ganti dengan panjang data
                itemBuilder: (context, index) => ListTile(
                  title: Text('Item $index'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 38,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.s65b1f1, // ganti shape_button3
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "PROSES BERLANGGANAN",
                  style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
