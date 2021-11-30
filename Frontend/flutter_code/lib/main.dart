import 'package:flutter/material.dart';
import 'package:frontendscg/graph_list_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';



void main() {
  runApp(const MyApp());
}

// Use this command to run the app on chrome
// flutter run -d chrome --web-renderer html

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SCGProject',
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progetto SCG"),
        centerTitle: true,
        actions: [
          // Pulsante per upload del dataset
          IconButton(            
            onPressed: () => upload(),   
            icon: const Icon(Icons.upload)
          )        
        ],
      ),
      body: const GraphListWidget()
    );
  }

  // CARICAMENTO DATASET ED INVIO A SERVER
  void upload() async {
    // Prendo il file
              var picked = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['csv', 'xlsx'],
                withData: true
              );    

              if (picked != null) {                
                print(picked.files.first.name);

                final fileBytes = picked.files.first.bytes;
                final List<int> selected_file = List.from(fileBytes!.map((e) => (e)));

                //var url = Uri.parse("https://192.168.1.113:80/uploadDataset");
                var url = Uri.parse("https://localhost:80/uploadDataset");
                var request =  http.MultipartRequest("POST", url);                

                print("check1");
                request.files.add(
                  http.MultipartFile.fromBytes(
                      'file',
                      selected_file,
                      contentType:  MediaType('file', 'csv'),
                      filename: picked.names.first
                  ),
                );  

                // Aggiungo gli headers
                request.headers.addAll({
                  "Content-type": "multipart/form-data"
                });

                print("check2");

                request.send().then((response) {                
                    print("check3");
                    print(response.statusCode);
                    if (response.statusCode == 200) print("Uploaded!");
                });
              }
  }



}
