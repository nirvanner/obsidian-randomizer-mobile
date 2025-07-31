import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:obsidian_randomizer/services/file_service.dart';
import 'package:obsidian_randomizer/screens/settings_screen.dart';

class RandomizerScreen extends StatefulWidget {
  const RandomizerScreen({super.key});

  @override
  State<RandomizerScreen> createState() => _RandomizerScreenState();
}

class _RandomizerScreenState extends State<RandomizerScreen> {
  String? _currentNotePath;
  String? _currentNoteContent;
  String _currentNoteTitle = '';
  String _currentNotePathDisplay = '';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    await FileService.findMdFiles();
    _showRandomNote();
  }

  Future<void> _showRandomNote() async {
    setState(() {
      _isLoading = true;
    });

    final notePath = FileService.getRandomNote();
    if (notePath != null) {
      await _loadNote(notePath);
    } else {
      setState(() {
        _currentNoteContent = 'В хранилище нет .md файлов.';
        _currentNoteTitle = 'Ошибка';
        _currentNotePathDisplay = '';
        _isLoading = false;
      });
    }
  }

  Future<void> _loadNote(String notePath) async {
    final content = await FileService.readNoteContent(notePath);
    final title = FileService.getNoteTitle(notePath);
    final pathDisplay = FileService.getNotePath(notePath);

    setState(() {
      _currentNotePath = notePath;
      _currentNoteContent = content ?? 'Ошибка чтения файла';
      _currentNoteTitle = title;
      _currentNotePathDisplay = pathDisplay;
      _isLoading = false;
    });
  }

  Future<void> _showNextNote() async {
    final notePath = FileService.getNextNote();
    if (notePath != null) {
      await _loadNote(notePath);
    }
  }

  Future<void> _showPrevNote() async {
    final notePath = FileService.getPrevNote();
    if (notePath != null) {
      await _loadNote(notePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Obsidian Randomizer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
              _initializeApp();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildNoteInfo(),
          Expanded(
            child: _buildNoteContent(),
          ),
          _buildNavigationButtons(),
        ],
      ),
    );
  }

  Widget _buildNoteInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_currentNotePathDisplay.isNotEmpty)
            Text(
              _currentNotePathDisplay,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          const SizedBox(height: 8),
          Text(
            _currentNoteTitle,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoteContent() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_currentNoteContent == null) {
      return const Center(
        child: Text(
          'Нажмите кнопку 🎲 для показа случайной заметки',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2D2F34),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Markdown(
        data: _currentNoteContent!,
        styleSheet: MarkdownStyleSheet(
          h1: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          h2: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          h3: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          p: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            height: 1.4,
          ),
          strong: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          em: const TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            onPressed: _showPrevNote,
            icon: const Icon(Icons.arrow_back),
            label: const Text('Назад'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF404244),
            ),
          ),
          ElevatedButton.icon(
            onPressed: _showRandomNote,
            icon: const Icon(Icons.casino),
            label: const Text('Случайная'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7C3AED),
            ),
          ),
          ElevatedButton.icon(
            onPressed: _showNextNote,
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Вперед'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF404244),
            ),
          ),
        ],
      ),
    );
  }
} 