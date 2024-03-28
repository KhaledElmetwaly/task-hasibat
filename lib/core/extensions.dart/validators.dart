


import '../app_strings.dart';

extension Validator on String {
  String? noValidate() {
    return null;
  }


String? validateUniqueNumber({required String contact, required List<String> usedNumbers}) {
  if (contact.trim().isEmpty) {
    return AppStrings.this_field_is_required; 
  } else if (usedNumbers.where(((element) => element == contact)).length > 1) {
    return AppStrings.cant_choose_same_number_more_than_once; 
  }
  usedNumbers.add(contact);
  return null;
}



}


