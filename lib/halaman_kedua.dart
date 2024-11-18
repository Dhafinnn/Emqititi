import 'package:animated_button/animated_button.dart';
import 'package:belajarprovider/mqtt.dart';
import 'package:belajarprovider/providers/lampu_provider.dart';
import 'package:belajarprovider/tombolAll.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HalamanKeduaPage extends StatefulWidget {
  const HalamanKeduaPage({
    super.key,
  });

  @override
  State<HalamanKeduaPage> createState() => _HalamanKeduaPageState();
}

class _HalamanKeduaPageState extends State<HalamanKeduaPage> {
  final gambarMenyala1 = Image.asset(
    "assets/img/menyala.png",
    width: 80,
    height: 80,
  );

  final gambarPadam1 = Image.asset(
    "assets/img/padam.png",
    width: 80,
    height: 80,
  );

  final gambarMenyala2 = Image.asset(
    "assets/img/menyala.png",
    width: 80,
    height: 80,
  );

  final gambarPadam2 = Image.asset(
    "assets/img/padam.png",
    width: 80,
    height: 80,
  );

  final gambarMenyala3 = Image.asset(
    "assets/img/menyala.png",
    width: 80,
    height: 80,
  );

  final gambarPadam3 = Image.asset(
    "assets/img/padam.png",
    width: 80,
    height: 80,
  );

  final gambarMenyala4 = Image.asset(
    "assets/img/menyala.png",
    width: 80,
    height: 80,
  );

  final gambarPadam4 = Image.asset(
    "assets/img/padam.png",
    width: 80,
    height: 80,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Kedua"),
      ),
      body: Center(
        child: Consumer<LampuProvider>(builder: (context, status, _) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: AnimatedButton(
                        height: 200,
                        width: 200,
                        onPressed: () {
                          if (status.isHidup1) {
                            kirimPesan("0222");
                          } else {
                            kirimPesan("1222");
                          }
                          status.statusLampu1(!status.isHidup1);
                        },
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          const SizedBox(height: 20),
                          status.isHidup1 ? gambarMenyala1 : gambarPadam1,
                          const SizedBox(height: 50),
                          Text(
                            status.isHidup1
                                ? "Matikan Lampu"
                                : "Hidupkan Lampu",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: AnimatedButton(
                        height: 200,
                        width: 200,
                        onPressed: () {
                          if (status.isHidup2) {
                            kirimPesan("2022");
                          } else {
                            kirimPesan("2122");
                          }
                          status.statusLampu2(!status.isHidup2);
                        },
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          const SizedBox(height: 20),
                          status.isHidup2 ? gambarMenyala2 : gambarPadam2,
                          const SizedBox(height: 50),
                          Text(
                            status.isHidup2
                                ? "Matikan Lampu"
                                : "Hidupkan Lampu",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: AnimatedButton(
                        height: 200,
                        width: 200,
                        onPressed: () {
                          if (status.isHidup3) {
                            kirimPesan("2202");
                          } else {
                            kirimPesan("2212");
                          }
                          status.statusLampu3(!status.isHidup3);
                        },
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          const SizedBox(height: 20),
                          status.isHidup3 ? gambarMenyala3 : gambarPadam3,
                          const SizedBox(height: 50),
                          Text(
                            status.isHidup3
                                ? "Matikan Lampu"
                                : "Hidupkan Lampu",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: AnimatedButton(
                        height: 200,
                        width: 200,
                        onPressed: () {
                          if (status.isHidup4) {
                            kirimPesan("2220");
                          } else {
                            kirimPesan("2221");
                          }
                          status.statusLampu4(!status.isHidup4);
                        },
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          const SizedBox(height: 20),
                          status.isHidup4 ? gambarMenyala4 : gambarPadam4,
                          const SizedBox(height: 50),
                          Text(
                            status.isHidup4
                                ? "Matikan Lampu"
                                : "Hidupkan Lampu",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
                tombolall("0000", "1111")
              ],
            ),
          );
        }),
      ),
    );
  }
}
