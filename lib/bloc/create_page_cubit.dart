import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/contact_model.dart';
import '../services/http_service.dart';
import 'create_page_state.dart';

class CreatePageCubit extends Cubit<CreatePageState> {
  CreatePageCubit() : super(CreatePageInit());

  apiContactCreate(Contact contact) async {
    emit(CreatePageLoading());

    final response = await Network.ADD(Network.API_CREATE, Network.paramsCreate(contact));
    print('apiContactCreate response : \n $response');

    if (response != null) {
      emit(CreatePageLoaded(isCreated: true));
    } else {
      emit(CreatePageError(error: "Couldn't create error"));
    }
  }
}