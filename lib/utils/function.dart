import 'package:flutter/material.dart';
import 'package:TTF/utils/helpers.dart';
class  Functions {
  static int  SelectedIndex (double dx){
    int kq = 0;
    if(Helpers.selectedIndex == Helpers.endSelectedIndex && dx <0){
      kq = Helpers.endSelectedIndex;
    }
    else if(dx < 0 && Helpers.selectedIndex < Helpers.endSelectedIndex )
    {
        kq  = Helpers.selectedIndex  + 1;
    }
    else if(dx > 0 && Helpers.selectedIndex == 0 )
    {
        kq = 0;
    }
    else if(dx > 0 && Helpers.selectedIndex > 0 )
    {
        kq = Helpers.selectedIndex  -1;
    }
    return kq;
  }

}