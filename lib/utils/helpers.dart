// import 'package:intl/intl.dart';

// class Helpers {
//   // Format date to readable string
//   static String formatDate(DateTime date) {
//     return DateFormat('MMM dd, yyyy').format(date);
//   }

//   // Format time to readable string
//   static String formatTime(DateTime date) {
//     return DateFormat('HH:mm').format(date);
//   }

//   // Format duration in seconds to MM:SS
//   static String formatDuration(int seconds) {
//     final minutes = (seconds / 60).floor();
//     final remainingSeconds = seconds % 60;
//     return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
//   }

//   // Truncate text with ellipsis
//   static String truncateText(String text, int maxLength) {
//     if (text.length <= maxLength) return text;
//     return '${text.substring(0, maxLength)}...';
//   }

//   // Get initials from name
//   static String getInitials(String name) {
//     final names = name.split(' ');
//     if (names.length > 1) {
//       return '${names[0][0]}${names[1][0]}'.toUpperCase();
//     }
//     return name.substring(0, 2).toUpperCase();
//   }

//   // Calculate similarity percentage (for demo)
//   static double calculateSimilarity(List<String> list1, List<String> list2) {
//     if (list1.isEmpty || list2.isEmpty) return 0.0;
    
//     final set1 = list1.toSet();
//     final set2 = list2.toSet();
//     final intersection = set1.intersection(set2).length;
//     final union = set1.union(set2).length;
    
//     return intersection / union;
//   }

//   // Get color based on confidence score
//   static String getConfidenceColor(double score) {
//     if (score >= 0.8) return 'green';
//     if (score >= 0.6) return 'yellow';
//     if (score >= 0.4) return 'orange';
//     return 'red';
//   }

//   // Validate email format
//   static bool isValidEmail(String email) {
//     final emailRegex = RegExp(
//       r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
//     );
//     return emailRegex.hasMatch(email);
//   }

//   // Generate mock ID
//   static String generateMockId() {
//     return DateTime.now().millisecondsSinceEpoch.toString();
//   }

//   // Capitalize first letter
//   static String capitalize(String text) {
//     if (text.isEmpty) return text;
//     return '${text[0].toUpperCase()}${text.substring(1)}';
//   }

//   // Get greeting based on time of day
//   static String getGreeting() {
//     final hour = DateTime.now().hour;
//     if (hour < 12) return 'Good Morning';
//     if (hour < 17) return 'Good Afternoon';
//     return 'Good Evening';
//   }
// }