/// Type definition for custom bs form validator
typedef BsInputValidatorValue<T> = String? Function(T value);

/// Class custom validator
class BsInputValidator {
  /// Construct [BsValidator]
  const BsInputValidator({
    required this.validator,
  });

  /// validator function to check value is valid or not
  final BsInputValidatorValue validator;
}

class BsInputValidators {
  /// define required validation
  static BsInputValidator get required => BsInputValidator(
    validator: (value) {
      String valueValidate = value.toString().trim();
      if (valueValidate.isEmpty || value == null) return "Field is required";

      return null;
    },
  );

  /// define maxLength validation
  static BsInputValidator maxLength(int length) {
    return BsInputValidator(validator: (value) {
      if (value.toString().length > length)
        return "Value cannot be more than $length";
      return null;
    });
  }

  /// define minLength validation
  static BsInputValidator minLength(int length) {
    return BsInputValidator(validator: (value) {
      if (value.toString().length < length)
        return "Value cannot be less than $length";
      return null;
    });
  }
}