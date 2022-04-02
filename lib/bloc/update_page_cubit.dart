import 'package:bloc_real_api/bloc/update_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/contact_model.dart';
import '../services/http_service.dart';

class UpdatePageCubit extends Cubit<UpdatePageState> {
  UpdatePageCubit() : super(UpdatePageInit());

  apiContactUpdate(Contact contact) async {
    emit(UpdatePageLoading());

    final response = await Network.PUT(Network.API_UPDATE + contact.id.toString(), Network.paramsUpdate(contact));
    print('apiContactUpdate response : \n $response');

    if (response != null) {
      emit(UpdatePageLoaded(isUpdate: true));
    } else {
      emit(UpdatePageError(error: "Couldn't update contact"));
    }
  }
}