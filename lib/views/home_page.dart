import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vk/constants/app_sizes.dart';
import 'package:vk/models/note.dart';
import 'package:vk/provider/riverpod_providers.dart';



class HomePage extends StatelessWidget {
  HomePage({super.key});

  final textControl = TextEditingController();
  final textControl1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          title: Text('Note App'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Consumer(
              builder: (context, ref, child) {
                final notes = ref.watch(todoProvider);

                return Column(
                  children: [
                    AppSizes.gapH12,
                    TextFormField(
                      controller: textControl,

                      onFieldSubmitted: (val) {

                        final note = Note(
                            title: val.trim(),
                            createdAt: DateTime.now().toString()
                        );
                        ref.read(todoProvider.notifier).noteAdd(note);
                        textControl.clear();
                      },
                      decoration: InputDecoration(
                          hintText: 'Add some',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.today)
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: notes.length,
                            itemBuilder: (context, index){
                              final note = notes[index];
                              return ListTile(
                                title: Text(note.title),
                                subtitle: Text(note.createdAt),
                                trailing: Container(
                                    width: 100,
                                    child: Row(
                                      children: [
                                        IconButton(

                                            onPressed: (){
                                              showDialog(context: context, builder: (context){
                                                return AlertDialog(
                                                  title: Text('Edit'),
                                                  content: TextFormField(
                                                    controller: textControl1..text = note.title,
                                               ),
                                                  actions: [
                                                    TextButton(onPressed: (){
                                                      final newNote = Note(
                                                          title: textControl1.text.trim(),
                                                          createdAt: note.createdAt
                                                      );
                                                      Navigator.of(context).pop();
                                                      ref.read(todoProvider.notifier).noteUpdate(newNote);
                                                    }, child: Text('Update')),
                                                    TextButton(onPressed: (){
                                                      Navigator.of(context).pop();
                                                    }, child: Text('Cancel'))
                                                  ],
                                                );
                                              });

                                            }, icon:Icon(Icons.edit)),
                                        IconButton(
                                            onPressed: (){
                                              showDialog(context: context, builder: (context){
                                                return AlertDialog(
                                                  title: Text('Hold ON'),
                                                  content: Text('Are You sure ?'),
                                                  actions: [
                                                    TextButton(onPressed: (){
                                                      Navigator.pop(context);
                                                      ref.read(todoProvider.notifier).noteRemove(note);
                                                    }, child: Text('Yes')),
                                                    TextButton(onPressed: (){
                                                      Navigator.pop(context);
                                                    }, child: Text('No')),
                                                  ],
                                                );
                                              });
                                            }, icon:Icon(Icons.delete)),
                                      ],
                                    )),
                              );
                            })
                    )
                  ],
                );
              }
          ),
        )
    );
  }
}