import 'package:flutter/material.dart';

void main() {
  runApp(const AlbertPlannerApp());
}

class AlbertPlannerApp extends StatelessWidget {
  const AlbertPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Albert Planner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const TaskHomePage(),
    );
  }
}

class Task {
  Task({required this.title, this.completed = false});

  final String title;
  bool completed;
}

class TaskHomePage extends StatefulWidget {
  const TaskHomePage({super.key});

  @override
  State<TaskHomePage> createState() => _TaskHomePageState();
}

class _TaskHomePageState extends State<TaskHomePage> {
  final List<Task> _tasks = <Task>[];
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addTask() {
    final String value = _controller.text.trim();

    if (value.isEmpty) {
      return;
    }

    setState(() {
      _tasks.add(Task(title: value));
    });

    _controller.clear();
  }

  void _toggleTask(int index, bool? checked) {
    setState(() {
      _tasks[index].completed = checked ?? false;
    });
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final int completedCount = _tasks.where((Task t) => t.completed).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Albert Planner'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Plano do Dia',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Concluídas: $completedCount de ${_tasks.length}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (_) => _addTask(),
                    decoration: const InputDecoration(
                      labelText: 'Nova tarefa',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                FilledButton(
                  onPressed: _addTask,
                  child: const Text('Adicionar'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _tasks.isEmpty
                  ? const Center(
                      child: Text(
                        'Sem tarefas por enquanto.\nAdicione sua primeira meta!',
                        textAlign: TextAlign.center,
                      ),
                    )
                  : ListView.builder(
                      itemCount: _tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Task task = _tasks[index];

                        return Card(
                          child: ListTile(
                            leading: Checkbox(
                              value: task.completed,
                              onChanged: (bool? checked) => _toggleTask(index, checked),
                            ),
                            title: Text(
                              task.title,
                              style: TextStyle(
                                decoration: task.completed
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_outline),
                              onPressed: () => _removeTask(index),
                              tooltip: 'Remover tarefa',
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
