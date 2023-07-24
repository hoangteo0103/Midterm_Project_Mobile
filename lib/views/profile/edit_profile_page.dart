import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_test_2/views/profile/stless/classic_button.dart';
import 'package:material_text_fields/material_text_fields.dart';
import 'package:material_text_fields/utils/form_validation.dart';

import '../../config/themes/app_color.dart';
import '../../constants/assets_path.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  List<String> labelTexts = [];
  Future<List<String>> readLabelTextFromFile(String filePath) async {
    print("HHDHDHDH");
    try {
      String data = await rootBundle.loadString(filePath);
      debugPrint(data);

      List<String> labelTexts = data.split('\n');
      return labelTexts;
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  @override
  void initState() {
    super.initState();
    // Load label texts from the file only once when the widget is created.
    readLabelTextFromFile('assets/data/user_info.txt').then((data) {
      setState(() {
        labelTexts = data;
      });
    }).catchError((error) {
      // Handle error if needed.
      print('Error: $error');
    });
  }

  List<TextEditingController> _textEditingController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  List<bool> _isEditing = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              width: size.height / 8,
              height: size.height / 8,
              decoration: BoxDecoration(
                image: DecorationImage(
                  //fit: BoxFit.cover,
                  scale: 0.75,
                  image: AssetImage(AssetPath.iconProfile),
                ),
              ),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                          color: DarkTheme.blueMain,
                          borderRadius: BorderRadius.circular(100)),
                      child: CircleButton(
                        assetPath: AssetPath.iconAdd,
                        bgColor: DarkTheme.blueMain,
                        onTap: () {},
                      ),
                    )),
              ),
            ),
            Container(
              width: 42,
              height: 42,
              color: Color(0xFFF7F8FB),
            ),
            SizedBox(height: 20),
            Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: MaterialTextField(
                              keyboardType: TextInputType.name,
                              hint: labelTexts[0],
                              labelText: labelTexts[0],
                              textInputAction: TextInputAction.next,
                              prefixIcon: const Icon(Icons.person_2_outlined),
                              controller: _textEditingController[0],
                              enabled: _isEditing[0],
                              validator: FormValidation.requiredTextField,
                            ),
                          ),
                          IconButton(
                            icon: Icon(_isEditing[0] ? Icons.done : Icons.edit),
                            onPressed: () {
                              setState(() {
                                _isEditing[0] = !_isEditing[0];
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: MaterialTextField(
                              keyboardType: TextInputType.phone,
                              hint: labelTexts[1],
                              labelText: labelTexts[1],
                              textInputAction: TextInputAction.next,
                              prefixIcon: const Icon(Icons.phone_enabled_outlined),
                              controller: _textEditingController[1],
                              enabled: _isEditing[1],
                              validator: FormValidation.requiredTextField,
                            ),
                          ),
                          IconButton(
                            icon: Icon(_isEditing[1] ? Icons.done : Icons.edit),
                            onPressed: () {
                              setState(() {
                                _isEditing[1] = !_isEditing[1];
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: MaterialTextField(
                              keyboardType: TextInputType.emailAddress,
                              hint: labelTexts[2],
                              labelText: labelTexts[2],
                              textInputAction: TextInputAction.next,
                              prefixIcon: const Icon(Icons.email_outlined),
                              controller: _textEditingController[2],
                              enabled: _isEditing[2],
                              validator: FormValidation.emailTextField,
                            ),
                          ),
                          IconButton(
                            icon: Icon(_isEditing[2] ? Icons.done : Icons.edit),
                            onPressed: () {
                              setState(() {
                                _isEditing[2] = !_isEditing[2];
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: MaterialTextField(
                              keyboardType: TextInputType.streetAddress,
                              hint: labelTexts[3],
                              labelText: labelTexts[3],
                              textInputAction: TextInputAction.next,
                              prefixIcon: const Icon(Icons.location_on_outlined),
                              controller: _textEditingController[3],
                              enabled: _isEditing[3],
                              validator: FormValidation.requiredTextField,
                            ),
                          ),
                          IconButton(
                            icon: Icon(_isEditing[3] ? Icons.done : Icons.edit),
                            onPressed: () {
                              setState(() {
                                _isEditing[3] = !_isEditing[3];
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
