import 'package:flutter_test/flutter_test.dart';

import 'package:bt_drawer/main.dart';

void main() {
  testWidgets('DrawerHome loads correctly', (WidgetTester tester) async {
    // Build app
    await tester.pumpWidget(const MyApp());

    // Kiểm tra AppBar
    expect(find.text('BÀI TẬP FLUTTER'), findsOneWidget);

    // Mở Drawer
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();

    // Kiểm tra menu trong Drawer
    expect(find.text('MENU BÀI TẬP'), findsOneWidget);
    expect(find.text('Bài 1 - Hello'), findsOneWidget);
    expect(find.text('Bài 12 - Login API'), findsOneWidget);
  });
}
