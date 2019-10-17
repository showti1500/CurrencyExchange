import 'package:currency/model/currency.dart';
import 'package:currency/network/apiservice.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  ApiService apiService;

  @override
  void initState() {
    apiService = ApiService();
    super.initState();
  }

  // List<String> lsprice = ['1,531.8','94.236','18.086','408.40','17.363'];
  List<String> lscoun = [
    'USD',
    'SGN',
    'EUR',
    'CNY',
    'JPY',
    'CZK',
    'RUB',
    'GBP',
    'THB'
  ];
  List<String> lspng = [
    'https://currency.morgrowe.com/images/flag-icons-256/usd.png',
    'https://currency.morgrowe.com/images/flag-icons-256/sgd.png',
    'https://currency.morgrowe.com/images/flag-icons-256/eur.png',
    'https://currency.morgrowe.com/images/flag-icons-256/cny.png',
    'https://currency.morgrowe.com/images/flag-icons-256/jpy.png',
    'https://currency.morgrowe.com/images/flag-icons-256/czk.png',
    'https://currency.morgrowe.com/images/flag-icons-256/rub.png',
    'https://currency.morgrowe.com/images/flag-icons-256/gbp.png',
    'https://currency.morgrowe.com/images/flag-icons-256/thb.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Currency Exchange')),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: apiService.getData(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? _buildList(snapshot.data)
              : new Center(
                  child: Text('Data not include!'),
                );
        },
      ),
    );
  }

  Widget _buildList(data) {
    Currency cur = data;
    var res = cur.getString();
    DateTime now = DateTime.now();
    String formattedDate = now.toString();
    formattedDate = formattedDate.substring(0, 16);
    print(formattedDate);

    return Container(
      padding: EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              color: Colors.orange,
              child: Text(
                '$formattedDate',
              )),
          Expanded(
            child: Center(
              child: ListView.builder(
                itemCount: res.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    String price = res[index];
                    String name = lscoun[index];
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConvertExchange(
                                  price: price,
                                  name: name,
                                )));
                  },
                  child: Container(
                    height: 70.0,
                    child: Card(
                      elevation: 3.0,
                      margin: EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image.network(lspng[index]),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 10.0),
                                child: Text(lscoun[index]),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 160.0),
                                child: Text(res[index] + ' MMK'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ConvertExchange extends StatefulWidget {
  String price;
  String name;

  ConvertExchange({Key key, this.price, this.name}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ConvertExchange();
}

class _ConvertExchange extends State<ConvertExchange> {
  final _toEdit = TextEditingController();

  String test;

  @override
  void initState() {
    test = widget.price;
    super.initState();
  }

  @override
  void dispose() {
    _toEdit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    test = test.replaceAll(new RegExp(r','), '');

    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Exchange'),
      ),
      body: Container(
          padding: EdgeInsets.all(30),
          height: 400.0,
          width: 400.0,
          child: Center(
            child: Card(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Convert To ' + widget.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20.0, top: 30.0),
                      child: Text(
                        widget.name,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20.0, top: 30.0),
                      child: Text('MMK'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _toEdit,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20.0),
                          border: InputBorder.none,
                          hintText: 'Enter amount ${widget.name}',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Text(test),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () {
                        //_doSomething();
                        double fvalue = double.parse(widget.price.replaceAll(r',', '')) * int.parse(_toEdit.text);
                        setState(() {
                          test = fvalue.toStringAsFixed(2);
                          print(test);
                        });
                      },
                      child: Text('Convert'.toUpperCase()),
                    )
                  ],
                )
              ],
            )),
          )),
    );
  }
}
