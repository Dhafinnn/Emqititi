import 'package:animated_button/animated_button.dart';
import 'package:belajarprovider/mqtt.dart';
import 'package:belajarprovider/providers/lampu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget tombolall(String pesanMati,String pesanHidup){
  return Consumer<LampuProvider>(builder: (context, status, _) {
    return  Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedButton(
                      
                      child: Text(
                        status.isHidup ? "Matikan semua Lampu" : "Hidupkan semua Lampu",
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () {
                        if (status.isHidup) {
                          kirimPesan(pesanMati);
                        } else {
                          kirimPesan(pesanHidup);
                        }
                        status.setSemuaLampu(!status.isHidup);
                      },
                    ),
                  ],
                );
  }
  );
}