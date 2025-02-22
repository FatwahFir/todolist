// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_item_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChecklistItemModelCollection on Isar {
  IsarCollection<ChecklistItemModel> get checklistItemModels =>
      this.collection();
}

const ChecklistItemModelSchema = CollectionSchema(
  name: r'ChecklistItemModel',
  id: -1627759634907365766,
  properties: {
    r'itemCompletionStatus': PropertySchema(
      id: 0,
      name: r'itemCompletionStatus',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _checklistItemModelEstimateSize,
  serialize: _checklistItemModelSerialize,
  deserialize: _checklistItemModelDeserialize,
  deserializeProp: _checklistItemModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'checklist': LinkSchema(
      id: -2962466454630713042,
      name: r'checklist',
      target: r'ChecklistModel',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _checklistItemModelGetId,
  getLinks: _checklistItemModelGetLinks,
  attach: _checklistItemModelAttach,
  version: '3.1.0+1',
);

int _checklistItemModelEstimateSize(
  ChecklistItemModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _checklistItemModelSerialize(
  ChecklistItemModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.itemCompletionStatus);
  writer.writeString(offsets[1], object.name);
}

ChecklistItemModel _checklistItemModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChecklistItemModel();
  object.id = id;
  object.itemCompletionStatus = reader.readBool(offsets[0]);
  object.name = reader.readString(offsets[1]);
  return object;
}

P _checklistItemModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _checklistItemModelGetId(ChecklistItemModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _checklistItemModelGetLinks(
    ChecklistItemModel object) {
  return [object.checklist];
}

void _checklistItemModelAttach(
    IsarCollection<dynamic> col, Id id, ChecklistItemModel object) {
  object.id = id;
  object.checklist
      .attach(col, col.isar.collection<ChecklistModel>(), r'checklist', id);
}

extension ChecklistItemModelQueryWhereSort
    on QueryBuilder<ChecklistItemModel, ChecklistItemModel, QWhere> {
  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChecklistItemModelQueryWhere
    on QueryBuilder<ChecklistItemModel, ChecklistItemModel, QWhereClause> {
  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ChecklistItemModelQueryFilter
    on QueryBuilder<ChecklistItemModel, ChecklistItemModel, QFilterCondition> {
  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterFilterCondition>
      itemCompletionStatusEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemCompletionStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension ChecklistItemModelQueryObject
    on QueryBuilder<ChecklistItemModel, ChecklistItemModel, QFilterCondition> {}

extension ChecklistItemModelQueryLinks
    on QueryBuilder<ChecklistItemModel, ChecklistItemModel, QFilterCondition> {
  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterFilterCondition>
      checklist(FilterQuery<ChecklistModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'checklist');
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterFilterCondition>
      checklistIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'checklist', 0, true, 0, true);
    });
  }
}

extension ChecklistItemModelQuerySortBy
    on QueryBuilder<ChecklistItemModel, ChecklistItemModel, QSortBy> {
  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterSortBy>
      sortByItemCompletionStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCompletionStatus', Sort.asc);
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterSortBy>
      sortByItemCompletionStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCompletionStatus', Sort.desc);
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension ChecklistItemModelQuerySortThenBy
    on QueryBuilder<ChecklistItemModel, ChecklistItemModel, QSortThenBy> {
  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterSortBy>
      thenByItemCompletionStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCompletionStatus', Sort.asc);
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterSortBy>
      thenByItemCompletionStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCompletionStatus', Sort.desc);
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension ChecklistItemModelQueryWhereDistinct
    on QueryBuilder<ChecklistItemModel, ChecklistItemModel, QDistinct> {
  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QDistinct>
      distinctByItemCompletionStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemCompletionStatus');
    });
  }

  QueryBuilder<ChecklistItemModel, ChecklistItemModel, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension ChecklistItemModelQueryProperty
    on QueryBuilder<ChecklistItemModel, ChecklistItemModel, QQueryProperty> {
  QueryBuilder<ChecklistItemModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ChecklistItemModel, bool, QQueryOperations>
      itemCompletionStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemCompletionStatus');
    });
  }

  QueryBuilder<ChecklistItemModel, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
