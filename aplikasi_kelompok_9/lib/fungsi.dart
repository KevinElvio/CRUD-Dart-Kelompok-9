import 'package:aplikasi_kelompok_9/model.dart';

class MahasiswaFunc {
  List<Mahasiswa> list_mahasiswa = [];

  void addmahasiswa(Mahasiswa data) {
    list_mahasiswa.add(data);
  }

  List<Mahasiswa> getAllmahasiswa() {
    return list_mahasiswa;
  }

  void updateMahasiswa(int index, Mahasiswa newData) {
    if (index >= 0 && index < list_mahasiswa.length) {
      list_mahasiswa[index] = newData;
    }
  }


    void deleteMahasiswa(int index) {
    if (index >= 0 && index < list_mahasiswa.length) {
      list_mahasiswa.removeAt(index);
    }
  }

}
