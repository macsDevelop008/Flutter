import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/todo_providers.dart';
import 'package:riverpod_app/presentation/providers/todos_state_notifier_provider.dart';

class StateNotifierScreen extends ConsumerWidget {
  const StateNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Notifier Provider'),
      ),
      body: const _TodosView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(todosStateNotifierProvider.notifier).addTodo();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _TodosView extends ConsumerWidget {
  const _TodosView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final listTodo = ref.watch(todosStateNotifierProvider);
    final listTodo = ref.watch(filteredGuestProvider);
    final currentFilter = ref.watch(todoFilterProvider);

    return Column(
      children: [
        /*const ListTile(
          title: Text('Listado de invitados'),
          subtitle: Text('Estas son las personas a invitar a la fiesta'),
        ),*/

        SegmentedButton(
          segments: const [
            ButtonSegment(value: TodoFilter.all, icon: Text('Todos')),
            ButtonSegment(value: TodoFilter.compled, icon: Text('Invitados')),
            ButtonSegment(
                value: TodoFilter.pending, icon: Text('No invitados')),
          ],
          selected: <TodoFilter>{currentFilter},
          onSelectionChanged: (value) {
            ref.read(todoFilterProvider.notifier).update((state) {
              return state = value.first;
            });
          },
        ),
        const SizedBox(height: 5),

        /// Listado de personas a invitar
        Expanded(
          child: ListView.builder(
            itemCount: listTodo.length,
            itemBuilder: (context, index) {
              final todo = listTodo[index];
              return SwitchListTile(
                  title: Text(todo.description),
                  value: todo.done,
                  onChanged: (value) {
                    ref
                        .read(todosStateNotifierProvider.notifier)
                        .toggleTodo(todo.id);
                  });
            },
          ),
        )
      ],
    );
  }
}
