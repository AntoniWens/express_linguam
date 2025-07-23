import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildSettingSection([
                _buildLabel('Wiki URL'),
                _buildTextField(),
                _buildLabel('Max Daily New Card'),
                _buildNumberField(),
                _buildLabel('Max Daily Easy Card'),
                _buildNumberField(),
                _buildLabel('Max Daily Review Card'),
                _buildNumberField(),
              ]),
              _buildSettingSection([
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildLabel('Playback Speed'),
                    const Text('1x', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))
                  ],
                ),
                Slider(
                  value: 1,
                  min: 0,
                  max: 10,
                  onChanged: (_) {},
                ),
              ]),
              _buildSettingSection([
                const Text(
                  'Auto Update',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                _buildLabel('Auto Update Word'),
                _buildNumberField(),
                _buildLabel('Auto Update Sentence'),
                _buildNumberField(),
                const SizedBox(height: 20),
                const Text(
                  'Auto update note here.',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ]),
              _buildSettingSection([
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildLabel('Font Size'),
                    const Text('A', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))
                  ],
                ),
                Slider(
                  value: 0,
                  min: 0,
                  max: 4,
                  onChanged: (_) {},
                ),
              ]),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 38,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingSection(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: children),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 4),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey),
      ),
    );
  }

  Widget _buildTextField() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      ),
    );
  }

  Widget _buildNumberField() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      ),
    );
  }
}
