/// Type definition for custom bs form validator
typedef BsInputValidatorValue<String> = String? Function(String value);

/// Class custom validator
class BsInputValidator {
  /// Construct [BsValidator]
  const BsInputValidator({
    required this.validator,
  });

  /// validator function to check value is valid or not
  final BsInputValidatorValue<String> validator;

  /// define required validation
  static BsInputValidator get required => BsInputValidator(
    validator: (value) {
      String valueValidate = value.toString().trim();
      if (valueValidate.isEmpty) return "Field tidak boleh kosong";

      return null;
    },
  );

  /// define maxLength validation
  static BsInputValidator maxLength(int length) {
    return BsInputValidator(validator: (value) {
      if (value.toString().length > length)
        return "Value tidak boleh lebih dari $length";
      return null;
    });
  }

  /// define minLength validation
  static BsInputValidator minLength(int length) {
    return BsInputValidator(validator: (value) {
      if (value.toString().length < length)
        return "Value harus boleh lebih dari $length";
      return null;
    });
  }
}