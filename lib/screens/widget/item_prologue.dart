import 'package:flutter/material.dart';

class ItemPrologue extends StatelessWidget {
  final int masteringLevel;
  final String? actor;
  final String? sentence;
  final bool useRecalling;
  final bool useTranslate;
  final String? translation;
  final bool bookmarked;

  const ItemPrologue({
    super.key,
    required this.masteringLevel,
    required this.actor,
    required this.sentence,
    required this.useRecalling,
    required this.useTranslate,
    required this.translation,
    required this.bookmarked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 64),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // viewLessonLevel
          Visibility(
            visible: masteringLevel > 0,
            child: Container(
              width: 8,
              margin: const EdgeInsets.symmetric(vertical: 8),
              height: double.infinity,
              color: _getLevelColor(masteringLevel), // implementasikan sesuai kebutuhan
            ),
          ),

          const SizedBox(width: 8),

          // contentLessonLeft
          SizedBox(
            width: 64,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  actor?.isEmpty ?? true ? 'Cinta' : actor!,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                if (sentence != null &&
                    sentence!.trim().isNotEmpty &&
                    !useRecalling)
                  IconButton(
                    onPressed: () {
                      // Implementasi speak
                    },
                    icon: const Icon(Icons.volume_up),
                    iconSize: 24,
                  ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // contentLessonRight
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // contentLessonSentence (FlexboxLayout equivalent)
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: _buildSentenceWords(sentence),
                ),

                // textLessonTranslation
                if (useTranslate &&
                    translation != null &&
                    translation!.trim().isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 4, bottom: 8, left: 8, right: 8),
                    child: Text(
                      '(${translation!})',
                      style: const TextStyle(
                        height: 1.4,
                        fontFamily: 'mgd', // pastikan font ini tersedia
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // imageBookmark
          if (bookmarked)
            Container(
              margin: const EdgeInsets.only(top: 8, right: 8),
              width: 24,
              height: 18 * 1.4,
              child: Image.asset(
                'assets/ic_bookmark_fill_24dp.png',
                fit: BoxFit.fill,
              ),
            ),
        ],
      ),
    );
  }

  /// Simulasi pemecahan kalimat menjadi kata-kata seperti FlexboxLayout
  List<Widget> _buildSentenceWords(String? sentence) {
    if (sentence == null || sentence.trim().isEmpty) return [];

    return sentence
        .split(' ')
        .map((word) => Chip(label: Text(word)))
        .toList();
  }

  /// Contoh pewarnaan level mastering
  Color _getLevelColor(int level) {
    switch (level) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
