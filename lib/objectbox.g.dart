// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'src/data/local/Entities/ArticleEntity.dart';
import 'src/data/local/Entities/SourceEntity.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 1723441048822937315),
      name: 'ArticleEntity',
      lastPropertyId: const IdUid(9, 8994420598700696521),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 378379808707710105),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 2724787480275546928),
            name: 'author',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 178443605207549312),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 629421376945092073),
            name: 'description',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 7347625671036972593),
            name: 'url',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 2710004346129257010),
            name: 'urlToImage',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 7704868094624544820),
            name: 'publishedAt',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 1510403029005249387),
            name: 'content',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 8994420598700696521),
            name: 'sourceEntityId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 5998048931707741898),
            relationTarget: 'SourceEntity')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 2105469867249947912),
      name: 'SourceEntity',
      lastPropertyId: const IdUid(3, 2418417811889843170),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 397608098143844864),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3181427865169867306),
            name: 'stringId',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 2418417811889843170),
            name: 'name',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(2, 2105469867249947912),
      lastIndexId: const IdUid(1, 5998048931707741898),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    ArticleEntity: EntityDefinition<ArticleEntity>(
        model: _entities[0],
        toOneRelations: (ArticleEntity object) => [object.sourceEntity],
        toManyRelations: (ArticleEntity object) => {},
        getId: (ArticleEntity object) => object.id,
        setId: (ArticleEntity object, int id) {
          object.id = id;
        },
        objectToFB: (ArticleEntity object, fb.Builder fbb) {
          final authorOffset = fbb.writeString(object.author);
          final titleOffset = fbb.writeString(object.title);
          final descriptionOffset = fbb.writeString(object.description);
          final urlOffset = fbb.writeString(object.url);
          final urlToImageOffset = fbb.writeString(object.urlToImage);
          final publishedAtOffset = fbb.writeString(object.publishedAt);
          final contentOffset = fbb.writeString(object.content);
          fbb.startTable(10);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, authorOffset);
          fbb.addOffset(2, titleOffset);
          fbb.addOffset(3, descriptionOffset);
          fbb.addOffset(4, urlOffset);
          fbb.addOffset(5, urlToImageOffset);
          fbb.addOffset(6, publishedAtOffset);
          fbb.addOffset(7, contentOffset);
          fbb.addInt64(8, object.sourceEntity.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = ArticleEntity()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..author =
                const fb.StringReader().vTableGet(buffer, rootOffset, 6, '')
            ..title =
                const fb.StringReader().vTableGet(buffer, rootOffset, 8, '')
            ..description =
                const fb.StringReader().vTableGet(buffer, rootOffset, 10, '')
            ..url =
                const fb.StringReader().vTableGet(buffer, rootOffset, 12, '')
            ..urlToImage =
                const fb.StringReader().vTableGet(buffer, rootOffset, 14, '')
            ..publishedAt =
                const fb.StringReader().vTableGet(buffer, rootOffset, 16, '')
            ..content =
                const fb.StringReader().vTableGet(buffer, rootOffset, 18, '');
          object.sourceEntity.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 20, 0);
          object.sourceEntity.attach(store);
          return object;
        }),
    SourceEntity: EntityDefinition<SourceEntity>(
        model: _entities[1],
        toOneRelations: (SourceEntity object) => [],
        toManyRelations: (SourceEntity object) => {},
        getId: (SourceEntity object) => object.id,
        setId: (SourceEntity object, int id) {
          object.id = id;
        },
        objectToFB: (SourceEntity object, fb.Builder fbb) {
          final stringIdOffset = fbb.writeString(object.stringId);
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, stringIdOffset);
          fbb.addOffset(2, nameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = SourceEntity()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..stringId =
                const fb.StringReader().vTableGet(buffer, rootOffset, 6, '')
            ..name =
                const fb.StringReader().vTableGet(buffer, rootOffset, 8, '');

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [ArticleEntity] entity fields to define ObjectBox queries.
class ArticleEntity_ {
  /// see [ArticleEntity.id]
  static final id =
      QueryIntegerProperty<ArticleEntity>(_entities[0].properties[0]);

  /// see [ArticleEntity.author]
  static final author =
      QueryStringProperty<ArticleEntity>(_entities[0].properties[1]);

  /// see [ArticleEntity.title]
  static final title =
      QueryStringProperty<ArticleEntity>(_entities[0].properties[2]);

  /// see [ArticleEntity.description]
  static final description =
      QueryStringProperty<ArticleEntity>(_entities[0].properties[3]);

  /// see [ArticleEntity.url]
  static final url =
      QueryStringProperty<ArticleEntity>(_entities[0].properties[4]);

  /// see [ArticleEntity.urlToImage]
  static final urlToImage =
      QueryStringProperty<ArticleEntity>(_entities[0].properties[5]);

  /// see [ArticleEntity.publishedAt]
  static final publishedAt =
      QueryStringProperty<ArticleEntity>(_entities[0].properties[6]);

  /// see [ArticleEntity.content]
  static final content =
      QueryStringProperty<ArticleEntity>(_entities[0].properties[7]);

  /// see [ArticleEntity.sourceEntity]
  static final sourceEntity = QueryRelationToOne<ArticleEntity, SourceEntity>(
      _entities[0].properties[8]);
}

/// [SourceEntity] entity fields to define ObjectBox queries.
class SourceEntity_ {
  /// see [SourceEntity.id]
  static final id =
      QueryIntegerProperty<SourceEntity>(_entities[1].properties[0]);

  /// see [SourceEntity.stringId]
  static final stringId =
      QueryStringProperty<SourceEntity>(_entities[1].properties[1]);

  /// see [SourceEntity.name]
  static final name =
      QueryStringProperty<SourceEntity>(_entities[1].properties[2]);
}
