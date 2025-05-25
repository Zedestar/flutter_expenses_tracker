import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';

class HowToUsePage extends StatelessWidget {
  const HowToUsePage({super.key});
  final String markdownData = """
# 💸 Expense Tracker App Guide

Welcome to the **Expense Tracker App**! This guide will help you understand how to use the app effectively.

## 🚀 Getting Started

1. Open the Expense Tracker App.
2. Create a new account or log in.
3. Access your dashboard to view your financial overview.

## ➕ Adding an Expense

- Navigate to the **"Add Expense"** page.
- Enter the **amount**, **category**, and **description**.
- Click **"Save"** to record your expense.

## 📈 Viewing Reports

- Go to the **Reports** section.
- View daily, weekly, or monthly summaries.
- Filter by category or date range.

## ⚙️ Settings

- Update your **profile** and **budget limits**.
- Change your **currency** and **language preferences**.

## 🛟 Need Help?

- Contact support at `support@expensetracker.com`
- Visit our [Help Center](https://expensetracker.com/help)

---


""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('How to Use'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Markdown(
          data: markdownData,
          // styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
          //   h1: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          //   p: TextStyle(fontSize: 16),
          // ),
        ),
      ),
    );
  }
}
