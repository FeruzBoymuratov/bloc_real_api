

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/create_page_cubit.dart';
import '../model/contact_model.dart';

Widget viewOfCreate(BuildContext context, TextEditingController titleController, TextEditingController bodyController, bool isLoading) {
  return Container(
    color: Colors.grey.shade700,
    padding: EdgeInsets.all(30),
    child: Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_circle),
                  hintText: "Username",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  hintText: "Phone number",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),

            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {
                Contact contact = Contact(username: titleController.text, phoneNumber: bodyController.text);
                BlocProvider.of<CreatePageCubit>(context).apiContactCreate(contact);
              },
              color: Colors.blueGrey,
              child: Text(
                "Create a contact",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),

        isLoading ? Center(
          child: CircularProgressIndicator(),
        ): SizedBox.shrink(),
      ],
    ),
  );
}