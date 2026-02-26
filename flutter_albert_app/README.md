# Albert Planner (Flutter + Dart)

Aplicativo simples de produtividade criado em **Flutter/Dart** para organizar tarefas diárias.

## Funcionalidades

- Adicionar tarefas.
- Marcar tarefas como concluídas.
- Remover tarefas.
- Indicador de progresso diário (`Concluídas: X de Y`).

## Estrutura do projeto

```text
flutter_albert_app/
├── lib/
│   └── main.dart
├── test/
│   └── widget_test.dart
├── docs/
│   └── DOCUMENTACAO.md
├── pubspec.yaml
└── analysis_options.yaml
```

## Pré-requisitos

- Flutter SDK (3.19+ recomendado)
- Dart SDK (incluído com Flutter)

Verifique:

```bash
flutter --version
flutter doctor
```

## Como executar

```bash
cd flutter_albert_app
flutter pub get
flutter run
```

## Como rodar testes

```bash
cd flutter_albert_app
flutter test
```

## Próximos passos sugeridos

- Persistir tarefas com `shared_preferences` ou SQLite.
- Adicionar categorias e prioridade.
- Criar tela de histórico semanal.
