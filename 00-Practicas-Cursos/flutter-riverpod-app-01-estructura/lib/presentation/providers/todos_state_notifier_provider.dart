import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/helpers/random_generator.dart';
import 'package:riverpod_app/domain/domain.dart';
import 'package:riverpod_app/presentation/providers/todo_providers.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

final todosStateNotifierProvider =
    StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  return TodosNotifier();
});

final filteredGuestProvider = Provider<List<Todo>>((ref) {
  final selectedFilter = ref.watch(todoFilterProvider);
  final todos = ref.watch(todosStateNotifierProvider);

  switch (selectedFilter) {
    case TodoFilter.all:
      return todos;
    case TodoFilter.compled:
      return todos.where((element) => element.done).toList();
    case TodoFilter.pending:
      return todos.where((element) => !element.done).toList();
  }
});

//Clase del Notifier
//Le indicamos que tipo de dato va ha manejar internamente
//en este caso selia un listado de "Todo"
class TodosNotifier extends StateNotifier<List<Todo>> {
  //Valor inicial del dato a manejar, en este caso un List de Todo
  TodosNotifier()
      : super([
          Todo(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
          Todo(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
        ]);

  void addTodo() {
    //Podemos usar el state directamente, que representa el valor del provider
    //Al ejecutar el metodo este notifica automaticamente a todos los widgets
    //sobre el cambio que se hizo
    state = [
      ...state,
      Todo(
          id: _uuid.v4(),
          description: RandomGenerator.getRandomName(),
          completedAt: null),
    ];
  }

  void toggleTodo(String id) {
    state = state.map((todo) {
      if (todo.id != id) return todo;
      if (todo.done) return todo.copyWith(completedAt: null);

      return todo.copyWith(completedAt: DateTime.now());
    }).toList();
  }
}
