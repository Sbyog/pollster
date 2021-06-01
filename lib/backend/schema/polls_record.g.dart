// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polls_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PollsRecord> _$pollsRecordSerializer = new _$PollsRecordSerializer();

class _$PollsRecordSerializer implements StructuredSerializer<PollsRecord> {
  @override
  final Iterable<Type> types = const [PollsRecord, _$PollsRecord];
  @override
  final String wireName = 'PollsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, PollsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.pollname;
    if (value != null) {
      result
        ..add('pollname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.choiceA;
    if (value != null) {
      result
        ..add('choice_a')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.choiceB;
    if (value != null) {
      result
        ..add('choice_b')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.choiceAVotes;
    if (value != null) {
      result
        ..add('choice_a_votes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.choiceBVotes;
    if (value != null) {
      result
        ..add('choice_b_votes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.choiceAPerc;
    if (value != null) {
      result
        ..add('choice_a_perc')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.choiceAImg;
    if (value != null) {
      result
        ..add('choice_a_img')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.choiceBImg;
    if (value != null) {
      result
        ..add('choice_b_img')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.choiceBPerc;
    if (value != null) {
      result
        ..add('choice_b_perc')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.totalvotes;
    if (value != null) {
      result
        ..add('totalvotes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DocumentReference)));
    }
    return result;
  }

  @override
  PollsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PollsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'pollname':
          result.pollname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'choice_a':
          result.choiceA = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'choice_b':
          result.choiceB = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'choice_a_votes':
          result.choiceAVotes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'choice_b_votes':
          result.choiceBVotes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'choice_a_perc':
          result.choiceAPerc = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'choice_a_img':
          result.choiceAImg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'choice_b_img':
          result.choiceBImg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'choice_b_perc':
          result.choiceBPerc = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'totalvotes':
          result.totalvotes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(DocumentReference))
              as DocumentReference;
          break;
      }
    }

    return result.build();
  }
}

class _$PollsRecord extends PollsRecord {
  @override
  final String pollname;
  @override
  final String choiceA;
  @override
  final String choiceB;
  @override
  final int choiceAVotes;
  @override
  final int choiceBVotes;
  @override
  final int choiceAPerc;
  @override
  final String choiceAImg;
  @override
  final String choiceBImg;
  @override
  final int choiceBPerc;
  @override
  final int totalvotes;
  @override
  final DocumentReference reference;

  factory _$PollsRecord([void Function(PollsRecordBuilder) updates]) =>
      (new PollsRecordBuilder()..update(updates)).build();

  _$PollsRecord._(
      {this.pollname,
      this.choiceA,
      this.choiceB,
      this.choiceAVotes,
      this.choiceBVotes,
      this.choiceAPerc,
      this.choiceAImg,
      this.choiceBImg,
      this.choiceBPerc,
      this.totalvotes,
      this.reference})
      : super._();

  @override
  PollsRecord rebuild(void Function(PollsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PollsRecordBuilder toBuilder() => new PollsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PollsRecord &&
        pollname == other.pollname &&
        choiceA == other.choiceA &&
        choiceB == other.choiceB &&
        choiceAVotes == other.choiceAVotes &&
        choiceBVotes == other.choiceBVotes &&
        choiceAPerc == other.choiceAPerc &&
        choiceAImg == other.choiceAImg &&
        choiceBImg == other.choiceBImg &&
        choiceBPerc == other.choiceBPerc &&
        totalvotes == other.totalvotes &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, pollname.hashCode),
                                            choiceA.hashCode),
                                        choiceB.hashCode),
                                    choiceAVotes.hashCode),
                                choiceBVotes.hashCode),
                            choiceAPerc.hashCode),
                        choiceAImg.hashCode),
                    choiceBImg.hashCode),
                choiceBPerc.hashCode),
            totalvotes.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PollsRecord')
          ..add('pollname', pollname)
          ..add('choiceA', choiceA)
          ..add('choiceB', choiceB)
          ..add('choiceAVotes', choiceAVotes)
          ..add('choiceBVotes', choiceBVotes)
          ..add('choiceAPerc', choiceAPerc)
          ..add('choiceAImg', choiceAImg)
          ..add('choiceBImg', choiceBImg)
          ..add('choiceBPerc', choiceBPerc)
          ..add('totalvotes', totalvotes)
          ..add('reference', reference))
        .toString();
  }
}

class PollsRecordBuilder implements Builder<PollsRecord, PollsRecordBuilder> {
  _$PollsRecord _$v;

  String _pollname;
  String get pollname => _$this._pollname;
  set pollname(String pollname) => _$this._pollname = pollname;

  String _choiceA;
  String get choiceA => _$this._choiceA;
  set choiceA(String choiceA) => _$this._choiceA = choiceA;

  String _choiceB;
  String get choiceB => _$this._choiceB;
  set choiceB(String choiceB) => _$this._choiceB = choiceB;

  int _choiceAVotes;
  int get choiceAVotes => _$this._choiceAVotes;
  set choiceAVotes(int choiceAVotes) => _$this._choiceAVotes = choiceAVotes;

  int _choiceBVotes;
  int get choiceBVotes => _$this._choiceBVotes;
  set choiceBVotes(int choiceBVotes) => _$this._choiceBVotes = choiceBVotes;

  int _choiceAPerc;
  int get choiceAPerc => _$this._choiceAPerc;
  set choiceAPerc(int choiceAPerc) => _$this._choiceAPerc = choiceAPerc;

  String _choiceAImg;
  String get choiceAImg => _$this._choiceAImg;
  set choiceAImg(String choiceAImg) => _$this._choiceAImg = choiceAImg;

  String _choiceBImg;
  String get choiceBImg => _$this._choiceBImg;
  set choiceBImg(String choiceBImg) => _$this._choiceBImg = choiceBImg;

  int _choiceBPerc;
  int get choiceBPerc => _$this._choiceBPerc;
  set choiceBPerc(int choiceBPerc) => _$this._choiceBPerc = choiceBPerc;

  int _totalvotes;
  int get totalvotes => _$this._totalvotes;
  set totalvotes(int totalvotes) => _$this._totalvotes = totalvotes;

  DocumentReference _reference;
  DocumentReference get reference => _$this._reference;
  set reference(DocumentReference reference) => _$this._reference = reference;

  PollsRecordBuilder() {
    PollsRecord._initializeBuilder(this);
  }

  PollsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pollname = $v.pollname;
      _choiceA = $v.choiceA;
      _choiceB = $v.choiceB;
      _choiceAVotes = $v.choiceAVotes;
      _choiceBVotes = $v.choiceBVotes;
      _choiceAPerc = $v.choiceAPerc;
      _choiceAImg = $v.choiceAImg;
      _choiceBImg = $v.choiceBImg;
      _choiceBPerc = $v.choiceBPerc;
      _totalvotes = $v.totalvotes;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PollsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PollsRecord;
  }

  @override
  void update(void Function(PollsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PollsRecord build() {
    final _$result = _$v ??
        new _$PollsRecord._(
            pollname: pollname,
            choiceA: choiceA,
            choiceB: choiceB,
            choiceAVotes: choiceAVotes,
            choiceBVotes: choiceBVotes,
            choiceAPerc: choiceAPerc,
            choiceAImg: choiceAImg,
            choiceBImg: choiceBImg,
            choiceBPerc: choiceBPerc,
            totalvotes: totalvotes,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
