// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:music_recommendation_app/models/user_model.dart';
// import 'package:music_recommendation_app/services/auth_service.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final authService = Provider.of<AuthService>(context);
//     final user = authService.currentUser;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.settings),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Profile Header
//             Container(
//               padding: const EdgeInsets.all(24),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Colors.purple.shade900,
//                     Colors.black,
//                   ],
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   CircleAvatar(
//                     radius: 50,
//                     backgroundImage: user?.photoURL != null
//                         ? NetworkImage(user!.photoURL!)
//                         : const AssetImage('assets/images/default_avatar.png')
//                             as ImageProvider,
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     user?.displayName ?? 'Music Lover',
//                     style: const TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     user?.email ?? '',
//                     style: const TextStyle(color: Colors.white70),
//                   ),
//                   const SizedBox(height: 16),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       _buildStatItem('124', 'Songs'),
//                       _buildStatItem('24', 'Artists'),
//                       _buildStatItem('45', 'Hours'),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             // Music Preferences
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Music Preferences',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Wrap(
//                     spacing: 8,
//                     runSpacing: 8,
//                     children: [
//                       'Pop',
//                       'Rock',
//                       'Hip Hop',
//                       'Electronic',
//                       'Jazz',
//                       'R&B',
//                       'Indie',
//                     ].map((genre) {
//                       return Chip(
//                         label: Text(genre),
//                         backgroundColor: Colors.purple.withOpacity(0.2),
//                         labelStyle: const TextStyle(color: Colors.white),
//                       );
//                     }).toList(),
//                   ),
//                 ],
//               ),
//             ),

//             // Listening Stats
//             Container(
//               margin: const EdgeInsets.all(16),
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white10,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Listening Stats',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   _buildStatRow('Total Listening Time', '45h 30m'),
//                   _buildStatRow('Favorite Genre', 'Pop'),
//                   _buildStatRow('Most Played Artist', 'The Weeknd'),
//                   _buildStatRow('Discovery Score', '85%'),
//                 ],
//               ),
//             ),

//             // Settings
//             Container(
//               margin: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white10,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 children: [
//                   _buildSettingItem(
//                     Icons.palette,
//                     'Theme',
//                     'Dark',
//                     () {},
//                   ),
//                   _buildSettingItem(
//                     Icons.notifications,
//                     'Notifications',
//                     'On',
//                     () {},
//                   ),
//                   _buildSettingItem(
//                     Icons.privacy_tip,
//                     'Privacy',
//                     '',
//                     () {},
//                   ),
//                   _buildSettingItem(
//                     Icons.help,
//                     'Help & Support',
//                     '',
//                     () {},
//                   ),
//                   _buildSettingItem(
//                     Icons.logout,
//                     'Sign Out',
//                     '',
//                     () => authService.signOut(),
//                     isLogout: true,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildStatItem(String value, String label) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Column(
//         children: [
//           Text(
//             value,
//             style: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           Text(
//             label,
//             style: const TextStyle(color: Colors.white70),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildStatRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: const TextStyle(color: Colors.white70)),
//           Text(value, style: const TextStyle(color: Colors.white)),
//         ],
//       ),
//     );
//   }

//   Widget _buildSettingItem(
//     IconData icon,
//     String title,
//     String subtitle,
//     VoidCallback onTap, {
//     bool isLogout = false,
//   }) {
//     return ListTile(
//       leading: Icon(
//         icon,
//         color: isLogout ? Colors.red : Colors.white70,
//       ),
//       title: Text(
//         title,
//         style: TextStyle(
//           color: isLogout ? Colors.red : Colors.white,
//         ),
//       ),
//       subtitle: subtitle.isNotEmpty
//           ? Text(
//               subtitle,
//               style: const TextStyle(color: Colors.white54),
//             )
//           : null,
//       trailing: const Icon(Icons.chevron_right, color: Colors.white54),
//       onTap: onTap,
//     );
//   }
// }