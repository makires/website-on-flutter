import 'dart:io';

import 'package:flutter/material.dart';
// import 'dart:html' as html;
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ilvutikova',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> openUrl(String urlString) async {
    final urlParse = Uri.parse(urlString);
    if (Platform.isAndroid || Platform.isIOS) {
      if (await canLaunchUrl(urlParse)) {
        await launchUrl(urlParse, mode: LaunchMode.externalApplication);
      }
    }
    // else {
    //   html.window.open(urlString, "_blank");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images_for_app/climbgesh.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const Spacer(),
            // const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: ClipOval(
                      child: Image.asset('images_for_app/social_avatar.jpg'),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Татьяна Ильвутикова',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'IOS & Flutter разработчик',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Энтузиаст проекта ',
                      style: TextStyle(fontSize: 14),
                    ),
                    OnHoverWidget(
                      child: Text(
                        'ClimbGesh',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Автор ',
                      style: TextStyle(fontSize: 14),
                    ),
                    OnHoverWidget(
                      child: GestureDetector(
                        onTap: () async {
                          const urlParse = 'https://t.me/lawyer42app';
                          openUrl(urlParse);
                        },
                        child: const Text(
                          'Lawyer42',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OnHoverWidget(
                      child: GestureDetector(
                        onTap: () async {
                          const urlParse = 'https://t.me/ultaris';
                          openUrl(urlParse);
                          // html.window.open('https://t.me/ultaris', "_blank");
                        },
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(0.5),
                            child: ClipOval(
                              child: Image.asset(
                                'images_for_app/tg.png',
                                // color: Colors.amber.withOpacity(1),
                                colorBlendMode: BlendMode.modulate,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    OnHoverWidget(
                      child: GestureDetector(
                        onTap: () async {
                          const urlParse = 'https://github.com/makires';
                          openUrl(urlParse);
                        },
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.white54,
                          child: Padding(
                            padding: const EdgeInsets.all(0.5),
                            child: ClipOval(
                              child: Image.asset(
                                'images_for_app/git.png',
                                // color: Colors.white.withOpacity(0.9),
                                colorBlendMode: BlendMode.modulate,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Expanded(
                  child: Text(
                    'Created by Tatiana Ilvutikova 2020-2022, with Flutter.',
                    style: TextStyle(color: Colors.white54),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class OnHoverWidget extends StatefulWidget {
  const OnHoverWidget({super.key, required this.child});
  final Widget child;
  @override
  State<OnHoverWidget> createState() => _OnHoverWidgetState();
}

class _OnHoverWidgetState extends State<OnHoverWidget> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..scale(1.3);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: ((event) => onEntered(true)),
      onExit: ((event) => onEntered(false)),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: transform,
          child: widget.child),
    );
  }

  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}
