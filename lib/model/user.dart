
class User {
  // ignore: non_constant_identifier_names
  int _IdNguoiDung;
  String _TaiKhoan;
  String _HoTen;
  int _IdNhom;
  String _TenNhom;
  String _MatKhau;
  String _TenPhongBan;
  int _NhanSu;
  String _ChucVu;
  String _Image;
  String _Email;
  String _MaNV;



  User(this._IdNguoiDung, this._TaiKhoan, this._HoTen, this._IdNhom,
      this._TenNhom, this._MatKhau,this._TenPhongBan,this._NhanSu,this._ChucVu,this._Image,this._Email,this._MaNV);

  User.map(dynamic obj) {
    this._IdNguoiDung = obj["IdNguoiDung"];
    this._TaiKhoan = obj["TaiKhoan"];
    this._HoTen = obj["HoTen"];
    this._IdNhom = obj["IdNhom"];
    this._TenNhom = obj["TenNhom"];
    this._MatKhau = obj["MatKhau"];
    this._Image = obj["Image"];
    this._NhanSu = obj["NhanSu"];
    this._TenPhongBan = obj["TenPhongBan"];
    this._ChucVu = obj["ChucVu"];
    this._Email = obj["Email"];
     this._MaNV = obj["MaNV"];
  }

  int get IdNguoiDung => _IdNguoiDung;
  String get TaiKhoan => _TaiKhoan;
  String get HoTen => _HoTen;
  int get IdNhom => _IdNhom;
  String get TenNhom => _TenNhom;
  String get MatKhau => _MatKhau;
  int get NhanSu =>_NhanSu;
  String get TenPhongBan =>_TenPhongBan;
  String get Image =>_Image;
  String get ChucVu =>_ChucVu;
  String get Email =>_Email;
  String get MaNV =>_MaNV;
  
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["IdNguoiDung"] = _IdNguoiDung;
    map["TaiKhoan"] = _TaiKhoan;
    map["HoTen"] = _HoTen;
    map["IdNhom"] = _IdNhom;
    map["TenNhom"] = _TenNhom;
    map["MatKhau"] = _MatKhau;
    map["TenPhongBan"] = _TenPhongBan;
    map["NhanSu"] = _NhanSu;
    map["ChucVu"] = _ChucVu;
    map["Image"] = _Image;
    map["Email"] = _Email;
    map["MaNV"] = _MaNV;
    return map;
  }
}
