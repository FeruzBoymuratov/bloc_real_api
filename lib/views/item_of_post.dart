import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../bloc/list_post_cubit.dart';
import '../model/contact_model.dart';

Widget itemOfContacts(BuildContext context, Contact contact) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.blueGrey.shade900,
    ),
    margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
    width: double.infinity,
    child: Slidable(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                      'https://www.kindpng.com/picc/m/21-214439_free-high-quality-person-icon-default-profile-picture.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                contact.username,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                contact.phoneNumber.toString(),
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                topLeft: Radius.circular(25),
                topRight: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
              color: Colors.blueGrey,
            ),
            child: Row(
              children: const [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Image(
                    image: NetworkImage(
                        'https://freesvg.org/img/phone-call-icon.png'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Image(
                    image: NetworkImage(
                        'https://www.shareicon.net/data/512x512/2016/08/01/640145_message_512x512.png'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),

      startActionPane: ActionPane(
        extentRatio: 0.25,
        children: [
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(right: 20, left: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15), topRight: Radius.circular(10), bottomRight: Radius.circular(10),),
                color: Colors.indigo,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.edit,
                  semanticLabel: 'Update',
                ),
                color: Colors.white,
                onPressed: () {
                  BlocProvider.of<ListPostCubit>(context).callUpdatePage(context, contact);
                },
              ),
            ),
          ),
        ],
        motion: const DrawerMotion(),
      ),
      endActionPane: ActionPane(
        extentRatio: 0.25,
        children: [
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(right: 20, left: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10), topRight: Radius.circular(15), bottomRight: Radius.circular(15),),
                color: Colors.red,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.delete,
                  semanticLabel: 'Delete',
                ),
                color: Colors.white,
                onPressed: () {
                  BlocProvider.of<ListPostCubit>(context).apiPostDelete(contact);
                },
              ),
            ),
          ),
        ],
        motion: const DrawerMotion(),
      ),
    ),
  );
}