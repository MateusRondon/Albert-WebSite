import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_albert_app/main.dart';

void main() {
  testWidgets('Adiciona tarefa e atualiza contador', (WidgetTester tester) async {
    await tester.pumpWidget(const AlbertPlannerApp());

    expect(find.text('Concluídas: 0 de 0'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Estudar Flutter');
    await tester.tap(find.widgetWithText(FilledButton, 'Adicionar'));
    await tester.pumpAndSettle();

    expect(find.text('Estudar Flutter'), findsOneWidget);
    expect(find.text('Concluídas: 0 de 1'), findsOneWidget);

    await tester.tap(find.byType(Checkbox));
    await tester.pumpAndSettle();

    expect(find.text('Concluídas: 1 de 1'), findsOneWidget);
  });

  testWidgets('Mostra mensagem quando lista está vazia', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: TaskHomePage()));

    expect(find.textContaining('Sem tarefas por enquanto'), findsOneWidget);
  });
}
