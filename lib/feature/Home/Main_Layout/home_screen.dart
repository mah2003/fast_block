import 'package:fast_block/core/utils/colors.dart';
import 'package:fast_block/core/widgets/Transactions.dart';
import 'package:fast_block/core/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> transactionsData = List.generate(
        10,
        (index) => {
              'username': 'User $index',
              'dateText': '2024-02-28',
              'price': '\$${(index + 1) * 10}.00',
              'status': index % 2 == 0 ? 'Completed' : 'Pending',
            });

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'FastBlock',
              style: TextStyle(color: Colors.white),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available Balance',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.start,
                    ),
                    Row(
                      children: [
                        Text(
                          '\$1234.00',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white),
                        ),
                        InkWell(
                          child: Icon(Icons.add, color: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: CustomTextButton(text: "Send", onPressed: () {})),
                const Gap(15),
                Expanded(
                    child: CustomTextButton(text: "Recieve", onPressed: () {})),
              ],
            ),
          ),
          const Align(
            alignment: AlignmentDirectional.topStart,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Recent Transactions',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transactionsData.length,
              itemBuilder: (context, index) {
                final transaction = transactionsData[index];
                return Transactions(
                  username: transaction['username']!,
                  dateText: transaction['dateText']!,
                  price: transaction['price']!,
                  status: transaction['status']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
