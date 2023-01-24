import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();

  var listTodo = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Todo List Test'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100),
              Container(
                width: 500,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  controller: textController,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    listTodo.add(textController.text);
                  });
                },
                child: const Text('Send'),
              ),
              const SizedBox(height: 100),
              ListView.builder(
                shrinkWrap: true,
                itemCount: listTodo.length,
                itemBuilder: (context, index) {
                  return Center(
                      child: Column(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.pink,
                        ),
                        onPressed: () {
                          setState(() {
                            listTodo.removeAt(index);
                          });
                        },
                        child: Text(
                          listTodo[index].toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
