import 'package:intl/intl.dart';

class Currency {
  String rupiah(String rp) {
    final formatCurrency = new NumberFormat("#,##0.00", "id_ID");
    int _moneyCounter = int.parse(rp);
    return "Rp " + formatCurrency.format(_moneyCounter).toString();
  }
}
