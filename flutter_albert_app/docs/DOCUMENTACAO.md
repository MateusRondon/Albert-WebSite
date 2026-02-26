# Documentação Técnica — Albert Planner

## 1. Objetivo

O **Albert Planner** é um app Flutter para planejamento diário. A proposta é oferecer uma base simples e extensível para gerenciamento de tarefas pessoais.

## 2. Arquitetura

O app usa arquitetura enxuta com `StatefulWidget`:

- `AlbertPlannerApp`: configuração global do app (`MaterialApp`, tema, rota inicial).
- `TaskHomePage`: tela principal com lógica de estado da lista de tarefas.
- `Task`: modelo de domínio com `title` e `completed`.

## 3. Fluxo funcional

1. Usuário digita uma tarefa no `TextField`.
2. Aciona botão **Adicionar**.
3. Método `_addTask()` valida e adiciona item na lista.
4. Tarefas são renderizadas em `ListView.builder`.
5. `Checkbox` altera estado de conclusão (`_toggleTask`).
6. Ícone de lixeira remove item (`_removeTask`).

## 4. Regras de negócio implementadas

- Não adiciona tarefa vazia.
- Contador exibe tarefas concluídas versus total.
- Tarefa concluída recebe estilo com `lineThrough`.

## 5. Testes automatizados

Os testes de widget cobrem:

- Adição de tarefa e atualização do contador.
- Marcação de tarefa como concluída.
- Exibição de estado vazio.

Arquivo de teste: `test/widget_test.dart`.

## 6. Melhorias recomendadas

- Persistência local de dados (`shared_preferences`, Hive ou SQLite).
- Gerenciamento de estado com `Provider`, `Riverpod` ou `Bloc`.
- Internacionalização (i18n).
- Tema escuro e acessibilidade aprimorada.
