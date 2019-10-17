
import 'package:currency/model/currency.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService{


  Future<Currency> getData() async{

    List<Currency> curr;
    Currency cur;
    String link='https://forex.cbm.gov.mm/api/latest';
    var respond = await http.get(link,
      headers: {'Accept':'application/json'}
      
    );
    print(respond.body);
    print(respond.statusCode);
    if(respond.statusCode==200){
      var data=json.decode(respond.body);
      var rest = data['rates'];
      print('Status code ==200');
      print('rates=>'+rest.length.toString());
      
      cur=Currency.fromJson(rest);
      //List<String> country = ['USD','SGD','THB','EUR','CYN'];
      
      var res=cur.getString();
      print('Length->'+res.length.toString());
      res.forEach((f)=>print(f));
      
      

    }
   
    return cur;
  }
}