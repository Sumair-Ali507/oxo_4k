import 'package:flutter/material.dart';
import 'package:oxo_4k/views/settings/presentation/widegets/setting_item.dart';

import '../../../config/routes/routes_name.dart';


class VideoSettingsScreen extends StatelessWidget {
  const VideoSettingsScreen({super.key});

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
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Video Settings",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),),

            const SizedBox(height: 24),
            _SettingsItem(title: 'Resolution', onTap: ()=> Navigator.pushNamed(context, RoutesName.resolutionScreen)),
            Divider(height: 20, indent: 16, endIndent: 16,color: Colors.grey,),
            _SettingsItem(title: 'FOV', onTap: ()=> Navigator.pushNamed(context, RoutesName.fovScreen, )),
            Divider(height: 20, indent: 16, endIndent: 16,color: Colors.grey,),
            _SwitchSettingsItem(title: 'EIS Stabilization'),
            Divider(height: 20, indent: 16, endIndent: 16,color: Colors.grey,),
            _SwitchSettingsItem(title: 'Audio Mute'),
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
      title: Text(title),
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








