import 'package:flutter/material.dart';
import 'package:oxo_4k/config/routes/routes_name.dart';

class PhotoInfo extends StatelessWidget {
  const PhotoInfo({super.key});

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
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 50),
          _SettingsItem(title: 'Resolution', onTap: ()=> Navigator.pushNamed(context, RoutesName.resolutionScreen),),
          Divider(height: 20, indent: 16, endIndent: 16,color: Colors.grey,),
          _SettingsItem(title: 'Photo'),
          Divider(height: 20, indent: 16, endIndent: 16,color: Colors.grey,),
          _SettingsItem(title: 'Camera Info'),
          Divider(height: 20, indent: 16, endIndent: 16,color: Colors.grey,),
        ],
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