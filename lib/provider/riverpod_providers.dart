
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vk/models/note.dart';




final numbers = Provider((ref) => 9000);

final count = StateProvider<int>((ref) => 0);


// abstract class A{
//   build();
// }
//
// class B extends A{
//   @override
//   build() {
//     return 900;
//   }
//
// }


final todoProvider = NotifierProvider<TodoProvider, List<Note>>(() => TodoProvider());



class TodoProvider extends Notifier<List<Note>>{
  @override
  List<Note> build() {
    return [];
  }

  void noteAdd(Note note){
    state = [...state, note];
  }

  void noteUpdate(Note newNote){
    state = [
      for(final n in state)
        newNote.createdAt == n.createdAt ? newNote :n
    ];
  }

  void noteRemove(Note note){
    state.remove(note);
    state = [...state];
  }

}



