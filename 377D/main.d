import std.stdio;
import std.math;

int fit1(int X, int Y, int x, int y);
int fit2(int X, int Y, int x, int y);
int fit3(int X, int Y, int Z, int x, int y, int z);
void permute(int[]* a, int l, int r);
void swap(int* x, int* y);


void main(){
  //writeln(fit2(25,18,6,5));
  //writeln(fit2(12,34,5,6));
  //writeln(fit2(12345,678910,1112,1314));
  fit3(12,34,56,7,8,9);
  int[] m = [1,3];
  writeln(m[0],",",m[1]);
  swap(&m[0],&m[1]);
  writeln(m[0],",",m[1]);
}




int fit1(int X, int Y, int x, int y){
  int mx = (X/x);
  int my = (Y/y);
  return mx*my;
}

int fit2(int X, int Y, int x, int y){
  int f1 = fit1(X,Y,x,y);
  int f2 = fit1(Y,X,x,y);
  return f1>f2 ? f1 : f2;
}

int fit3(int X, int Y, int Z, int x, int y, int z){
  int[] arr = [x,y,z];
  int n = arr.length;
  permute(&arr, 0, n-1);
  return 1;
}

void swap(int* x, int* y){
  int temp;
  temp = *x;
  *x = *y;
  *y = temp;
}

void permute(int[]* a, int l, int r){
  int i;
  if (l == r){
    writeln(*a);
  }else{
    for(i = l; i <= r; i++){
      swap(&(*a)[l],&(*a)[i]);
      permute(a, l+1, r);
      swap(&(*a)[l],&(*a)[i]);
    }
  }
}
