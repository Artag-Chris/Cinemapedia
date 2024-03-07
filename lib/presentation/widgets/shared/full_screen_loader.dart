import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessage() {
    const messages = <String>[
      "Cargando...",
      "Comprando palomitas...",
      "Cargando... Populares",
      "Cargando... Nuevos estrenos",
      "Cargando... En cartelera",
      "Cargando... las bebidas",
      "Cargando... cosas para rellenar",
      "Cargando... aun mas cosas ):",
    ];
    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 10),
          const Text('espere por favor'),
          StreamBuilder(
              stream: getLoadingMessage(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text("Cargando...");
                return Text(snapshot.data!);
              })
        ],
      ),
    );
  }
}
