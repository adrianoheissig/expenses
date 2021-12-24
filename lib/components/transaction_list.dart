// ignore_for_file: use_key_in_widget_constructors

import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemoveItem;

  const TransactionList(this.transactions, this.onRemoveItem);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Nenhuma transação foi registrada',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: constraints.maxHeight * .05,
                ),
                SizedBox(
                  height: constraints.maxHeight * .6,
                  child: Image.asset(
                    'assets/images/noDataFound.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return Dismissible(
                key: Key(tr.id.toString()),
                onDismissed: (DismissDirection direction) {
                  onRemoveItem(tr.id.toString());
                },
                secondaryBackground: Container(
                  color: Theme.of(context).primaryColor,
                  child: Align(
                    alignment: const Alignment(0.9, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Arquivar',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        const Icon(
                          Icons.archive,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                background: Container(
                  color: Theme.of(context).errorColor,
                  child: Align(
                    alignment: const Alignment(-0.9, 0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        Text(
                          'Excluir',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ],
                    ),
                  ),
                ),
                child: Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                            child: Text(
                          (tr.value as double).toStringAsFixed(2),
                        )),
                      ),
                    ),
                    title: Text(
                      tr.title.toString(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat('d MMM yy').format(
                        (tr.date as DateTime),
                      ),
                    ),
                    trailing: MediaQuery.of(context).size.width > 480
                        ? FlatButton.icon(
                            textColor: Theme.of(context).errorColor,
                            icon: const Icon(Icons.delete),
                            onPressed: () => onRemoveItem(tr.id.toString()),
                            label: const Text('Excluir'),
                          )
                        : IconButton(
                            color: Theme.of(context).errorColor,
                            icon: const Icon(Icons.delete),
                            onPressed: () => onRemoveItem(tr.id.toString()),
                          ),
                  ),
                ),
              );
            },
          );
  }
}
