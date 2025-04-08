import 'package:flutter/material.dart';
import '../widgets/common_header.dart';

class ExerciseTypesScreen extends StatelessWidget {
  const ExerciseTypesScreen({Key? key}) : super(key: key);

  Widget _buildExerciseSection(String title, List<ExerciseItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 24.0, bottom: 8.0),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 16,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return _buildExerciseItem(items[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildExerciseItem(ExerciseItem item) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[800]!,
            width: 0.5,
          ),
        ),
      ),
      child: ListTile(
        leading: Icon(
          item.icon,
          color: Colors.green[400],
          size: 24,
        ),
        title: Text(
          item.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        trailing: Icon(
          item.isFavorite ? Icons.star : Icons.star_border,
          color: item.isFavorite ? Colors.yellow[600] : Colors.grey[600],
        ),
        onTap: () {
          // Handle exercise selection
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final favoriteExercises = [
      ExerciseItem(Icons.directions_run, 'Chạy bộ', true),
      ExerciseItem(Icons.directions_walk, 'Đi bộ', true),
      ExerciseItem(Icons.directions_bike, 'Đạp xe', true),
    ];

    final otherExercises = [
      ExerciseItem(Icons.fitness_center, 'Bài tập khác', false),
      ExerciseItem(Icons.pool, 'Bơi hồ bơi', false),
      ExerciseItem(Icons.directions_run, 'Huấn luyện chạy bộ', false),
      ExerciseItem(Icons.sports_gymnastics, 'Bài tập kết hợp', false),
      ExerciseItem(Icons.waves, 'Bơi ngoài trời', false),
      ExerciseItem(Icons.hiking, 'Đi bộ đường dài', false),
      ExerciseItem(Icons.fitness_center, 'Máy tập tạ', false),
      ExerciseItem(Icons.pedal_bike, 'Đạp xe t.nhà', false),
      ExerciseItem(Icons.directions_run, 'Máy chạy bộ', false),
      ExerciseItem(Icons.sports_gymnastics, 'Máy tập elip', false),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CommonHeader(
        title: 'Bài tập thể dục của bạn',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildExerciseSection('Yêu thích', favoriteExercises),
            _buildExerciseSection('Bài tập khác', otherExercises),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle adding new exercise
        },
        backgroundColor: Colors.green[700],
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class ExerciseItem {
  final IconData icon;
  final String title;
  final bool isFavorite;

  ExerciseItem(this.icon, this.title, this.isFavorite);
}
