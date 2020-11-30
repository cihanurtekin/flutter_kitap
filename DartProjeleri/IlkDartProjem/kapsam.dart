class Kapsam{
  int a = 1;

  kapsamTestFonksiyonu(){
    int a = 2;

    for(int i=0; i<2; i++){
      int a = 3;

      if(i == 0){
        int a = 4;
        print(this.a);
      }
    }
  }
}