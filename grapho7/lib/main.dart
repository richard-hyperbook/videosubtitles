import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart' as appwrite;
import 'package:appwrite/models.dart' as models;
import 'constants.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import "button.dart";
import 'package:intl/intl.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

const int versionNumber = 4;

appwrite.Client? client;
appwrite.Databases? databases;
String result = 'XXX';
appwrite.RealtimeSubscription? subscription;
appwrite.Account? account;

appwrite.Storage storage = appwrite.Storage(client!);

enum Attribute { FILENO, NAME, DATE, ALTDATE, CORRESPONDANT, SEARCH }

enum LoadType { asset, database }

List<Item> items = [];
List<Widget> widgets = [];
List<RowObject> rows = [];
int count = 0;
int matches = 0;

Item? searchItem;

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
      title: 'Grapho 7',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: MyHomePage(title: 'Grapho7 (${versionNumber.toString()})'),
      debugShowCheckedModeBanner: false,
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

  Widget insertTextField(int rowIndex) {
    widget = /*GridTile(*/
        /*   header: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text('YYY'),
      ),*/
        /*child:*/ Container(
          padding: const EdgeInsets.all(3),
          color: (rowIndex == 0)? Colors.lime : Colors.amber,
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
  List<Item>? rowItems = [];
  List<Widget>? rowWidgets = [];
  int? index = 0;
  RowObject({this.index, this.rowItems, this.rowWidgets});
}

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
  void initState() {
    super.initState();
    numberInputTextController = TextEditingController();
    searchItem = Item(
      attribute: Attribute.SEARCH,
      label: 'Search',
      content: '',
      width: 100,
    );
    _gridViewController = ScrollController(initialScrollOffset: 0.0,);
  }

  RowObject populateRow(List<String> rowItems, int rowIndex) {
    Item fileNo = Item(
      attribute: Attribute.FILENO,
      label: 'File number',
      content: rowItems[0],
      width: 50,
    );
    //widgets.add(fileNo.insertTextField());
    Widget fileNoWidget = fileNo.insertTextField(rowIndex);
    Item name = Item(
      attribute: Attribute.FILENO,
      label: 'Description',
      content: rowItems[1],
      width: 250,
    );
    // widgets.add(name.insertTextField());
    Widget nameWidget = name.insertTextField(rowIndex);
    Item date = Item(
      attribute: Attribute.FILENO,
      label: 'Date',
      content: rowItems[2],
      width: 70,
    );
    // widgets.add(date.insertTextField());
    Widget dateWidget = date.insertTextField(rowIndex);
    Item altDate = Item(
      attribute: Attribute.FILENO,
      label: 'Alt Date',
      content: rowItems[3],
      width: 70,
    );
    // widgets.add(altDate.insertTextField());
    Widget altDateWidget = altDate.insertTextField(rowIndex);
    Item correspondant = Item(
      attribute: Attribute.FILENO,
      label: 'Correspondant',
      content: rowItems[4],
      width: 250,
    );
    // widgets.add(correspondant.insertTextField());
    Widget correspondantWidget = correspondant.insertTextField(rowIndex);

    // widgets.add(ElevatedButton(onPressed: () {}, child: Text('Save')));
    RowObject ri = RowObject(
      index: count,
      rowItems: [fileNo, name, date, altDate, correspondant],
      rowWidgets: [
        fileNoWidget,
        nameWidget,
        dateWidget,
        altDateWidget,
        correspondantWidget,
      ],
    );
    rows.add(ri);
    count++;
    return ri;
  }

  Future<String?> getStorageFileDownload({models.File? file}) async {
    Uint8List bytes = await storage.getFileDownload(
      bucketId: graphoStorageRef.path!,
      fileId: file!.$id,
    );
    String s = utf8.decode(bytes);
    //>print('(XY30)${file!.$id}++++${bytes.length}****${s}');
    return s;
  }

  Future<void> loadFile(LoadType loadType) async {
    print('(LF1)');
    String sql = '';
    models.File? chosenFile;
    String? chosenFilename;
    if (loadType == LoadType.asset) {
      sql = await rootBundle.loadString('assets/sql.txt');
    } else {
      models.FileList listOfFiles = await listStorageFiles(
        bucketId: graphoStorageRef.path,
      );

      for (int i = 0; i < listOfFiles.files.length; i++) {
        String fileName = listOfFiles.files[i].name;
        List<String> splitFilename = fileName.split('_');
        if (splitFilename[1] == numberInputTextController!.text) {
          chosenFile = listOfFiles.files[i];
          chosenFilename = listOfFiles.files[i].name;
          break;
        }
      }
      //      final String expandedFilename = 'grapho_' + numberInputTextController!.text;
      if (chosenFile != null) {
        Uint8List bytes = await storage.getFileDownload(
          bucketId: graphoStorageRef.path!,
          fileId: chosenFile.$id,
        );
        sql = utf8.decode(bytes);
      }
    }
    print('(LF2)' + sql);
    // Map<String, List<List<String>>> decodedSQL = json.decode(sql);
    Map<String, dynamic> decodedSQL = json.decode(sql);
    print('(LF3)${decodedSQL.keys}....${(decodedSQL.values.first[1][2])}');
    // print('(LF4)${decodedSQL.keys}....${decodedSQL.values}');
    // print(decodedSQL);

    for (List<dynamic> yy in decodedSQL.values) {
      print('(LF8)${yy.length}');
      int rowIndex = 0;
      for (List<dynamic> xx in yy) {
        print('(LF9)${xx}');
        List<String> row = [];
        for (int i = 0; i < 5; i++) {
          row.add(xx[i] as String);
          //   print('(LF10)${i as String}');
        }
        populateRow(row, rowIndex);
        rowIndex++;
      }
    }
  }

  Future<void> saveFile() async {
    String s = '{"sqlArray":[';
    for (int r = 0; r < rows.length; r++) {
      s = s + '[';
      for (int i = 0; i < 5; i++) {
        s = s + '"' + rows[r].rowItems![i].textController.text + '"';
        if (i < 4) {
          s = s + ',';
        }
      }
      if (r == (rows.length - 1)) {
        print('(LF110)${r}');
        s = s + ']';
      } else {
        print('(LF111)${r}');
        s = s + '],\n';
      }
    }
    s = s + ']}';
    print('(LF15)${s.length}');
    final String expandedFilename = 'grapho_' + numberInputTextController!.text;
    models.File result = await storage.createFile(
      bucketId: graphoStorageRef.path!,
      fileId: expandedFilename,
      file: appwrite.InputFile.fromBytes(
        bytes: utf8.encode(s),
        filename: expandedFilename,
      ),
    );
  }

  int rowSortComparison(RowObject a, RowObject b) {
    String searchField = (searchItem!.textController.text).toLowerCase();
    String fileNoA = a.rowItems![0].textController.text;
    String fileNoB = b.rowItems![0].textController.text;
    String nameA = (a.rowItems![1].textController.text).toLowerCase();
    String nameB = (b.rowItems![1].textController.text).toLowerCase();
    if (fileNoA[0] == currentSection) {
      if (nameA.contains(searchField)) {
        fileNoA = '2#' + fileNoA;
      } else {
        fileNoA = '1#' + fileNoA;
      }
    } else {
      fileNoA = '0#' + fileNoA;
    }
    if (fileNoB[0] == currentSection) {
      if (nameB.contains(searchField)) {
        fileNoB = '2#' + fileNoB;
      } else {
        fileNoB = '1#' + fileNoB;
      }
    } else {
      fileNoB = '0#' + fileNoB;
    }
    return fileNoB.compareTo(fileNoA);
    /*
    if (searchField.length == 0) {
      if (currentSection != ' ') {
        return fileNoB.compareTo(fileNoA);
      } else {
        if ((fileNoA[0] == currentSection) && (fileNoB[0] == currentSection)) {
          return fileNoB.compareTo(fileNoA);
        } else {
          if (fileNoA[0] == currentSection) {
            return -1;
          } else {
            if (fileNoB[0] == currentSection) {
              return 1;
            }
          }
        }
      }
    } else {
      if (currentSection != ' ') {
        if ((nameA.contains(searchField)) && (nameB.contains(searchField))) {
          return fileNoB.compareTo(fileNoA);
        } else {
          if (nameA.contains(searchField)) {
            return -1;
          } else {
            if (nameB.contains(searchField)) {
              return 1;
            } else {

            }




          }
        }
      } else {
        if ((fileNoA[0] == currentSection) &&
            (fileNoB[0] == currentSection) &&
            (nameA.contains(searchField)) &&
            (nameB.contains(searchField))) {
          return fileNoB.compareTo(fileNoA);
        } else {
          if ((fileNoA[0] == currentSection) && (nameA.contains(searchField))) {
            return -1;
          } else {
            if ((fileNoB[0] == currentSection) &&
                (nameA.contains(searchField))) {
              return 1;
            }
          }
        }

      }

   */
  }

  int maxVersion = 0;

  void updateNumber(int increment) {
    maxVersion = maxVersion + increment;
  }

  TextEditingController? numberInputTextController;

  Widget insertVersionSpinner() {
    print('(LF91)${maxVersion}');
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Version number:'),
        SizedBox(
          width: 100,
          child: NumberInputPrefabbed.directionalButtons(
            key: UniqueKey(),
            //key: ValueKey(maxVersion),
            initialValue: maxVersion,
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

  Future<models.FileList> listStorageFiles({String? bucketId}) async {
    //>print('(XY6)${bucketId}');
    models.FileList fileList = models.FileList(total: 0, files: []);
    try {
      fileList = await storage.listFiles(
        bucketId: bucketId!,
        queries: [appwrite.Query.limit(1000)],
      );
      //>print('(XY7)${fileList.files.length}');
      if (fileList.files.length < 1) {
        for (models.File file in fileList.files) {
          String filename = file.name;
          //>print('(XY8)${filename}');
        }
      }
    } catch (e) {
      //>print('(XY9)${e.toString()}');
    }
    return fileList;
  }

  Future<void> setMaxVersion() async {
    models.FileList? backupFileList = await listStorageFiles(
      bucketId: graphoStorageRef.path,
    );

    for (models.File file in backupFileList!.files) {
      String filename = file.name;
      print('(LF101)${filename}&&&&');
      List<String> splitFileName = filename.split('_');
      int? greatestVersionNumber = int.tryParse(splitFileName[1]);
      maxVersion = 0;
      if (greatestVersionNumber != null) {
        if (maxVersion < greatestVersionNumber!)
          maxVersion = greatestVersionNumber;
      }
    }
    // maxVersion++;
    print('(LF102)${maxVersion}');
    // setState(() {});
    // print('(LF103)${maxVersion}');
  }

  Widget insertSearchTextField() {
    return Container(
      width: 150,
      height: 40,
      child: searchItem!.insertTextField(0),
    );
  }

  void insertInsert() {
    final f = new DateFormat('yyyy-MM-dd hh:mm');
    // String searchField = searchItem!.textController.text;
    String? topString;
    // String searchPrefix = searchField[0];
    if (currentSection != ' ') {
      topString = currentSection! + 'ZZZ';
    } else {
      topString = 'ZZZZ';
    }

    int maxNumber = 0;
    for (int i = 0; i < rows.length; i++) {
      String prefix = rows[i].rowItems![0].textController.text[0];
      if (prefix == currentSection) {
        String suffix = rows[i].rowItems![0].textController.text.substring(
          1,
          4,
        );
        int? suffixInt = int.tryParse(suffix);
        if ((suffixInt ?? 0) > maxNumber) {
          maxNumber = suffixInt ?? maxNumber;
        }
      }
    }
    print('(LF900)${maxNumber}');
    maxNumber++;
    DateTime today = DateTime.now();
    String todayStr = DateFormat('dd/MM/yyyy').format(today);
    String numberString = maxNumber.toString();
    if (maxNumber < 100) {
      numberString = '0' + numberString;
    }
    if (maxNumber < 10) {
      numberString = '0' + numberString;
    }
    populateRow([currentSection! + numberString, '', todayStr, '', ''], 0);
    rows.sort(rowSortComparison);
    setState(() {});
  }

  static const List<String> kSectionList = [
    ' ',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'Z',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];
  String? currentSection;

  Widget insertSectionSelection() {
    return DropdownButton<String>(
      /*key: ValueKey(
                    widget),
                */
      value: currentSection ?? 'H',
      hint: const Text('Section'),
      items: kSectionList.map<DropdownMenuItem<String>>((String item) {
        return DropdownMenuItem<String>(
          /*  enabled: (_checkRoleLegal(item: item,
                        currentRole: listViewConnectedUsersRecord.status!)),
                  */
          value: item,
          child: Text(item),
        );
      }).toList(),
      elevation: 2,
      onChanged: (String? value) {
        currentSection = value!;
        setState(() {});
      },
    );
  }

  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }

  ScrollController? _gridViewController;
  @override
  Widget build(BuildContext context) {
    print('(LF13)${rows.length}');
    // rebuildAllChildren(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Wrap(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*ElevatedButton(
                  onPressed: () async {
                    await loadFile(LoadType.asset);
                    print('(LF11)${rows.length}');
                    setState(() {});
                  },
                  child: Text('Load asset'),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(
                      Colors.amber,
                    ),
                    foregroundColor: WidgetStatePropertyAll<Color>(
                      Colors.black,
                    ),
                  ),
                ),*/
                // SizedBox(width: 50),
                ElevatedButton(
                  onPressed: () async {
                    await loadFile(LoadType.database);
                    print('(LF11)${rows.length}');
                    setState(() {});
                  },
                  child: Text('Load database'),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(
                      Colors.amber,
                    ),
                    foregroundColor: WidgetStatePropertyAll<Color>(
                      Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 50),
                ElevatedButton(
                  onPressed: () async {
                    await setMaxVersion();
                    print('(LF81)${maxVersion}');
                    setState(() {});
                  },
                  child: Text('Set max version'),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(
                      Colors.amber,
                    ),
                    foregroundColor: WidgetStatePropertyAll<Color>(
                      Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 50),
                insertVersionSpinner(),
                SizedBox(width: 50),
                insertSearchTextField(),
                SizedBox(width: 50),
                insertSectionSelection(),
                SizedBox(width: 50),

                // FFButtonWidget(
                //   text: 'Sort',
                //   onPressed: () async {
                //     rows.sort(rowSortComparison);
                //   },
                //   options: FFButtonOptions(
                //     color: Colors.blue,
                //     textStyle: TextStyle(color: Colors.white),
                //   ),
                // ),
                ElevatedButton(
                  onPressed: () async {
                    print(
                      '(LF21)${rows[1].rowItems![1].textController.text}...${rows[2].rowItems![2].textController.text}',
                    );
                    rows.sort(rowSortComparison);
                    matches = 0;
                    String searchField = (searchItem!.textController.text)
                        .toLowerCase();
                    for (int i = 0; i < rows.length; i++) {
                      if (currentSection == ' ') {
                        if (rows[i].rowItems![1].textController.text
                            .toLowerCase()
                            .contains(searchField)) {
                          matches = matches + 1;
                          print(
                            '(LF400)${i}....${rows[i].rowItems![1].textController.text}',
                          );
                        }
                      } else {
                        print(
                          '(LF402)${rows[i].rowItems![0].textController.text}',
                        );
                        if ((rows[i].rowItems![1].textController.text
                                .toLowerCase()
                                .contains(searchField)) &&
                            (rows[i].rowItems![0].textController.text[0] ==
                                currentSection)) {
                          matches = matches + 1;
                          print(
                            '(LF401)${i}....${rows[i].rowItems![1].textController.text}',
                          );
                        }
                      }
                    }
                    print(
                      '(LF22)${rows[1].rowItems![1].textController.text}...${rows[2].rowItems![2].textController.text}',
                    );
                    setState(() {});
                  },
                  child: Text('Sort ' + matches.toString()),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(
                      Colors.amber,
                    ),
                    foregroundColor: WidgetStatePropertyAll<Color>(
                      Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 50),
                ElevatedButton(
                  onPressed: () async {
                    insertInsert();
                  },
                  child: Text('Insert'),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(
                      Colors.amber,
                    ),
                    foregroundColor: WidgetStatePropertyAll<Color>(
                      Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 50),
                ElevatedButton(
                  onPressed: () async {
                    print(
                      '(LF500)${rows.length}....${rows[0].rowItems![0].textController.text}',
                    );
                    AwesomeDialog(
                      width: 250,
                      context: context,
                      dialogType: DialogType.question,
                      animType: AnimType.scale,
                      title: 'Delete',
                      desc: 'Delete first entry',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {
                        rows.removeAt(0);
                        print(
                          '(LF500)${rows.length}....${rows[0].rowItems![0].textController.text}',
                        );
                        setState(() {});
                      },
                    )..show();
                  },
                  child: Text('Delete'),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(
                      Colors.amber,
                    ),
                    foregroundColor: WidgetStatePropertyAll<Color>(
                      Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 50),
                ElevatedButton(
                  onPressed: () async {
                    await saveFile();
                    print('(LF11)${widgets.length}');
                    setState(() {});
                  },
                  child: Text('Save'),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(
                      Colors.amber,
                    ),
                    foregroundColor: WidgetStatePropertyAll<Color>(
                      Colors.black,
                    ),
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
                  ),controller: _gridViewController,

                  shrinkWrap: true,
                  padding: EdgeInsets.all(8.0), // padding around the grid
                  itemCount: rows.length * 5, // total number of items
                  itemBuilder: (context, index) {
                    int modulus = index % 5;
                    int rowIndex = index ~/ 5;
                    print('(LF16)${index}');
                    if (rows[rowIndex] == null) {
                      return Container();
                    }
                    return rows[rowIndex].rowWidgets![modulus];
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
        onPressed: () {
          setState((){
            _gridViewController!.animateTo(
              _gridViewController!.position.minScrollExtent,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 500),
            );});
        },
        tooltip: 'Scroll to top',
        child: const Icon(Icons.upgrade),
      ),
    );
  }
}
