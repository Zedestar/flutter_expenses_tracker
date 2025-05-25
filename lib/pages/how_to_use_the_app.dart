import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';

class HowToUsePage extends StatelessWidget {
  const HowToUsePage({super.key});
  final String markdownData = """
# 🧙‍♂️💸 The Magical Expense Tracker Scroll

Welcome, brave budgeteer, to the **Enchanted Ledger of Gold**—also known as the **Expense Tracker App**! This mystical scroll shall unveil the secrets of mastering your income and expenses with ease and clarity.

---

## ✨ Getting Started on Your Quest

- 🌟 This wondrous app allows you to **record** your gold (income) and silver (expenses), and reveals a magical **summary chart** of your financial realm.
- 🏠 The **Home Page** is your base camp. Here, you can begin your journey by tapping the **➕ icon** or the magical **“Populate”** button if your records are yet to begin.
- 📜 Once you’ve conjured a record, simply **tap** it to explore the details further.
- 💰 By default, you’ll enter the **Expenses Chamber**. Look to the **bottom right corner**, where a **mystic three-bar scroll** awaits—tap it to unveil new paths:
  - **Add Expense** – To inscribe a new expense.
  - **Income Page** – To travel to the treasury of earnings.
  - **Home Page** – To return to your starting realm.

---

## ➕ Enchanting a New Expense

- 🧾 Venture to the **“Add Expense”** portal.
- 🪙 Enter the **amount**, choose a **category**, describe your quest (**description**), and specify the **date**.
- 🔮 Tap the **“Add Expenses”** button to seal your entry.
- 📊 Upon success, a **chart of elemental spending** shall appear, visualizing your expenditures in magical slices.

---

## ➕ Weaving in an Income

- 🏆 Proceed to the **“Add Income”** portal.
- 🧿 Fill in the **amount**, choose your **category**, share a **description**, and select the **date**.
- 🎯 Tap **“Add Income”** to record your earnings.
- 📈 Behold the **chart of riches**, showing you how your fortunes are growing.

---

## 📊 Summoning the Financial Report

- 🔍 Visit the **Reports Sanctum**.
- 🧙‍♂️ Here, the app unveils a **mystical pie chart** showing your **complete financial balance**—a tale of what’s been earned and what’s been spent.

---

## 🌙🌓 Shifting the Light

- 🌗 Want to change your realm’s appearance? Tap the **sun** or **moon** icon in the AppBar to toggle between **Light Mode** (Day) and **Dark Mode** (Night).

---

## 🧭 In Need of Guidance?

- 📬 Summon the sages at: `support@expensetracker.com`
- 🏛️ Visit the **[Help Center](https://expensetracker.com/help)** for additional scrolls of wisdom.

---

May your finances flourish and your gold multiply. 🏹📘




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
