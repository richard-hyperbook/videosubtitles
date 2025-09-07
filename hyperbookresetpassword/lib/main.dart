import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
// import 'package:web/web.dart';
import 'package:window_location_href/window_location_href.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocumentReference {
  String? path;
  DocumentReference({this.path = '0'});
  // factory DocumentReference.fromJson(Map<String, dynamic> json) =>
  //     _$DocumentReferenceFromJson(json);
  // Map<String, dynamic> toJson() => _$DocumentReferenceToJson(this);
}

const endpoint = 'https://intelvid.co.uk/v1';
const project = '68872b090005e77a3f5e';
const devKey =
    'c23c3aa177d6e9d01411f35c293991f632fd9f6b90689f03bfa0c9ac2581dc5472d4672c0c573acd1219c712f21fd112d9fd5fd9c4a661e08d5738ee484ec662f7e68995662f3054720c728395700090f6fb4d4f5d5710c0364e0472db6ed29c3f2d2fa4864b366b17e8c69e6c78ebc8b3852883b656747c63d0c44772d25b05';
const imageFilenameHead = endpoint + '/storage/buckets';

final DocumentReference databaseRef = DocumentReference(
  path: '67e0e91c002b78b7cd15',
);
final DocumentReference hyperbooksRef = DocumentReference(
  path: '67d25aaf003d6b9507b6',
);
final DocumentReference connectedUsersRef = DocumentReference(
  path: '67d26456000deb78fa6a',
);
final DocumentReference chaptersRef = DocumentReference(
  path: '67d260ec0037564b2569',
);
final DocumentReference usersRef = DocumentReference(
  path: '67e2c962000f5a8055d0',
);
final DocumentReference aaMilneUserRef = DocumentReference(
  path: '67cdf1e76e9881bd3a5c',
);
final DocumentReference readReferencesRef = DocumentReference(
  path: '67ee381100135ad7a75c',
);
final DocumentReference backupStorageRef = DocumentReference(
  path: '680746de003983073d29',
);
final DocumentReference imageStorageRef = DocumentReference(
  path: '680cd737001f208054fb',
);

Client? client;
Account? account;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //  var urlSearchParams = urlSearchParams(window.location.search);
    String s = href!;
    return MaterialApp(
      title: 'Hyperbook Reset Password',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const HyperbookResetPassword(title: 'Hyperbook'),
    );
  }
}

class HyperbookResetPassword extends StatefulWidget {
  const HyperbookResetPassword({super.key, required this.title});
  //intelvid.co.uk

  final String title;

  @override
  State<HyperbookResetPassword> createState() => _HyperbookResetPasswordState();
}

class _HyperbookResetPasswordState extends State<HyperbookResetPassword> {
  int _counter = 0;

  @override
  initState() {
    initAppwrite();
  }

  void initAppwrite() async {
    client = await Client().setEndpoint(endpoint).setProject(project)
    //  .setDevKey(devKey)
    // .setSelfSigned()
    ;
    account = await Account(client!);
    print('(HPR0)${client!.config}||||${account}');
  }

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print('(HPR1A)${href}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.95,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'assets/images/hyperbooklogosvg10.svg',
                    width: 100,
                    height: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Hyperbook\nReset Password',
                      overflow: TextOverflow.fade,
                      //   style: FlutterFlowTheme.of(context)
                      //      .headlineMedium,),
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            width: 300,
            height: 50,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black),
              ),
              child: TextFormField(controller: controller),
            ),
          ),
          SizedBox(height: 5),
          Text('Enter new password'),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('Reset Password'),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
              foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
              elevation: WidgetStatePropertyAll<double>(5.0),
            ),
            onPressed: () {
              print('(HPR1B)${client!.endPoint}||||${account}');
              List<String> breakUserIdStart = href!.split('userId=');
              print('(HPR2)${breakUserIdStart}');
              if (breakUserIdStart.length < 2) {
                toast(context, 'Error 1: illformed url', ToastKind.error);
                return;
              }
              List<String> breakUserIdEnd = breakUserIdStart[1].split('&');
              if (breakUserIdEnd.length < 2) {
                toast(context, 'Error 2: illformed url', ToastKind.error);
                return;
              }
              String userId = breakUserIdEnd[0];
              List<String> breakSecretStart = href!.split('secret=');
              if (breakSecretStart.length < 2) {
                toast(context, 'Error 3: illformed url', ToastKind.error);
                return;
              }
              List<String> breakSecretEnd = breakSecretStart[1].split('&');
              if (breakSecretStart.length < 2) {
                toast(context, 'Error 4: illformed url', ToastKind.error);
                return;
              }
              String secret = breakSecretEnd[0];
              print('(HPR3)${href! + '++++' + userId + '~~~~' + secret}');
              print('(HPR4)${userId}');
              print('(HPR5)${secret}');
              print('(HPR6)${controller.text}');
              try {
                account!
                    .updateRecovery(
                      userId: userId,
                      secret: secret,
                      password: controller.text,
                    )
                    .then((x) {
                      print('(HPR9)${x}');
                      toast(context, 'Password changed', ToastKind.success);
                    })
                    .onError((e, f) {
                      print('(HPR10)${e}++++${f}');
                      toast(context, 'Error 5: ${e}', ToastKind.error);
                    });
              } on AppwriteException catch (e) {
                print('(HPR7)${e.message}');
                toast(context, 'Error 6: ${e.message}', ToastKind.error);
              }
              print('(HPR8)');
            },
          ),
          SizedBox(height: 100),
          Text('10'),
        ],

      ),
    );
  }
}

enum ToastKind { success, warning, error }

void toast(BuildContext context, String message, ToastKind toastKind) {
  void _displaySuccessMotionToast() {
    MotionToast toast = MotionToast.success(
      toastDuration: Duration(seconds: 5),
      description: Text(message, style: TextStyle(fontSize: 14)),
      dismissable: true,
      opacity: .5,
    );
    toast.show(context);
  }

  void _displayWarningMotionToast() {
    MotionToast toast = MotionToast.warning(
      description: Text(message, style: TextStyle(fontSize: 14)),
      dismissable: true,
      opacity: .5,
    );
    toast.show(context);
  }

  void _displayErrorMotionToast() {
    MotionToast toast = MotionToast.warning(
      description: Text(message, style: TextStyle(fontSize: 14)),
      dismissable: true,
      opacity: .5,
    );
    toast.show(context);
  }

  switch (toastKind) {
    case ToastKind.success:
      _displaySuccessMotionToast();
      break;
    case ToastKind.warning:
      _displayWarningMotionToast();
      break;
    case ToastKind.error:
      _displayErrorMotionToast();
      break;
  }
}
