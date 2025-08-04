import 'package:flutter/material.dart';

class SdCardInfoScreen extends StatelessWidget {
  const SdCardInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: _CameraInfoContent(),
      ),
    );
  }
}

class _CameraInfoContent extends StatelessWidget {
  const _CameraInfoContent();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "SD Card",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          _InfoCard(
            items: [
              _InfoItem(
                label: 'SD Total Capacity',
                value: '64GB',


              ),
              _InfoItem(
                label: 'SD Capacity Left',
                value: '2GB',
              ),
            ],
          ),
          const SizedBox(height: 50),
          _SettingsItem(title: 'Delete SD Card'),
          const SizedBox(height: 20),
          Divider(
            height: 1,
            indent: 16,
            endIndent: 16,
            color: Colors.grey,
          ),
          const SizedBox(height: 20),
          _SettingsItem(title: 'Format SD Card'),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final List<_InfoItem> items;

  const _InfoCard({
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    items[i].label,
                    style: items[i].labelStyle, // Use the provided label style
                  ),
                  const SizedBox(height: 30),
                  Text(
                    items[i].value,
                    style: items[i].valueStyle, // Use the provided value style
                  ),
                ],
              ),
            ),
            if (i < items.length - 1)
              const Divider(height: 1, indent: 16, endIndent: 16),
          ],
        ],
      ),
    );
  }
}

class _InfoItem {
  final String label;
  final String value;
  final TextStyle labelStyle;
  final TextStyle valueStyle;

  const _InfoItem({
    required this.label,
    required this.value,
    this.labelStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Color(0xFF14181B), // Default grey color
    ),
    this.valueStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Color(0xFF14181B), // Default dark color
    ),
  });
}

class _SettingsItem extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _SettingsItem({
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap ?? () {},
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      minVerticalPadding: 16,
    );
  }
}