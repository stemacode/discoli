// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vinyl_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVinylRecordCollection on Isar {
  IsarCollection<VinylRecord> get vinylRecords => this.collection();
}

const VinylRecordSchema = CollectionSchema(
  name: r'VinylRecord',
  id: 8566976513814542488,
  properties: {
    r'artist': PropertySchema(
      id: 0,
      name: r'artist',
      type: IsarType.string,
    ),
    r'coverUrl': PropertySchema(
      id: 1,
      name: r'coverUrl',
      type: IsarType.string,
    ),
    r'dateAdded': PropertySchema(
      id: 2,
      name: r'dateAdded',
      type: IsarType.dateTime,
    ),
    r'discogsId': PropertySchema(
      id: 3,
      name: r'discogsId',
      type: IsarType.long,
    ),
    r'label': PropertySchema(
      id: 4,
      name: r'label',
      type: IsarType.string,
    ),
    r'releaseFormat': PropertySchema(
      id: 5,
      name: r'releaseFormat',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 6,
      name: r'title',
      type: IsarType.string,
    ),
    r'tracks': PropertySchema(
      id: 7,
      name: r'tracks',
      type: IsarType.objectList,
      target: r'Track',
    )
  },
  estimateSize: _vinylRecordEstimateSize,
  serialize: _vinylRecordSerialize,
  deserialize: _vinylRecordDeserialize,
  deserializeProp: _vinylRecordDeserializeProp,
  idName: r'id',
  indexes: {
    r'discogsId': IndexSchema(
      id: -7474285730764229952,
      name: r'discogsId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'discogsId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'Track': TrackSchema},
  getId: _vinylRecordGetId,
  getLinks: _vinylRecordGetLinks,
  attach: _vinylRecordAttach,
  version: '3.1.0+1',
);

int _vinylRecordEstimateSize(
  VinylRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.artist;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.coverUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.label;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.releaseFormat;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.tracks;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Track]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += TrackSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _vinylRecordSerialize(
  VinylRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.artist);
  writer.writeString(offsets[1], object.coverUrl);
  writer.writeDateTime(offsets[2], object.dateAdded);
  writer.writeLong(offsets[3], object.discogsId);
  writer.writeString(offsets[4], object.label);
  writer.writeString(offsets[5], object.releaseFormat);
  writer.writeString(offsets[6], object.title);
  writer.writeObjectList<Track>(
    offsets[7],
    allOffsets,
    TrackSchema.serialize,
    object.tracks,
  );
}

VinylRecord _vinylRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VinylRecord();
  object.artist = reader.readStringOrNull(offsets[0]);
  object.coverUrl = reader.readStringOrNull(offsets[1]);
  object.dateAdded = reader.readDateTimeOrNull(offsets[2]);
  object.discogsId = reader.readLongOrNull(offsets[3]);
  object.id = id;
  object.label = reader.readStringOrNull(offsets[4]);
  object.releaseFormat = reader.readStringOrNull(offsets[5]);
  object.title = reader.readStringOrNull(offsets[6]);
  object.tracks = reader.readObjectList<Track>(
    offsets[7],
    TrackSchema.deserialize,
    allOffsets,
    Track(),
  );
  return object;
}

P _vinylRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readObjectList<Track>(
        offset,
        TrackSchema.deserialize,
        allOffsets,
        Track(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _vinylRecordGetId(VinylRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vinylRecordGetLinks(VinylRecord object) {
  return [];
}

void _vinylRecordAttach(
    IsarCollection<dynamic> col, Id id, VinylRecord object) {
  object.id = id;
}

extension VinylRecordByIndex on IsarCollection<VinylRecord> {
  Future<VinylRecord?> getByDiscogsId(int? discogsId) {
    return getByIndex(r'discogsId', [discogsId]);
  }

  VinylRecord? getByDiscogsIdSync(int? discogsId) {
    return getByIndexSync(r'discogsId', [discogsId]);
  }

  Future<bool> deleteByDiscogsId(int? discogsId) {
    return deleteByIndex(r'discogsId', [discogsId]);
  }

  bool deleteByDiscogsIdSync(int? discogsId) {
    return deleteByIndexSync(r'discogsId', [discogsId]);
  }

  Future<List<VinylRecord?>> getAllByDiscogsId(List<int?> discogsIdValues) {
    final values = discogsIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'discogsId', values);
  }

  List<VinylRecord?> getAllByDiscogsIdSync(List<int?> discogsIdValues) {
    final values = discogsIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'discogsId', values);
  }

  Future<int> deleteAllByDiscogsId(List<int?> discogsIdValues) {
    final values = discogsIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'discogsId', values);
  }

  int deleteAllByDiscogsIdSync(List<int?> discogsIdValues) {
    final values = discogsIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'discogsId', values);
  }

  Future<Id> putByDiscogsId(VinylRecord object) {
    return putByIndex(r'discogsId', object);
  }

  Id putByDiscogsIdSync(VinylRecord object, {bool saveLinks = true}) {
    return putByIndexSync(r'discogsId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByDiscogsId(List<VinylRecord> objects) {
    return putAllByIndex(r'discogsId', objects);
  }

  List<Id> putAllByDiscogsIdSync(List<VinylRecord> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'discogsId', objects, saveLinks: saveLinks);
  }
}

extension VinylRecordQueryWhereSort
    on QueryBuilder<VinylRecord, VinylRecord, QWhere> {
  QueryBuilder<VinylRecord, VinylRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterWhere> anyDiscogsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'discogsId'),
      );
    });
  }
}

extension VinylRecordQueryWhere
    on QueryBuilder<VinylRecord, VinylRecord, QWhereClause> {
  QueryBuilder<VinylRecord, VinylRecord, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<VinylRecord, VinylRecord, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterWhereClause> idBetween(
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

  QueryBuilder<VinylRecord, VinylRecord, QAfterWhereClause> discogsIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'discogsId',
        value: [null],
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterWhereClause>
      discogsIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'discogsId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterWhereClause> discogsIdEqualTo(
      int? discogsId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'discogsId',
        value: [discogsId],
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterWhereClause> discogsIdNotEqualTo(
      int? discogsId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'discogsId',
              lower: [],
              upper: [discogsId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'discogsId',
              lower: [discogsId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'discogsId',
              lower: [discogsId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'discogsId',
              lower: [],
              upper: [discogsId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterWhereClause>
      discogsIdGreaterThan(
    int? discogsId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'discogsId',
        lower: [discogsId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterWhereClause> discogsIdLessThan(
    int? discogsId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'discogsId',
        lower: [],
        upper: [discogsId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterWhereClause> discogsIdBetween(
    int? lowerDiscogsId,
    int? upperDiscogsId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'discogsId',
        lower: [lowerDiscogsId],
        includeLower: includeLower,
        upper: [upperDiscogsId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension VinylRecordQueryFilter
    on QueryBuilder<VinylRecord, VinylRecord, QFilterCondition> {
  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> artistIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'artist',
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      artistIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'artist',
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> artistEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'artist',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      artistGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'artist',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> artistLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'artist',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> artistBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'artist',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      artistStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'artist',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> artistEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'artist',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> artistContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'artist',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> artistMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'artist',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      artistIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'artist',
        value: '',
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      artistIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'artist',
        value: '',
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      coverUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'coverUrl',
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      coverUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'coverUrl',
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> coverUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      coverUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coverUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      coverUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coverUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> coverUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coverUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      coverUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'coverUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      coverUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'coverUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      coverUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coverUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> coverUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coverUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      coverUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      coverUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coverUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      dateAddedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateAdded',
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      dateAddedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateAdded',
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      dateAddedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateAdded',
        value: value,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      dateAddedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateAdded',
        value: value,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      dateAddedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateAdded',
        value: value,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      dateAddedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateAdded',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      discogsIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'discogsId',
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      discogsIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'discogsId',
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      discogsIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discogsId',
        value: value,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      discogsIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discogsId',
        value: value,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      discogsIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discogsId',
        value: value,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      discogsIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discogsId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> idBetween(
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

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> labelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'label',
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      labelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'label',
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> labelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      labelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> labelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> labelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'label',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> labelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> labelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> labelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> labelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'label',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> labelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      labelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      releaseFormatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'releaseFormat',
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      releaseFormatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'releaseFormat',
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      releaseFormatEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'releaseFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      releaseFormatGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'releaseFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      releaseFormatLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'releaseFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      releaseFormatBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'releaseFormat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      releaseFormatStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'releaseFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      releaseFormatEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'releaseFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      releaseFormatContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'releaseFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      releaseFormatMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'releaseFormat',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      releaseFormatIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'releaseFormat',
        value: '',
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      releaseFormatIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'releaseFormat',
        value: '',
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> tracksIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tracks',
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      tracksIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tracks',
      ));
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      tracksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tracks',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      tracksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tracks',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      tracksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tracks',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      tracksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tracks',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      tracksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tracks',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition>
      tracksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tracks',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension VinylRecordQueryObject
    on QueryBuilder<VinylRecord, VinylRecord, QFilterCondition> {
  QueryBuilder<VinylRecord, VinylRecord, QAfterFilterCondition> tracksElement(
      FilterQuery<Track> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'tracks');
    });
  }
}

extension VinylRecordQueryLinks
    on QueryBuilder<VinylRecord, VinylRecord, QFilterCondition> {}

extension VinylRecordQuerySortBy
    on QueryBuilder<VinylRecord, VinylRecord, QSortBy> {
  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> sortByArtist() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.asc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> sortByArtistDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.desc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> sortByCoverUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverUrl', Sort.asc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> sortByCoverUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverUrl', Sort.desc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> sortByDateAdded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateAdded', Sort.asc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> sortByDateAddedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateAdded', Sort.desc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> sortByDiscogsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discogsId', Sort.asc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> sortByDiscogsIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discogsId', Sort.desc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> sortByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> sortByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> sortByReleaseFormat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseFormat', Sort.asc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy>
      sortByReleaseFormatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseFormat', Sort.desc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension VinylRecordQuerySortThenBy
    on QueryBuilder<VinylRecord, VinylRecord, QSortThenBy> {
  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> thenByArtist() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.asc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> thenByArtistDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.desc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> thenByCoverUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverUrl', Sort.asc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> thenByCoverUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverUrl', Sort.desc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> thenByDateAdded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateAdded', Sort.asc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> thenByDateAddedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateAdded', Sort.desc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> thenByDiscogsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discogsId', Sort.asc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> thenByDiscogsIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discogsId', Sort.desc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> thenByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> thenByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> thenByReleaseFormat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseFormat', Sort.asc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy>
      thenByReleaseFormatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseFormat', Sort.desc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension VinylRecordQueryWhereDistinct
    on QueryBuilder<VinylRecord, VinylRecord, QDistinct> {
  QueryBuilder<VinylRecord, VinylRecord, QDistinct> distinctByArtist(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'artist', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QDistinct> distinctByCoverUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QDistinct> distinctByDateAdded() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateAdded');
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QDistinct> distinctByDiscogsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discogsId');
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QDistinct> distinctByLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'label', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QDistinct> distinctByReleaseFormat(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'releaseFormat',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VinylRecord, VinylRecord, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension VinylRecordQueryProperty
    on QueryBuilder<VinylRecord, VinylRecord, QQueryProperty> {
  QueryBuilder<VinylRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VinylRecord, String?, QQueryOperations> artistProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'artist');
    });
  }

  QueryBuilder<VinylRecord, String?, QQueryOperations> coverUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverUrl');
    });
  }

  QueryBuilder<VinylRecord, DateTime?, QQueryOperations> dateAddedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateAdded');
    });
  }

  QueryBuilder<VinylRecord, int?, QQueryOperations> discogsIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discogsId');
    });
  }

  QueryBuilder<VinylRecord, String?, QQueryOperations> labelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'label');
    });
  }

  QueryBuilder<VinylRecord, String?, QQueryOperations> releaseFormatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'releaseFormat');
    });
  }

  QueryBuilder<VinylRecord, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<VinylRecord, List<Track>?, QQueryOperations> tracksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tracks');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const TrackSchema = Schema(
  name: r'Track',
  id: 6244076704169336260,
  properties: {
    r'bpm': PropertySchema(
      id: 0,
      name: r'bpm',
      type: IsarType.double,
    ),
    r'duration': PropertySchema(
      id: 1,
      name: r'duration',
      type: IsarType.string,
    ),
    r'isBpmManual': PropertySchema(
      id: 2,
      name: r'isBpmManual',
      type: IsarType.bool,
    ),
    r'isKeyManual': PropertySchema(
      id: 3,
      name: r'isKeyManual',
      type: IsarType.bool,
    ),
    r'key': PropertySchema(
      id: 4,
      name: r'key',
      type: IsarType.string,
    ),
    r'position': PropertySchema(
      id: 5,
      name: r'position',
      type: IsarType.string,
    ),
    r'tags': PropertySchema(
      id: 6,
      name: r'tags',
      type: IsarType.stringList,
    ),
    r'title': PropertySchema(
      id: 7,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _trackEstimateSize,
  serialize: _trackSerialize,
  deserialize: _trackDeserialize,
  deserializeProp: _trackDeserializeProp,
);

int _trackEstimateSize(
  Track object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.duration;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.key;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.position;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.tags;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _trackSerialize(
  Track object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.bpm);
  writer.writeString(offsets[1], object.duration);
  writer.writeBool(offsets[2], object.isBpmManual);
  writer.writeBool(offsets[3], object.isKeyManual);
  writer.writeString(offsets[4], object.key);
  writer.writeString(offsets[5], object.position);
  writer.writeStringList(offsets[6], object.tags);
  writer.writeString(offsets[7], object.title);
}

Track _trackDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Track();
  object.bpm = reader.readDoubleOrNull(offsets[0]);
  object.duration = reader.readStringOrNull(offsets[1]);
  object.isBpmManual = reader.readBool(offsets[2]);
  object.isKeyManual = reader.readBool(offsets[3]);
  object.key = reader.readStringOrNull(offsets[4]);
  object.position = reader.readStringOrNull(offsets[5]);
  object.tags = reader.readStringList(offsets[6]);
  object.title = reader.readStringOrNull(offsets[7]);
  return object;
}

P _trackDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringList(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension TrackQueryFilter on QueryBuilder<Track, Track, QFilterCondition> {
  QueryBuilder<Track, Track, QAfterFilterCondition> bpmIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bpm',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> bpmIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bpm',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> bpmEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bpm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> bpmGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bpm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> bpmLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bpm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> bpmBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bpm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> durationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'duration',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> durationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'duration',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> durationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> durationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> durationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> durationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'duration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> durationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> durationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> durationContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> durationMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'duration',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> durationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'duration',
        value: '',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> durationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'duration',
        value: '',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> isBpmManualEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isBpmManual',
        value: value,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> isKeyManualEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isKeyManual',
        value: value,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> keyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'key',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> keyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'key',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> keyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> keyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> keyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> keyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'key',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> keyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> keyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> keyContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> keyMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'key',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> keyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'key',
        value: '',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> keyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'key',
        value: '',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> positionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'position',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> positionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'position',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> positionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'position',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> positionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'position',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> positionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'position',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> positionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'position',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> positionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'position',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> positionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'position',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> positionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'position',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> positionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'position',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> positionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'position',
        value: '',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> positionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'position',
        value: '',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> tagsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> tagsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> tagsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> tagsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> tagsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> titleContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> titleMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension TrackQueryObject on QueryBuilder<Track, Track, QFilterCondition> {}
