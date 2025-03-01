import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/profile_controller.dart';
import '../widgets/field.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final profileC = Get.put(ProfileController());
  var faker = Faker();
  String tanggal = DateTime.now().toIso8601String();
  bool editing = false;
  TextEditingController firstNameC = TextEditingController();
  TextEditingController lastNameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController ageC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('Refresh');
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'My Profile',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  profileC.editingData();
                },
                icon: Icon(
                  IconData(0xf73b,
                      fontPackage: CupertinoIcons.iconFontPackage,
                      fontFamily: CupertinoIcons.iconFont),
                  color: Colors.blue[300],
                  size: 32,
                ))
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: GetBuilder<ProfileController>(builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        NetworkImage('https://picsum.photos/200/300'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'First Name',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Field(
                  editing: controller.isEditing,
                  cont: firstNameC,
                  jenis: TextInputType.name,
                  data: faker.person.firstName(),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Last Name',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Field(
                  editing: controller.isEditing,
                  cont: lastNameC,
                  jenis: TextInputType.name,
                  data: faker.person.lastName(),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Email',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Field(
                  editing: controller.isEditing,
                  cont: emailC,
                  jenis: TextInputType.emailAddress,
                  data: faker.internet.email(),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Age',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Field(
                  editing: controller.isEditing,
                  cont: ageC,
                  jenis: TextInputType.number,
                  data: '18',
                ),
                controller.isEditing
                    ? Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  profileC.fixData();
                                  tanggal = DateFormat.yMd()
                                      .add_jm()
                                      .format(DateTime.now());
                                },
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.blue[300],
                                    fixedSize: Size(100, 50)),
                                child: Text(
                                  'Update',
                                )),
                          )
                        ],
                      )
                    : Text('Lates Update $tanggal')
              ],
            );
          }),
        ));
  }
}
