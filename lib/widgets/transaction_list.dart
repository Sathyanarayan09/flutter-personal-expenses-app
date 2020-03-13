import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../modal/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTranscation;

  TransactionList(this.transaction, this.deleteTranscation);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transaction.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transaction added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.contain,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('₹ ${transaction[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transaction[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat('dd / MMM / yyyy')
                          .format(transaction[index].date),
                      style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).errorColor,
                      ),
                      onPressed: () => deleteTranscation(transaction[index].id),
                    ),
                  ),
                );
              },
              itemCount: transaction.length),
    );
  }
}

// Card(
//   child: Row(
//     children: <Widget>[
//       Container(
//         margin:
//             EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//         decoration: BoxDecoration(
//           border: Border.all(
//               color: Theme.of(context).primaryColor, width: 2),
//         ),
//         padding: EdgeInsets.all(10),
//         child: Text(
//           "\₹${transaction[index].amount}",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//             color: Theme.of(context).primaryColor,
//           ),
//         ),
//       ),
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             transaction[index].title,
//             style: Theme.of(context).textTheme.title,
//           ),
//           Text(
//             DateFormat('dd / MMM / yyyy')
//                 .format(transaction[index].date),
//             style: TextStyle(
//               color: Theme.of(context).primaryColorDark,
//             ),
//           ),
//         ],
//       )
//     ],
//   ),
// )
