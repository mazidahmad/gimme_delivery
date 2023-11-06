/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'model_provider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;

/** This is an auto generated class representing the DropOffModel type in your schema. */
class DropOffModel extends amplify_core.Model {
  static const classType = const _DropOffModelModelType();
  final String id;
  final String? _receiver_name;
  final String? _receiver_phone;
  final String? _location_name;
  final String? _address;
  final double? _longitude;
  final double? _latitude;
  final String? _notes;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  DropOffModelModelIdentifier get modelIdentifier {
    return DropOffModelModelIdentifier(id: id);
  }

  String get receiver_name {
    try {
      return _receiver_name!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get receiver_phone {
    try {
      return _receiver_phone!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get location_name {
    try {
      return _location_name!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get address {
    try {
      return _address!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  double? get longitude {
    return _longitude;
  }

  double get latitude {
    try {
      return _latitude!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String? get notes {
    return _notes;
  }

  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }

  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const DropOffModel._internal(
      {required this.id,
      required receiver_name,
      required receiver_phone,
      required location_name,
      required address,
      longitude,
      required latitude,
      notes,
      createdAt,
      updatedAt})
      : _receiver_name = receiver_name,
        _receiver_phone = receiver_phone,
        _location_name = location_name,
        _address = address,
        _longitude = longitude,
        _latitude = latitude,
        _notes = notes,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory DropOffModel(
      {String? id,
      required String receiver_name,
      required String receiver_phone,
      required String location_name,
      required String address,
      double? longitude,
      required double latitude,
      String? notes}) {
    return DropOffModel._internal(
        id: id == null ? amplify_core.UUID.getUUID() : id,
        receiver_name: receiver_name,
        receiver_phone: receiver_phone,
        location_name: location_name,
        address: address,
        longitude: longitude,
        latitude: latitude,
        notes: notes);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DropOffModel &&
        id == other.id &&
        _receiver_name == other._receiver_name &&
        _receiver_phone == other._receiver_phone &&
        _location_name == other._location_name &&
        _address == other._address &&
        _longitude == other._longitude &&
        _latitude == other._latitude &&
        _notes == other._notes;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("DropOffModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("receiver_name=" + "$_receiver_name" + ", ");
    buffer.write("receiver_phone=" + "$_receiver_phone" + ", ");
    buffer.write("location_name=" + "$_location_name" + ", ");
    buffer.write("address=" + "$_address" + ", ");
    buffer.write("longitude=" +
        (_longitude != null ? _longitude!.toString() : "null") +
        ", ");
    buffer.write("latitude=" +
        (_latitude != null ? _latitude!.toString() : "null") +
        ", ");
    buffer.write("notes=" + "$_notes" + ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt!.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  DropOffModel copyWith(
      {String? receiver_name,
      String? receiver_phone,
      String? location_name,
      String? address,
      double? longitude,
      double? latitude,
      String? notes}) {
    return DropOffModel._internal(
        id: id,
        receiver_name: receiver_name ?? this.receiver_name,
        receiver_phone: receiver_phone ?? this.receiver_phone,
        location_name: location_name ?? this.location_name,
        address: address ?? this.address,
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude,
        notes: notes ?? this.notes);
  }

  DropOffModel copyWithModelFieldValues(
      {ModelFieldValue<String>? receiver_name,
      ModelFieldValue<String>? receiver_phone,
      ModelFieldValue<String>? location_name,
      ModelFieldValue<String>? address,
      ModelFieldValue<double?>? longitude,
      ModelFieldValue<double>? latitude,
      ModelFieldValue<String?>? notes}) {
    return DropOffModel._internal(
        id: id,
        receiver_name:
            receiver_name == null ? this.receiver_name : receiver_name.value,
        receiver_phone:
            receiver_phone == null ? this.receiver_phone : receiver_phone.value,
        location_name:
            location_name == null ? this.location_name : location_name.value,
        address: address == null ? this.address : address.value,
        longitude: longitude == null ? this.longitude : longitude.value,
        latitude: latitude == null ? this.latitude : latitude.value,
        notes: notes == null ? this.notes : notes.value);
  }

  DropOffModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _receiver_name = json['receiver_name'],
        _receiver_phone = json['receiver_phone'],
        _location_name = json['location_name'],
        _address = json['address'],
        _longitude = (json['longitude'] as num?)?.toDouble(),
        _latitude = (json['latitude'] as num?)?.toDouble(),
        _notes = json['notes'],
        _createdAt = json['createdAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'receiver_name': _receiver_name,
        'receiver_phone': _receiver_phone,
        'location_name': _location_name,
        'address': _address,
        'longitude': _longitude,
        'latitude': _latitude,
        'notes': _notes,
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'receiver_name': _receiver_name,
        'receiver_phone': _receiver_phone,
        'location_name': _location_name,
        'address': _address,
        'longitude': _longitude,
        'latitude': _latitude,
        'notes': _notes,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core.QueryModelIdentifier<DropOffModelModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<DropOffModelModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final RECEIVER_NAME =
      amplify_core.QueryField(fieldName: "receiver_name");
  static final RECEIVER_PHONE =
      amplify_core.QueryField(fieldName: "receiver_phone");
  static final LOCATION_NAME =
      amplify_core.QueryField(fieldName: "location_name");
  static final ADDRESS = amplify_core.QueryField(fieldName: "address");
  static final LONGITUDE = amplify_core.QueryField(fieldName: "longitude");
  static final LATITUDE = amplify_core.QueryField(fieldName: "latitude");
  static final NOTES = amplify_core.QueryField(fieldName: "notes");
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "DropOffModel";
    modelSchemaDefinition.pluralName = "DropOffModels";

    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
          authStrategy: amplify_core.AuthStrategy.OWNER,
          ownerField: "owner",
          identityClaim: "cognito:username",
          provider: amplify_core.AuthRuleProvider.USERPOOLS,
          operations: const [
            amplify_core.ModelOperation.CREATE,
            amplify_core.ModelOperation.UPDATE,
            amplify_core.ModelOperation.DELETE,
            amplify_core.ModelOperation.READ
          ])
    ];

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: DropOffModel.RECEIVER_NAME,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: DropOffModel.RECEIVER_PHONE,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: DropOffModel.LOCATION_NAME,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: DropOffModel.ADDRESS,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: DropOffModel.LONGITUDE,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: DropOffModel.LATITUDE,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: DropOffModel.NOTES,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(
        amplify_core.ModelFieldDefinition.nonQueryField(
            fieldName: 'createdAt',
            isRequired: false,
            isReadOnly: true,
            ofType: amplify_core.ModelFieldType(
                amplify_core.ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(
        amplify_core.ModelFieldDefinition.nonQueryField(
            fieldName: 'updatedAt',
            isRequired: false,
            isReadOnly: true,
            ofType: amplify_core.ModelFieldType(
                amplify_core.ModelFieldTypeEnum.dateTime)));
  });
}

class _DropOffModelModelType extends amplify_core.ModelType<DropOffModel> {
  const _DropOffModelModelType();

  @override
  DropOffModel fromJson(Map<String, dynamic> jsonData) {
    return DropOffModel.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'DropOffModel';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [DropOffModel] in your schema.
 */
class DropOffModelModelIdentifier
    implements amplify_core.ModelIdentifier<DropOffModel> {
  final String id;

  /** Create an instance of DropOffModelModelIdentifier using [id] the primary key. */
  const DropOffModelModelIdentifier({required this.id});

  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{'id': id});

  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
      .entries
      .map((entry) => (<String, dynamic>{entry.key: entry.value}))
      .toList();

  @override
  String serializeAsString() => serializeAsMap().values.join('#');

  @override
  String toString() => 'DropOffModelModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is DropOffModelModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
