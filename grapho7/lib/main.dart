import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart' as appwrite;
import 'package:appwrite/models.dart' as models;
import 'constants.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

appwrite.Client? client;
appwrite.Databases? databases;
String result = 'XXX';
appwrite.RealtimeSubscription? subscription;
appwrite.Account? account;

appwrite.Storage storage = appwrite.Storage(client!);

enum Attribute { FILENO, NAME, DATE, ALTDATE, CORRESPONDANT }

List<Item> items = [];
List<Widget> widgets = [];
List<RowObject> rows = [];
int count = 0;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  client = appwrite.Client()
      .setEndpoint(endpoint)
      .setProject(project)
      .setDevKey(devKey)
      .setSelfSigned();
  account = appwrite.Account(client!);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo 2',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class Item {
  Attribute? attribute = Attribute.FILENO;
  String content;
  TextEditingController textController = TextEditingController();
  Widget? widget;
  String label = '';
  double width = 50;
  Item({this.attribute, this.label = '', this.content = '', this.width = 50}) {
    this.textController = TextEditingController();
    items.add(this);
  }

  Widget insertTextField() {
    widget = /*GridTile(*/
        /*   header: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text('YYY'),
      ),*/
        /*child:*/ Container(
          padding: const EdgeInsets.all(3),
          color: Colors.amber,
          width: width,
          height: 20,
          child: TextFormField(
            onChanged: (value) {
              content = value;
            },
            controller: textController,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(
                fontFamily: 'Lexend Deca',
                color: const Color(0xFF95A1AC),
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
              ),
              hintText: label,
              hintStyle: TextStyle(
                fontFamily: 'Lexend Deca',
                color: const Color(0xFF95A1AC),
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFFDBE2E7),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x00000000),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x00000000),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x00000000),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                5.0,
                5.0,
                5.0,
                5.0,
              ),
            ),
            style: TextStyle(
              fontFamily: 'Lexend Deca',
              color: Colors.black, //Color(0xFF14181B),
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
            // validator: _model.textControllerValidator.asValidator(context),
          ),
          // ),
        );
    textController.text = content;
    return widget!;
  }
}

class RowObject {
  List<Item> rowItems = [];
  List<Widget> rowWidgets = [];
  int index = 0;
  RowObject(this.index, this.rowItems, this.rowWidgets);
}
/*class Row {
  List<String> row = [];
  Row(this.row);
  factory Row.fromJson(List<dynamic> data) {
    final row2 = data as List<String>;
    return Row(row2);
  }
}

class Array {
  List<Row> array = [];
  Array(this.array);
  factory Array.fromJson(List<dynamic> data) {
    final array2 = data as List<Row>;
    return Array(array2);
  }
}

class Grapho {
  Map<String, List<List<String>>>? grapho = {};
  Grapho({this.grapho});
  factory Grapho.fromJson(Map<String, dynamic> data) {
    print('(LF7)${data}');
    final grapho2 = data as Map<String, List<List<String>>>?;
    return Grapho(grapho: grapho2);
  }
}*/

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// const kGridwidth = 4;
const kGridHeight = 10;

class _MyHomePageState extends State<MyHomePage> {
  // static const kGridSize = 100;

@override
void initState(){
  super.initState();
  numberInputTextController = TextEditingController();
}
  RowObject populateRow(List<String> rowItems) {
    Item fileNo = Item(
      attribute: Attribute.FILENO,
      label: 'File number',
      content: rowItems[0],
      width: 50,
    );
    //widgets.add(fileNo.insertTextField());
    Widget fileNoWidget = fileNo.insertTextField();
    Item name = Item(
      attribute: Attribute.FILENO,
      label: 'Description',
      content: rowItems[1],
      width: 250,
    );
    // widgets.add(name.insertTextField());
    Widget nameWidget = name.insertTextField();
    Item date = Item(
      attribute: Attribute.FILENO,
      label: 'Date',
      content: rowItems[2],
      width: 70,
    );
    // widgets.add(date.insertTextField());
    Widget dateWidget = date.insertTextField();
    Item altDate = Item(
      attribute: Attribute.FILENO,
      label: 'Alt Date',
      content: rowItems[3],
      width: 70,
    );
    // widgets.add(altDate.insertTextField());
    Widget altDateWidget = altDate.insertTextField();
    Item correspondant = Item(
      attribute: Attribute.FILENO,
      label: 'Correspondant',
      content: rowItems[4],
      width: 250,
    );
    // widgets.add(correspondant.insertTextField());
    Widget correspondantWidget = correspondant.insertTextField();

    // widgets.add(ElevatedButton(onPressed: () {}, child: Text('Save')));
    RowObject  ri = RowObject(count, [fileNo, name, date, altDate, correspondant],
    [fileNoWidget, nameWidget, dateWidget, altDateWidget, correspondantWidget]);
    rows.add(ri);
    count++;
    return ri;
  }

  Future<void> loadFile() async {
    print('(LF1)');
    String sql = await rootBundle.loadString('assets/sql.txt');
    // print('(LF2)' + sql);
    // Map<String, List<List<String>>> decodedSQL = json.decode(sql);
    Map<String, dynamic> decodedSQL = json.decode(sql);
    print('(LF3)${decodedSQL.keys}....${(decodedSQL.values.first[1][2])}');
    // print('(LF4)${decodedSQL.keys}....${decodedSQL.values}');
    // print(decodedSQL);
    for (List<dynamic> yy in decodedSQL.values) {
      print('(LF8)${yy.length}');
      for (List<dynamic> xx in yy) {
        print('(LF9)${xx}');
        List<String> row = [];
        for (int i = 0; i < 5; i++) {
          row.add(xx[i] as String);
          //   print('(LF10)${i as String}');
        }
        populateRow(row);
      }
    }
  }



  Future<void> saveFile() async {
    String s = '{"sqlArray":[';
    for (int r = 0; r < rows.length; r++) {
      s = s + '[';
      for (int i = 0; i < 5; i++) {
        s = s + '"' + rows[r].rowItems[i].textController.text + '"';
        if (i < 4) {
          s = s + ',';
        }
      }
      s = s + '],\n';
    }
    s = s + ']}';
    print('(LF15)${s.length}');
    final String expandedFilename = 'grapho_a';
    models.File result = await storage.createFile(
      bucketId: graphoStorageRef.path!,
      fileId: expandedFilename,
      file: appwrite.InputFile.fromBytes(
          bytes: utf8.encode(s), filename: expandedFilename),
    );


  }

  int rowSortComparison(RowObject a, RowObject b) {
    String propertyA = a.rowItems[0].textController.text;
    String propertyB = b.rowItems[0].textController.text;
    return propertyB.compareTo(propertyA);
  }

  int maxVersion = 0;

  void updateNumber(int increment){
    maxVersion = maxVersion + increment;
  }
  TextEditingController? numberInputTextController;

  Widget insertVersionSpinner(){
    return

     Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Text('Version number:'),
    SizedBox(
    width: 100,
    child: NumberInputPrefabbed.directionalButtons(
    initialValue: maxVersion + 1,
    onChanged: (value) {
    updateNumber(value.toInt());
    },
    onIncrement: (value) {
    updateNumber(value.toInt());
    },
    onDecrement: (value) {
    updateNumber(value.toInt());
    },
    isInt: true,
    scaleHeight: 0.8,
    controller: numberInputTextController!,
    ),
    ),
    ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print('(LF13)${rows.length}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await loadFile();
                    print('(LF11)${rows.length}');
                    setState(() {});
                  },
                  child: Text('Load asset'),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.amber),
                    foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
                  ),
                ),
                SizedBox(width:50),
                insertVersionSpinner(),
                SizedBox(width:50),
                ElevatedButton(
                  onPressed: () async {
                    print('(LF21)${rows[1].rowItems[1].textController.text}...${rows[2].rowItems[2].textController.text}');
                    rows.sort(rowSortComparison);
                    print('(LF22)${rows[1].rowItems[1].textController.text}...${rows[2].rowItems[2].textController.text}');
                    setState(() {});
                  },
                  child: Text('Sort'),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.amber),
                    foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
                  ),
                ),
                SizedBox(width:50),
                ElevatedButton(
              onPressed: () async {
                await saveFile();
                print('(LF11)${widgets.length}');
                setState(() {});
              },
              child: Text('Save'),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll<Color>(Colors.amber),
                foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
              ),
            ),
              ],
            ),
            Expanded(
              child: Container(
                height: 500,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5, // number of items in each row
                    mainAxisSpacing: 8.0, // spacing between rows
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 4.0, // spacing between columns
                  ),

                  shrinkWrap: true,
                  padding: EdgeInsets.all(8.0), // padding around the grid
                  itemCount: rows.length * 5, // total number of items
                  itemBuilder: (context, index) {
                    int modulus = index % 5;
                    int rowIndex = index ~/ 5;
                    print('(LF16)${index}');
                    return  rows[rowIndex].rowWidgets[modulus];
                    // ),
                    /* )*/
                  },
                ),

                /*GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(5),
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  crossAxisCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  childAspectRatio: 4.0,
                  children: widgets,
                ),*/
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
