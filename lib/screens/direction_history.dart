import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/provider/scan_list_provider.dart';

class DirectionHistory extends StatelessWidget {
  const DirectionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, index) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.redAccent,
        ),
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false)
              .borrarScanPorId(scans[index].id!);
        },
        child: ListTile(
          leading: const Icon(Icons.home),
          title: Text(scans[index].valor.toString()),
          subtitle: Text(scans[index].id.toString()),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
