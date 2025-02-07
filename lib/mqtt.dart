
import 'dart:io';

import 'package:belajarprovider/providers/lampu_provider.dart';
import 'package:belajarprovider/void.dart';
import 'package:flutter/cupertino.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:provider/provider.dart';

final client = MqttServerClient("mqtt.eclipseprojects.io", '');
var pongCount = 0;

Future<void> jalankanMqtt(BuildContext context) async {
  client.logging(on: true);

  client.setProtocolV311();

  client.keepAlivePeriod = 20;

  client.connectTimeoutPeriod = 2000; // milliseconds

  client.onDisconnected = onDisconnected;

  client.onConnected = onConnected;

  client.onSubscribed = onSubscribed;

  String id = generateRandomString(5);

  final connMess = MqttConnectMessage()
      .withClientIdentifier("mqtt_$id")
      .withWillTopic("hematech") // If you set this you must set a will message
      .withWillMessage('Connected')
      .startClean() // Non persistent session for testing
      .withWillQos(MqttQos.atLeastOnce);
  client.connectionMessage = connMess;

  try {
    await client.connect();
  } on NoConnectionException {
    client.disconnect();
  } on SocketException {
    client.disconnect();
  }

  if (client.connectionStatus!.state == MqttConnectionState.connected) {
  } else {
    client.disconnect();
    exit(-1);
  }

  const topic = "hematech"; // Not a wildcard topic
  client.subscribe(topic, MqttQos.atMostOnce);

  client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
    final recMess = c![0].payload as MqttPublishMessage;
    String p =
       MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
    if (p.length == 4) {
    // Memeriksa setiap digit dan mengontrol lampu berdasarkan nilai digit
    if (p[0] == '1') {
      print('Menghidupkan Lampu 1');
      context.read<LampuProvider>().statusLampu1(true); // Hidupkan lampu 1
    } else if (p[0] == '0') {
      print('Mematikan Lampu 1');
      context.read<LampuProvider>().statusLampu1(false); // Matikan lampu 1
    }

    if (p[1] == '1') {
      print('Menghidupkan Lampu 2');
      context.read<LampuProvider>().statusLampu2(true); // Hidupkan lampu 2
    } else if (p[1] == '0') {
      print('Mematikan Lampu 2');
      context.read<LampuProvider>().statusLampu2(false); // Matikan lampu 2
    }

    if (p[2] == '1') {
      print('Menghidupkan Lampu 3');
      context.read<LampuProvider>().statusLampu3(true); // Hidupkan lampu 3
    } else if (p[2] == '0') {
      print('Mematikan Lampu 3');
      context.read<LampuProvider>().statusLampu3(false); // Matikan lampu 3
    }

    if (p[3] == '1') {
      print('Menghidupkan Lampu 4');
      context.read<LampuProvider>().statusLampu4(true); // Hidupkan lampu 4
    } else if (p[3] == '0') {
      print('Mematikan Lampu 4');
      context.read<LampuProvider>().statusLampu4(false); // Matikan lampu 4
    }
  } else {
    // Jika pesan tidak sesuai dengan format yang diinginkan
    print('Pesan tidak valid');
    context.read<LampuProvider>().setSemuaLampu(false); // Mematikan semua lampu
  }
  });
}

kirimPesan(String pesan){
  const pubTopic = "hematech";
  final builder = MqttClientPayloadBuilder();
  builder.addString(pesan);
  client.subscribe(pubTopic, MqttQos.exactlyOnce);
  client.publishMessage(pubTopic, MqttQos.exactlyOnce, builder.payload!);
}



infoState(){
  const pubTopic = "info_led";
  final builder = MqttClientPayloadBuilder();
  builder.addString("info");
  client.subscribe(pubTopic, MqttQos.exactlyOnce);
  client.publishMessage(pubTopic, MqttQos.exactlyOnce, builder.payload!);
}

void onSubscribed(String topic) {
  print('EXAMPLE::Subscription confirmed for topic $topic');
}

void onDisconnected() {
  print('EXAMPLE::OnDisconnected client callback - Client disconnection');
  if (client.connectionStatus!.disconnectionOrigin ==
      MqttDisconnectionOrigin.solicited) {
    print('EXAMPLE::OnDisconnected callback is solicited, this is correct');
  } else {
    print(
        'EXAMPLE::OnDisconnected callback is unsolicited or none, this is incorrect - exiting');
    exit(-1);
  }
  if (pongCount == 3) {
    print('EXAMPLE:: Pong count is correct');
  } else {
    print('EXAMPLE:: Pong count is incorrect, expected 3. actual $pongCount');
  }
}

void onConnected() {
  print(
      'EXAMPLE::OnConnected client callback - Client connection was successful');
}
