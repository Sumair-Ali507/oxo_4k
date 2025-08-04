import 'package:flutter/material.dart';

class FOVScreen extends StatefulWidget {
  const FOVScreen({super.key});

  @override
  State<FOVScreen> createState() => _ResolutionScreenState();
}

class _ResolutionScreenState extends State<FOVScreen> {
  final List<String> resolutions = [
    '4K/60',
    '4K/30',
    '1080/60',
    '1080/30',
  ];
  final Set<String> selectedResolutions = <String>{};

  @override
  void initState() {
    super.initState();
    // No default selection for checkboxes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("FOV",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),),

            Expanded(
              child: resolutions.isEmpty
                  ? const Center(child: Text('No resolutions available'))
                  : ListView.builder(
                itemCount: resolutions.length,
                itemBuilder: (context, index) {
                  final resolution = resolutions[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          resolution,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Text(
                          _getResolutionDescription(resolution),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        trailing: Checkbox(
                          activeColor: Color(0xff4B39EF),

                          value: selectedResolutions.contains(resolution),
                          onChanged: (value) {
                            setState(() {
                              if (value!) {
                                selectedResolutions.add(resolution);
                              } else {
                                selectedResolutions.remove(resolution);
                              }
                            });
                          },
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                      const Divider(height: 1),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  TextButton(
                    onPressed: selectedResolutions.isEmpty
                        ? null
                        : () {
                      Navigator.of(context).pop(selectedResolutions.toList());
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                    ),
                    child: const Text(
                      'Confirm',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getResolutionDescription(String resolution) {
    switch (resolution) {
      case '4K/60':
        return '';
      case '4K/30':
        return '';
      case '1080/60':
        return '';
      case '1080/30':
        return '';
      default:
        return '';
    }
  }
}