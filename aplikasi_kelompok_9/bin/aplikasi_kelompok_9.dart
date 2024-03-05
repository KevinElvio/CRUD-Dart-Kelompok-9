import 'package:aplikasi_kelompok_9/model.dart';
import 'package:aplikasi_kelompok_9/fungsi.dart';
import 'dart:io';

void main() {
  MahasiswaFunc mahasiswaFunc = MahasiswaFunc();

  bool exit = false; // Penanda untuk keluar dari loop

  while (!exit) {
    print(("=") * 50);
    print("APLIKASI PENGELOLAH DATA MAHASISWA KELOMPOK 9");
    print(("=") * 50);
    print("1. Add Data Mahasiswa");
    print("2. Lihat Data Mahasiswa");
    print("3. Update Data Mahasiswa");
    print("4. Delete Data Mahasiswa");
    print("5. Exit");
    print(mahasiswaFunc.list_mahasiswa);
    print("==============================================");
    stdout.write('Masukan pilihan anda: ');
    var inputan = stdin.readLineSync();

    switch (inputan) {
      case '1':
        print('\x1B[2J\x1B[0;0H');
        print(("=") * 50);
        print("TAMBAH DATA MAHASISWA");
        print(("=") * 50);
        stdout.write('Masukan NIM Mahasiswa: ');
        var nimInput = stdin.readLineSync();
        if (nimInput != null) {
          int nim = int.parse(nimInput);
          stdout.write('Masukan Nama Mahasiswa: ');
          var namaInput = stdin.readLineSync();
          if (namaInput != null) {
            String nama = namaInput;
            stdout.write('Masukan Jenis Kelamin: ');
            var jeniskelaminInput = stdin.readLineSync();
            if (jeniskelaminInput != null) {
              String jeniskelamin = jeniskelaminInput;
              print(("=") * 50);

              Mahasiswa mahasiswa =
                  Mahasiswa(nim: nim, nama: nama, jeniskelamin: jeniskelamin);
              mahasiswaFunc.addmahasiswa(mahasiswa);
              print('\x1B[2J\x1B[0;0H');
            } else {
              print('Input jenis kelamin tidak valid.');
              print('\x1B[2J\x1B[0;0H');
            }
          } else {
            print('Input nama tidak valid.');
          }
        } else {
          print('Input NIM tidak valid.');
        }
        break;
      case '2':
        print('\x1B[2J\x1B[0;0H');
        print(("=") * 50);
        print("DATA MAHASISWA");
        print(("=") * 50);
        if (mahasiswaFunc.list_mahasiswa.isEmpty) {
          print("Belum ada data mahasiswa.");
        } else {
          print("NIM\tNama\tJenis Kelamin");
          for (var mahasiswa in mahasiswaFunc.list_mahasiswa) {
            print(
                "${mahasiswa.nim}\t${mahasiswa.nama}\t${mahasiswa.jeniskelamin}");
          }
        }
        break;
      case '3':
        print('\x1B[2J\x1B[0;0H');
        print(("=") * 50);
        print("UPDATE DATA MAHASISWA");
        print(("=") * 50);
        if (mahasiswaFunc.list_mahasiswa.isEmpty) {
          print("Belum ada data mahasiswa yang dapat diupdate.");
        } else {
          stdout.write('Masukkan NIM Mahasiswa yang akan diupdate: ');
          var nimToUpdateInput = stdin.readLineSync();
          if (nimToUpdateInput != null) {
            int? nimToUpdate = int.tryParse(nimToUpdateInput);
            var mahasiswaToUpdateIndex = mahasiswaFunc.list_mahasiswa
                .indexWhere((mahasiswa) => mahasiswa.nim == nimToUpdate);
            if (mahasiswaToUpdateIndex != -1) {
              var mahasiswaToUpdate =
                  mahasiswaFunc.list_mahasiswa[mahasiswaToUpdateIndex];
              print("Data mahasiswa yang akan diupdate:");
              print("NIM: ${mahasiswaToUpdate.nim}");
              print("Nama: ${mahasiswaToUpdate.nama}");
              print("Jenis Kelamin: ${mahasiswaToUpdate.jeniskelamin}");

              stdout.write(
                  'Masukkan Nama Mahasiswa baru (kosongkan jika tidak ingin mengubah): ');
              var namaInput = stdin.readLineSync();
              if (namaInput != null && namaInput.isNotEmpty) {
                mahasiswaToUpdate.nama = namaInput;
              }

              stdout.write(
                  'Masukkan Jenis Kelamin baru (kosongkan jika tidak ingin mengubah): ');
              var jeniskelaminInput = stdin.readLineSync();
              if (jeniskelaminInput != null && jeniskelaminInput.isNotEmpty) {
                mahasiswaToUpdate.jeniskelamin = jeniskelaminInput;
              }

              mahasiswaFunc.updateMahasiswa(mahasiswaToUpdateIndex, mahasiswaToUpdate);
              print("Data mahasiswa berhasil diupdate.");
            } else {
              print("NIM tidak ditemukan.");
            }
          }
        }
        break;
      case '4':
        print('\x1B[2J\x1B[0;0H');
        print(("=") * 50);
        print("DELETE DATA MAHASISWA");
        print(("=") * 50);
        if (mahasiswaFunc.list_mahasiswa.isEmpty) {
          print("Belum ada data mahasiswa yang dapat dihapus.");
        } else {
          stdout.write('Masukkan NIM Mahasiswa yang akan dihapus: ');
          var nimToDeleteInput = stdin.readLineSync();
          if (nimToDeleteInput != null) {
            int? nimToDelete = int.tryParse(nimToDeleteInput);
            var mahasiswaToDeleteIndex = mahasiswaFunc.list_mahasiswa
                .indexWhere((mahasiswa) => mahasiswa.nim == nimToDelete);
            if (mahasiswaToDeleteIndex != -1) {
              mahasiswaFunc.deleteMahasiswa(mahasiswaToDeleteIndex);
              print("Data mahasiswa berhasil dihapus.");
            } else {
              print("NIM tidak ditemukan.");
            }
          }
        }
        break;
      case '5':
        exit = true;
        print("Terima kasih telah menggunakan aplikasi.");
        break;
      default:
        print(
            "Pilihan tidak valid. Silakan masukkan nomor pilihan yang sesuai.");
        break;
    }
  }
}






// import 'package:aplikasi_kelompok_9/fungsi.dart';
// import 'package:aplikasi_kelompok_9/model.dart';
// import 'dart:io';

// void main() {
//   MahasiswaFunc mahasiswaFunc = MahasiswaFunc();

//   bool exit = false; // Penanda untuk keluar dari loop

//   while (!exit) {
//     print(("=") * 50);
//     print("APLIKASI PENGELOLAH DATA MAHASISWA KELOMPOK 9");
//     print(("=") * 50);
//     print("1. Add Data Mahasiswa");
//     print("2. Lihat Data Mahasiswa");
//     print("3. Update Data Mahasiswa");
//     print("4. Delete Data Mahasiswa");
//     print("5. Exit");
//     print(mahasiswaFunc.list_mahasiswa);
//     print("==============================================");
//     stdout.write('Masukan pilihan anda: ');
//     var inputan = stdin.readLineSync();

//     switch (inputan) {
//       case '1':
//         print('\x1B[2J\x1B[0;0H');
//         print(("=") * 50);
//         print("TAMBAH DATA MAHASISWA");
//         print(("=") * 50);
//         stdout.write('Masukan NIM Mahasiswa: ');
//         var nimInput = stdin.readLineSync();
//         if (nimInput != null) {
//           int nim = int.parse(nimInput);
//           stdout.write('Masukan Nama Mahasiswa: ');
//           var namaInput = stdin.readLineSync();
//           if (namaInput != null) {
//             String nama = namaInput;
//             stdout.write('Masukan Jenis Kelamin: ');
//             var jeniskelaminInput = stdin.readLineSync();
//             if (jeniskelaminInput != null) {
//               String jeniskelamin = jeniskelaminInput;
//               print(("=") * 50);

//               Mahasiswa mahasiswa =
//                   Mahasiswa(nim: nim, nama: nama, jeniskelamin: jeniskelamin);
//               mahasiswaFunc.addmahasiswa(mahasiswa);
//               print('\x1B[2J\x1B[0;0H');
//             } else {
//               print('Input jenis kelamin tidak valid.');
//               print('\x1B[2J\x1B[0;0H');
//             }
//           } else {
//             print('Input nama tidak valid.');
//           }
//         } else {
//           print('Input NIM tidak valid.');
//         }
//         break;
//       case '2':
//         print('\x1B[2J\x1B[0;0H');
//         print(("=") * 50);
//         print("DATA MAHASISWA");
//         print(("=") * 50);
//         if (mahasiswaFunc.list_mahasiswa.isEmpty) {
//           print("Belum ada data mahasiswa.");
//         } else {
//           print("NIM\tNama\tJenis Kelamin");
//           for (var mahasiswa in mahasiswaFunc.list_mahasiswa) {
//             print(
//                 "${mahasiswa.nim}\t${mahasiswa.nama}\t${mahasiswa.jeniskelamin}");
//           }
//         }
//         break;
//       case '3':
//         print('\x1B[2J\x1B[0;0H');
//         print(("=") * 50);
//         print("UPDATE DATA MAHASISWA");
//         print(("=") * 50);
//         if (mahasiswaFunc.list_mahasiswa.isEmpty) {
//           print("Belum ada data mahasiswa yang dapat diupdate.");
//         } else {
//           stdout.write('Masukkan NIM Mahasiswa yang akan diupdate: ');
//           var nimToUpdateInput = stdin.readLineSync();
//           if (nimToUpdateInput != null) {
//             int? nimToUpdate = int.tryParse(nimToUpdateInput);
//             var mahasiswaToUpdateIndex = mahasiswaFunc.list_mahasiswa
//                 .indexWhere((mahasiswa) => mahasiswa.nim == nimToUpdate);
//             if (mahasiswaToUpdateIndex != -1) {
//               var mahasiswaToUpdate =
//                   mahasiswaFunc.list_mahasiswa[mahasiswaToUpdateIndex];
//               print("Data mahasiswa yang akan diupdate:");
//               print("NIM: ${mahasiswaToUpdate.nim}");
//               print("Nama: ${mahasiswaToUpdate.nama}");
//               print("Jenis Kelamin: ${mahasiswaToUpdate.jeniskelamin}");

//               stdout.write(
//                   'Masukkan Nama Mahasiswa baru (kosongkan jika tidak ingin mengubah): ');
//               var namaInput = stdin.readLineSync();
//               if (namaInput != null && namaInput.isNotEmpty) {
//                 mahasiswaToUpdate.nama = namaInput;
//               }

//               stdout.write(
//                   'Masukkan Jenis Kelamin baru (kosongkan jika tidak ingin mengubah): ');
//               var jeniskelaminInput = stdin.readLineSync();
//               if (jeniskelaminInput != null && jeniskelaminInput.isNotEmpty) {
//                 mahasiswaToUpdate.jeniskelamin = jeniskelaminInput;
//               }

//               print("Data mahasiswa berhasil diupdate.");
//             } else {
//               print("NIM tidak ditemukan.");
//             }
//           }
//         }
//         break;
//       case '4':
//         print('\x1B[2J\x1B[0;0H');
//         print(("=") * 50);
//         print("DELETE DATA MAHASISWA");
//         print(("=") * 50);
//         if (mahasiswaFunc.list_mahasiswa.isEmpty) {
//           print("Belum ada data mahasiswa yang dapat dihapus.");
//         } else {
//           stdout.write('Masukkan NIM Mahasiswa yang akan dihapus: ');
//           var nimToDeleteInput = stdin.readLineSync();
//           if (nimToDeleteInput != null) {
//             int? nimToDelete = int.tryParse(nimToDeleteInput);
//             var mahasiswaToDeleteIndex = mahasiswaFunc.list_mahasiswa
//                 .indexWhere((mahasiswa) => mahasiswa.nim == nimToDelete);
//             if (mahasiswaToDeleteIndex != -1) {
//               mahasiswaFunc.list_mahasiswa.removeAt(mahasiswaToDeleteIndex);
//               print("Data mahasiswa berhasil dihapus.");
//             } else {
//               print("NIM tidak ditemukan.");
//             }
//           }
//         }
//         break;
//       case '5':
//         exit = true;
//         print("Terima kasih telah menggunakan aplikasi.");
//         break;
//       default:
//         print(
//             "Pilihan tidak valid. Silakan masukkan nomor pilihan yang sesuai.");
//         break;
//     }
//   }
// }