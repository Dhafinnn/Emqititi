import 'package:animated_button/animated_button.dart';
import 'package:belajarprovider/mqtt.dart';
import 'package:belajarprovider/providers/lampu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'halaman_kedua.dart';

class HalamanUtamaPage extends StatefulWidget {
  const HalamanUtamaPage({super.key});

  @override
  State<HalamanUtamaPage> createState() => _HalamanUtamaPageState();
}

class _HalamanUtamaPageState extends State<HalamanUtamaPage> {
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
  void initState() {
    jalankanMqtt(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Utama"),
      ),
      body: Center(
        child: Consumer<LampuProvider>(builder: (context, status, _) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  status.isHidup1 ? gambarMenyala1 : gambarPadam1,
                  status.isHidup2 ? gambarMenyala2 : gambarPadam2,
                  status.isHidup3 ? gambarMenyala3 : gambarPadam3,
                  status.isHidup4 ? gambarMenyala4 : gambarPadam4
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              AnimatedButton(
                child: const Text(
                  'Halaman Ke Dua',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HalamanKeduaPage()));
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
