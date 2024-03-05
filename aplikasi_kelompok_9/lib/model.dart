class Mahasiswa {
  int nim;
  String nama;
  String jeniskelamin;

  Mahasiswa ({required this.nim , required this.nama,required this.jeniskelamin});

  Map<String, dynamic> toMap() {
    return {"nim": nim, "nama": nama, "jeniskelamin": jeniskelamin};
    
  }
}
