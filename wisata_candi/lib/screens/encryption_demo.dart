import 'package:flutter/material.dart';
import 'package:wisata_candi/helpers/encryption_helper.dart';

class EncryptionDemo extends StatefulWidget {
  const EncryptionDemo({super.key});

  @override
  State<EncryptionDemo> createState() => _EncryptionDemoState();
}

class _EncryptionDemoState extends State<EncryptionDemo> {
  final TextEditingController _textController = TextEditingController();
  String _encryptedText = '';
  String _decryptedText = '';

  void _encrypt() {
    if (_textController.text.isNotEmpty) {
      setState(() {
        _encryptedText = EncryptionHelper.encryptText(_textController.text);
        _decryptedText = '';
      });
    }
  }

  void _decrypt() {
    if (_encryptedText.isNotEmpty) {
      setState(() {
        _decryptedText = EncryptionHelper.decryptText(_encryptedText);
      });
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Enkripsi AES'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Enkripsi & Dekripsi Teks dengan AES',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: 'Masukkan Teks',
                  border: OutlineInputBorder(),
                  hintText: 'Contoh: Password123!',
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _encrypt,
                      icon: const Icon(Icons.lock),
                      label: const Text('Enkripsi'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _decrypt,
                      icon: const Icon(Icons.lock_open),
                      label: const Text('Dekripsi'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              if (_encryptedText.isNotEmpty) ...[
                const Text(
                  'Hasil Enkripsi (Base64):',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: SelectableText(
                    _encryptedText,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
              if (_decryptedText.isNotEmpty) ...[
                const SizedBox(height: 16),
                const Text(
                  'Hasil Dekripsi:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.green),
                  ),
                  child: SelectableText(
                    _decryptedText,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 24),
              Card(
                color: Colors.blue[50],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.info_outline, color: Colors.blue[700]),
                          const SizedBox(width: 8),
                          const Text(
                            'Informasi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        '• Algoritma: AES (Advanced Encryption Standard)\n'
                        '• Mode: CBC (Cipher Block Chaining)\n'
                        '• Key Length: 256 bit\n'
                        '• Output Format: Base64\n'
                        '• IV Length: 128 bit',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
