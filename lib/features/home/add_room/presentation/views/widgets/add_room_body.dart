import 'dart:async';
import 'package:chatty/core/widgets/custom_btn.dart';
import 'package:chatty/core/widgets/custom_text_form_field.dart';
import 'package:chatty/features/home/add_room/data/model/category.dart';
import 'package:chatty/features/home/add_room/presentation/manager/add_room_navigator.dart';
import 'package:chatty/features/home/add_room/presentation/manager/add_room_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:chatty/core/utils/loading_functions.dart' as Utils;
class AddRoomBody extends StatefulWidget {
  const AddRoomBody({super.key});

  @override
  State<AddRoomBody> createState() => _AddRoomBodyState();
}

class _AddRoomBodyState extends State<AddRoomBody> implements AddRoomNavigator {
  AddRoomViewModel viewModel = AddRoomViewModel();
  String roomName = "";
  String description = "";
  final formKey = GlobalKey<FormState>();
  var categoryList = Category.getCategory();
  late Category selectedItem;

  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
    selectedItem = categoryList[0];
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: formKey,
              child: Center(
                child: Column(
                  spacing: 20,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25.0),
                      child: Text(
                        "Create New Room",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Image.asset("assets/images/room.png"),
                    CustomTextFormField(
                      fieldName: "Room Name",
                      hintText: "Enter Room Name",
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Room Name';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        roomName = value;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: DropdownButton<Category>(
                              alignment: Alignment.center,
                              elevation: 9,
                              isExpanded: true,
                              dropdownColor: Colors.white,
                              value: selectedItem,
                              items: categoryList
                                  .map((category) => DropdownMenuItem<Category>(
                                      value: category,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(category.title),
                                          Image.asset(
                                            category.image,
                                            height: 30,
                                          ),
                                        ],
                                      )))
                                  .toList(),
                              onChanged: (newCategory) {
                                if (newCategory == null) return;
                                selectedItem = newCategory;
                                setState(() {});
                              }),
                        ),
                      ],
                    ),
                    CustomTextFormField(
                      fieldName: "Description",
                      hintText: "Enter Room Description",
                      maxLines: 4,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Room Description';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        description = value;
                      },
                    ),
                    const SizedBox(height: 50,),
                    CustomBtn(
                      onPressed: () {
                        validateForm();
                      },
                      text: "Create Room",
                      bgColor: const Color(0xFF3598DB),
                      iconColor: Colors.white,
                      textColor: Colors.white,
                    ),
                    const SizedBox(height: 20)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void validateForm() {
    if (formKey.currentState?.validate()==true) {
      // add room
      viewModel.addRoom(roomName, description, selectedItem.id);
    }
  }

  @override
  void hideLoading() {
    Utils.hideLoading(context);
  }

  @override
  void navigateToHome() {
    Timer(const Duration(seconds: 2), (){
      Navigator.pop(context);
    });

  }

  @override
  void showLoading() {
    Utils.showLoading(context, "Loading...");
  }

  @override
  void showMessage(String message) {
    Utils.showMessage(context, message, "OK", (context){
      Navigator.pop(context);
    });
  }
}


