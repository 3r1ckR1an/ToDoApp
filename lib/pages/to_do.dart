import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {

  final List<Map<String, dynamic>> items = [
    {"title": "Item 1", "completed": false},
    {"title": "Item 2", "completed": false}
  ];

  void completaTarefa(int index, bool? value) {
    setState(() {
      items[index]["completed"] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCF191),
      appBar: AppBar(
        title: Text(
          "TO DO",
          style: GoogleFonts.notoSansHatran(),
        ),
        backgroundColor: Color(0xFFFAE53F),
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: items.length,
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return Slidable(
            key: ValueKey(items[index]),
            endActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SizedBox(
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CustomSlidableAction(
                      borderRadius: BorderRadius.circular(12),
                      onPressed: (context) {},
                      backgroundColor: Colors.red,
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: items[index]["completed"],
                    onChanged: (value) => completaTarefa(index, value),
                  ),
                  Text(
                    items[index]["title"],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      decoration: items[index]["completed"]
                        ? TextDecoration.lineThrough
                        : TextDecoration.none
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
