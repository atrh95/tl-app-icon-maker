import 'package:flutter/material.dart';
import 'package:maker/style/tl_app_icon_theme.dart';
import 'package:maker/view/tl_app_icon_painter.dart';

class ShowAppIconPage extends StatefulWidget {
  const ShowAppIconPage({super.key});

  @override
  State<ShowAppIconPage> createState() => _ShowAppIconPageState();
}

class _ShowAppIconPageState extends State<ShowAppIconPage> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    return ValueListenableBuilder<TLAppIconThemeType>(
        valueListenable: themeNotifier,
        builder: (context, themeType, _) {
          final currentTheme = themeMap[themeType]!;

          return Scaffold(
            appBar: AppBar(
              title: const Text('App Icon Preview'),
              actions: [
                PopupMenuButton<TLAppIconThemeType>(
                  onSelected: (TLAppIconThemeType value) {
                    selectedThemeType = value;
                  },
                  itemBuilder: (BuildContext context) =>
                      TLAppIconThemeType.values
                          .map((type) => PopupMenuItem<TLAppIconThemeType>(
                                value: type,
                                child: Text(type.name),
                              ))
                          .toList(),
                )
              ],
            ),
            body: Stack(
              children: [
                Center(
                    child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      width: deviceWidth,
                      height: deviceWidth,
                      decoration: BoxDecoration(
                          // gradient: LinearGradient(
                          //     begin: Alignment.topLeft,
                          //     end: Alignment.bottomRight,
                          //     colors: [Colors.amber, Colors.yellowAccent]),
                          border: Border.all(width: 1),
                          color: currentTheme.appBackgroundColor),
                    ),
                    // アプリアイコン
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: CustomPaint(
                          size: const Size(290, 290),
                          painter: TLAppIconPainter(themeType: themeType)),
                    ),
                    // つの
                    Positioned(
                      left: 120,
                      top: 20,
                      child: SizedBox(
                        width: 50,
                        height: 100,
                        child: Card(
                          elevation: 1,
                          color: currentTheme.boardColor,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 220,
                      top: 20,
                      child: SizedBox(
                        width: 50,
                        height: 100,
                        child: Card(
                          elevation: 1,
                          color: currentTheme.boardColor,
                        ),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          );
        });
  }
}
