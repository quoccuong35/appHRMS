
class lsNghiPhep{
  int IDNghiPhep;
  int NhanSu;
  DateTime TuNgay;
  DateTime DenNgay;
  double SoNgayNghi;
  String MaLoaiNghiPhep;
  int NguoiTao;
  DateTime NgayTao;
  String MayTao;
  String MaTrangThaiDuyet;
  String LyDoNghi;
  String LyDoHuy;
  int IDNguoiDuyetKeTiep;
  bool Block;
  DateTime NgayBlock;
  bool Del;
  int NguoiThayDoiLanCuoi;
  DateTime NgayThayDoiLanCuoi;
  String Error;
  String MaNhanVien;
  String HoVaTen;
  double SoNgayPhepDuocNghi;
  String TenPhong_PhanXuong;
  List<NghiPhepChiTiet> NPCT;
  lsNghiPhep(this.IDNghiPhep,this.NhanSu,this.TuNgay,this.DenNgay,this.SoNgayNghi,this.MaLoaiNghiPhep,this.NguoiTao,
          this.NgayTao,this.MayTao,this.MaTrangThaiDuyet,this.LyDoNghi,this.LyDoHuy,this.IDNguoiDuyetKeTiep,this.Block,
          this.NgayBlock,this.Del,this.NguoiThayDoiLanCuoi,this.NgayThayDoiLanCuoi,this.Error,this.MaNhanVien,this.HoVaTen,
          this.SoNgayPhepDuocNghi,this.TenPhong_PhanXuong,this.NPCT);

  lsNghiPhep.map(dynamic data){
    this.IDNghiPhep = data["IDNghiPhep"];
    this.NhanSu = data["NhanSu"];
    this.TuNgay = data["TuNgay"]!=null? DateTime.parse(data["TuNgay"]):null ;
    this.DenNgay = data["DenNgay"]!=null? DateTime.parse(data["DenNgay"]):null ;
    this.SoNgayNghi = data["SoNgayNghi"];
    this.MaLoaiNghiPhep = data["MaLoaiNghiPhep"];
    this.NguoiTao = data["NguoiTao"];
    this.NgayTao = data["NgayTao"]!=null? DateTime.parse(data["NgayTao"]):null ;
    this.MayTao = data["MayTao"];
    this.MaTrangThaiDuyet = data["MaTrangThaiDuyet"];
    this.LyDoNghi = data["LyDoNghi"];
    this.LyDoHuy = data["LyDoHuy"];
    this.IDNguoiDuyetKeTiep = data["IDNguoiDuyetKeTiep"];
    this.Block = data["Block"] = null ?true:data["Block"];
    this.NgayBlock = data["NgayBlock"]!=null? DateTime.parse(data["NgayBlock"]):null;
    this.Del = data["Del"];
    this.NguoiThayDoiLanCuoi = data["NguoiThayDoiLanCuoi"];
    this.NgayThayDoiLanCuoi =  data["NgayThayDoiLanCuoi"]!=null? DateTime.parse(data["NgayThayDoiLanCuoi"]):null;
    this.Error = data["Error"];
    this.MaNhanVien = data["MaNhanVien"];
    this.HoVaTen = data["HoVaTen"];
    this.SoNgayPhepDuocNghi = data["SoNgayPhepDuocNghi"];
    this.TenPhong_PhanXuong = data["TenPhong_PhanXuong"];
    this.NPCT =  NghiPhepChiTiet.fromData(data["NPCT"]) ;
  }
  

}
class  NghiPhepChiTiet {
  int IDNghiPhep;
  DateTime Ngay;
  double SoNgay;
  int ChuKyCaLamViec;
  String GhiChu;
  bool Check;
  NghiPhepChiTiet(this.IDNghiPhep,this.Ngay,this.SoNgay,this.ChuKyCaLamViec,this.GhiChu,this.Check);

  NghiPhepChiTiet.fromMap(Map<String,dynamic> data):
    IDNghiPhep = data["IDNghiPhep"],
    Ngay = data["Ngay"]!=null? DateTime.parse(data["Ngay"]):null,
    SoNgay = data["SoNgay"],
    ChuKyCaLamViec = data["ChuKyCaLamViec"],
    GhiChu = data["GhiChu"],
    Check = data["Check"];

    static List<NghiPhepChiTiet> fromData(List<dynamic> data){
    return data.map((item) => NghiPhepChiTiet.fromMap(item)).toList();

    
  }

}