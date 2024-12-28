import 'package:flutter/material.dart';
// import 'package:flutter_final/firebase_options.dart';
import 'package:flutter_final/question_2_widgets/ui_2.dart';
import 'package:flutter_final/widgets/Ui.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MaterialApp(
//     home: const MyPage(),
//   ));
// }

// void main() {
//   runApp(const ui2());
// }

void main() {
  testWidgets('Golden Test', (WidgetTester tester) async {
    const Widget testWidget = MaterialApp(home: ui2());
    await tester.pumpWidget(testWidget);

    await expectLater(find.byType(ui2),
        matchesGoldenFile('Screenshot 2024-12-28 125125.png'));
  });
}
