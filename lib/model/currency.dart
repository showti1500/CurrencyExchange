

class Currency{

  String USD;
  String SEK;
  String NOK;
  String ILS;
  String AUD;
  String DKK;
  String RUB;
  String KWD;
  String INR;
  String BND;
  String EUR;
  String ZAR;
  String NPR;
  String CNY;
  String CHF;
  String THB;
  String PKR;
  String KES;
  String EGP;
  String BDT;
  String SAR;
  String LAK;
  String IDR;
  String KHR;
  String SGD;
  String LKR;
  String NZD;
  String JPY;
  String CZK;
  String VND;
  String PHP;
  String KRW;
  String HKD;
  String BRL;
  String MYR;
  String RSD;
  String CAD;
  String GBP;

  Currency({
    this.USD,
    this.SEK,
    this.NOK,
    this.ILS,
    this.AUD,
    this.DKK,
    this.RUB,
    this.KWD,
    this.INR,
    this.BND,
    this.EUR,
    this.ZAR,
    this.NPR,
    this.CNY,
    this.CHF,
    this.THB,
    this.PKR,
    this.KES,
    this.EGP,
    this.BDT,
    this.SAR,
    this.LAK,
    this.IDR,
    this.KHR,
    this.SGD,
    this.LKR,
    this.NZD,
    this.JPY,
    this.CZK,
    this.VND,
    this.PHP,
    this.KRW,
    this.HKD,
    this.BRL,
    this.MYR,
    this.RSD,
    this.CAD,
    this.GBP,
  });

  factory Currency.fromJson(Map<String,dynamic>map){
    return Currency(
        USD: map['USD'],
        SGD: map['SGD'],
        EUR: map['EUR'],
        CNY: map['CNY'],
        JPY: map['JPY'],
        CZK: map['CZK'],
        RUB: map['RUB'],
        GBP: map['GBP'],
        THB: map['THB'],

    );
  }

  List<String> getString(){
    List<String> ns=new List();
    ns.add(this.USD);
    ns.add(this.SGD);
    ns.add(this.EUR);
    ns.add(this.CNY);
    ns.add(this.JPY);
    ns.add(this.CZK);
    ns.add(this.RUB);
    ns.add(this.GBP);
    ns.add(this.THB);
    return ns;
  }


  

}