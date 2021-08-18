class  LoaiPhep {
  String MaLoaiNghiPhep;
  String TenLoaiNghiPhep;
  
  LoaiPhep(this.MaLoaiNghiPhep,this.TenLoaiNghiPhep);
  LoaiPhep.newData (){
    this.MaLoaiNghiPhep = "Ro";
    this.TenLoaiNghiPhep = "Nghỉ không hưởng lương";
  }

   LoaiPhep.fromMap(Map<String,dynamic> data):
    MaLoaiNghiPhep = data["MaLoaiNghiPhep"],
    TenLoaiNghiPhep = data["TenLoaiNghiPhep"];

    static List<LoaiPhep> fromData(List<dynamic> data){
    return data.map((item) => LoaiPhep.fromMap(item)).toList();
    }

}