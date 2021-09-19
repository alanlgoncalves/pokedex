// Mocks generated by Mockito 5.0.16 from annotations
// in pokedex/test/unit/item_store_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:pokedex/shared/models/item.dart' as _i4;
import 'package:pokedex/shared/repositories/item_repository.dart' as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [ItemRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockItemRepository extends _i1.Mock implements _i2.ItemRepository {
  MockItemRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Item>> fetchItems() =>
      (super.noSuchMethod(Invocation.method(#fetchItems, []),
              returnValue: Future<List<_i4.Item>>.value(<_i4.Item>[]))
          as _i3.Future<List<_i4.Item>>);
  @override
  String toString() => super.toString();
}
