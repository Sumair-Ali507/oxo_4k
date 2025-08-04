import 'package:flutter/material.dart';

import '../../config/routes/routes_name.dart';
import 'package:oxo_4k/views/settings/presentation/widegets/setting_item.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: const SafeArea(
        child: _SettingsContent(),
      ),
    );
  }
}

class _SettingsContent extends StatelessWidget {
  const _SettingsContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 24),
            _SettingsSection(
              title: 'Modes',
              items: [
                _SettingsItem(title: 'Video', onTap: ()=> Navigator.pushNamed(context, RoutesName.videoSettingsScreen),),
                _SettingsItem(title: 'Photo',
                  onTap: () => Navigator.pushNamed(context, RoutesName.photoInfoScreen),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _SettingsSection(
              title: 'Global',
              items: [
                _SwitchSettingsItem(title: 'Image 180°'),
                 _SettingsItem(title: 'SD Card',onTap: ()=> Navigator.pushNamed(context, RoutesName.sdCardInfoScreen),),
                const _SettingsItem(title: 'WiFi Password'),
                _SettingsItem(title: 'Camera Info',onTap: () => Navigator.pushNamed(context, RoutesName.cameraInfoScreen),),
              ],
            ),
          ],
        ),
      ),
    );
  }
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
      title: Text(title,
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xff14181B),
          fontWeight: FontWeight.normal,
        ),
      ),
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap ?? () {},
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      minVerticalPadding: 16,
    );
  }
}
class _SwitchSettingsItemState extends State<_SwitchSettingsItem> {
  bool _isToggled = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      trailing: Switch(
        value: _isToggled,
        onChanged: (value) {
          setState(() {
            _isToggled = value;
          });
        },
        activeColor: Colors.white,
        activeTrackColor: Color(0xff4B39EF),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      minVerticalPadding: 16,
      onTap: () {
        setState(() {
          _isToggled = !_isToggled;
        });
      },
    );
  }
}
class _SwitchSettingsItem extends StatefulWidget {
  final String title;

  const _SwitchSettingsItem({
    required this.title,
  });

  @override
  State<_SwitchSettingsItem> createState() => _SwitchSettingsItemState();
}
class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const _SettingsSection({
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFFF1F4F8),
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff57636C),
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Column(
          children: [
            for (int i = 0; i < items.length; i++) ...[
              items[i],
              if (i < items.length)
                const Divider(height: 0, indent: 16, endIndent: 16),
            ],
          ],
        ),

      ],
    );
  }
}







