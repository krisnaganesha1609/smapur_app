import 'dart:convert';

import 'package:equatable/equatable.dart';

class Warga extends Equatable {
  final int id;
  final String namaWarga;
  final DateTime tglLahir;
  final String tempatLahir;
  final String jenisKelamin;
  final String alamat1;
  final String alamat2;
  final String agama;
  final String pendidikan;
  final String banjar;
  final String tempek;
  final String hubKeluarga;

  const Warga(
      {required this.id,
      required this.namaWarga,
      required this.tglLahir,
      required this.tempatLahir,
      required this.jenisKelamin,
      required this.alamat1,
      required this.alamat2,
      required this.agama,
      required this.pendidikan,
      required this.banjar,
      required this.tempek,
      required this.hubKeluarga});

  Warga copyWith({
    int? id,
    String? namaWarga,
    DateTime? tglLahir,
    String? tempatLahir,
    String? jenisKelamin,
    String? alamat1,
    String? alamat2,
    String? agama,
    String? pendidikan,
    String? banjar,
    String? tempek,
    String? hubKeluarga,
  }) {
    return Warga(
        id: id ?? this.id,
        namaWarga: namaWarga ?? this.namaWarga,
        tglLahir: tglLahir ?? this.tglLahir,
        tempatLahir: tempatLahir ?? this.tempatLahir,
        jenisKelamin: jenisKelamin ?? this.jenisKelamin,
        alamat1: alamat1 ?? this.alamat1,
        alamat2: alamat2 ?? this.alamat2,
        agama: agama ?? this.agama,
        pendidikan: pendidikan ?? this.pendidikan,
        banjar: banjar ?? this.banjar,
        tempek: tempek ?? this.tempek,
        hubKeluarga: hubKeluarga ?? this.hubKeluarga);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'namaWarga': namaWarga,
      'tglLahir': tglLahir,
      'tempatLahir': tempatLahir,
      'jenisKelamin': jenisKelamin,
      'alamat1': alamat1,
      'alamat2': alamat2,
      'agama': agama,
      'pendidikan': pendidikan,
      'banjar': banjar,
      'tempek': tempek,
      'hubKeluarga': hubKeluarga
    };
  }

  factory Warga.fromMap(Map<String, dynamic> map) {
    return Warga(
      id: map['id'] as int,
      namaWarga: map['namaWarga'] as String,
      tglLahir: map['tglLahir'] as DateTime,
      tempatLahir: map['tempatLahir'] as String,
      agama: map['agama'] as String,
      alamat1: map['alamat1'] as String,
      alamat2: map['alamat2'] as String,
      banjar: map['banjar'] as String,
      hubKeluarga: map['hubKeluarga'] as String,
      jenisKelamin: map['jenisKelamin'] as String,
      pendidikan: map['pendidikan'] as String,
      tempek: map['tempek'] as String,
    );
  }

  factory Warga.fromJson(String source) =>
      Warga.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [
        id,
        namaWarga,
        tglLahir,
        tempatLahir,
        jenisKelamin,
        alamat1,
        alamat2,
        agama,
        pendidikan,
        banjar,
        tempek,
        hubKeluarga
      ];

  // @override
  // String toString() =>
  //     'Warga(id: $id, namaWarga: $namaWarga, agama: $agama, alamat1: $alamat1, alamat2: $alamat2, banjar: $banjar, hubKeluarga: $hubKeluarga, jenisKelamin: $jenisKelamin, pendidikan: $pendidikan, tempatLahir: $tempatLahir, tglLahir: $tglLahir, tempek: $tempek)';

  // @override
  // bool operator ==(covariant Warga other) {
  //   if (identical(this, other)) return true;

  //   return other.id == id &&
  //       other.namaWarga == namaWarga &&
  //       other.agama == agama &&
  //       other.alamat1 == alamat1 &&
  //       other.alamat2 == alamat2 &&
  //       other.banjar == banjar &&
  //       other.hubKeluarga == hubKeluarga &&
  //       other.jenisKelamin == jenisKelamin &&
  //       other.pendidikan == pendidikan &&
  //       other.tempatLahir == tempatLahir &&
  //       other.tglLahir == tglLahir &&
  //       other.tempek == tempek;
  // }

  // @override
  // int get hashCode =>
  //     id.hashCode ^
  //     namaWarga.hashCode ^
  //     agama.hashCode ^
  //     alamat1.hashCode ^
  //     alamat2.hashCode ^
  //     banjar.hashCode ^
  //     hubKeluarga.hashCode ^
  //     jenisKelamin.hashCode ^
  //     pendidikan.hashCode ^
  //     tempatLahir.hashCode ^
  //     tglLahir.hashCode ^
  //     tempek.hashCode;
}
