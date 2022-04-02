

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/update_page_cubit.dart';
import '../model/contact_model.dart';

Widget viewOfUpdate(BuildContext context, TextEditingController titleController, TextEditingController bodyController, String id, bool isLoading) {
  return Container(
    color: Colors.grey.shade700,
    padding: EdgeInsets.all(30),
    child: Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.account_circle),
                  hintText: "Username",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: bodyController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  hintText: "Phone number",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {
                Contact contact = Contact(username: titleController.text.toString(), phoneNumber: bodyController.text, id: id);
                BlocProvider.of<UpdatePageCubit>(context).apiContactUpdate(contact);
              },
              color: Colors.blueGrey,
              child: const Text(
                "Update a contact",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),

        isLoading ? const Center(
          child: CircularProgressIndicator(),
        ): const SizedBox.shrink(),
      ],
    ),
  );
}