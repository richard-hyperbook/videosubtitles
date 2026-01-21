class MDPurchaseItems {
  String? name;
  String? description;
  String? quantity;
  UnitAmount? unitAmount;

  MDPurchaseItems(
      {this.name, this.description, this.quantity, this.unitAmount});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    if (this.unitAmount != null) {
      data['unit_amount'] = this.unitAmount!.toJson();
    }
    return data;
  }
}

class UnitAmount {
  String? currencyCode;
  String? value;

  UnitAmount({this.currencyCode, this.value});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency_code'] = this.currencyCode;
    data['value'] = this.value;
    return data;
  }
}
