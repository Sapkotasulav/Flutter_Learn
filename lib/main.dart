import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'First App',
      color: Colors.blue,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of tasks and their completion state
  List<Task> tasks = [
    Task(label: "Wake up early morning"),
    Task(label: "Drink water"),
    Task(label: "Have dinner on time"),
  ];

  // Callback to update task completion
  void _updateTaskCompletion(bool isChecked, int index) {
    setState(() {
      tasks[index].isCompleted = isChecked;
    });
  }

  // Add a new task
  void _addTask() {
    setState(() {
      tasks.add(Task(label: "New task")); // Add a new task dynamically
    });
  }

  @override
  Widget build(BuildContext context) {
    int completedTasks = tasks.where((task) => task.isCompleted).length;
    int totalTasks = tasks.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('To do list.'),
      ),
      body: Column(
        children: [
          // Progress bar dynamically updates based on task completion
          Process(progress: totalTasks > 0 ? completedTasks / totalTasks : 0.0),
          TaskList(tasks: tasks, onTaskToggled: _updateTaskCompletion),
          ElevatedButton(
            onPressed: _addTask,
            child: const Text('Add Task'),
          ),
        ],
      ),
    );
  }
}

// Model class for Task
class Task {
  String label;
  bool isCompleted;

  Task({required this.label, this.isCompleted = false});
}

class Process extends StatelessWidget {
  final double progress;
  const Process({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Task completion progress."),
        LinearProgressIndicator(value: progress), // Dynamic progress value
      ],
    );
  }
}

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function(bool, int) onTaskToggled;

  const TaskList({super.key, required this.tasks, required this.onTaskToggled});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: tasks.asMap().entries.map((entry) {
        int index = entry.key;
        Task task = entry.value;
        return TaskItem(
          label: task.label,
          isChecked: task.isCompleted,
          onTaskToggled: (isChecked) => onTaskToggled(isChecked, index),
        );
      }).toList(),
    );
  }
}

class TaskItem extends StatefulWidget {
  final String label;
  final bool isChecked;
  final Function(bool) onTaskToggled;

  const TaskItem({
    super.key,
    required this.label,
    required this.isChecked,
    required this.onTaskToggled,
  });

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value!;
              widget.onTaskToggled(_isChecked); // Notify parent of the change
            });
          },
        ),
        Text(widget.label),
      ],
    );
  }
}
