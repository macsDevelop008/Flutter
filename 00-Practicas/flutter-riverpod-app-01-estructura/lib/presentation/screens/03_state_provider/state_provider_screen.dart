import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    final isDarkMode = ref.watch(isDarkModeProvider);
    final name = ref.watch(randomNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
      ),
      body: Center(
          child: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          IconButton(
            // icon: const Icon( Icons.light_mode_outlined, size: 100 ),
            icon: Icon(
                isDarkMode
                    ? Icons.light_mode_outlined
                    : Icons.dark_mode_outlined,
                size: 100),
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state) {
                return !state;
              });
            },
          ),
          Text(name, style: TextStyle(fontSize: 25)),
          TextButton.icon(
            icon: const Icon(
              Icons.add,
              size: 50,
            ),
            label: Text('$counter', style: TextStyle(fontSize: 100)),
            onPressed: () {
              //Forma 1 para cambiar valor / estado
              //ref.read(counterProvider.notifier).state =  10;
              //Forma 2 para cambiar valor / estado RECOMENDADA
              //De esta forma en el parametro "state" ya se almacena el
              //valor actual de es eprovider en este caso 5
              ref.read(counterProvider.notifier).update((state) => state + 1);
            },
          ),
          const Spacer(flex: 2),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nombre aleatorio'),
        icon: const Icon(Icons.refresh_rounded),
        onPressed: () {
          ref.invalidate(randomNameProvider);
        },
      ),
    );
  }
}
