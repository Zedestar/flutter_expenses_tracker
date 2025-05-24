import 'package:expenses_tracker/components/banner_for_displaying_message.dart';
import 'package:expenses_tracker/data/local/db/app_db.dart';
import 'package:expenses_tracker/provider/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class IncomeItem extends StatelessWidget {
  IncomeItem({
    super.key,
    required this.income,
  });

  final IncomeTableData income;
  final formatter = DateFormat.yMd();
  final categoricalItem = {
    "mahindi": Icons.grass,
    "alizeti": Icons.wb_sunny,
    "mbaazi": Icons.spa,
    "others": Icons.category,
  };

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(income.id),
      onDismissed: (direction) {
        Provider.of<AppDatabaseProvider>(context, listen: false)
            .db
            .deleteIncome(income.id);
        customMaterialBanner(
            context: context,
            message: "Item ${income.incomeName} deleted successful",
            actionText: "OK");
      },
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/view-income',
            arguments: income.id,
          );
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 15,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      income.incomeName.toString(),
                    ),
                    Spacer(),
                    Text(
                      income.incomeAmount.toString(),
                    ),
                  ],
                ),
                // Spacer(),
                Row(
                  children: [
                    Text(
                      income.incomeCategory.toString(),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(categoricalItem[income.incomeCategory]),
                        Text(formatter.format(income.incomeDate).toString()),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
