import std.stdio;
import std.math;

int fit1(int X, int Y, int x, int y);
int fit2(int X, int Y, int x, int y);
int fit3(int X, int Y, int Z, int x, int y, int z);
void permute(int[]* a, int l, int r, int[][]* tot, int* x);
void swap(int* x, int* y);


void main(){
  //writeln(fit2(25,18,6,5));
  //writeln(fit2(12,34,5,6));
  //writeln(fit2(12345,678910,1112,1314));
  writeln(fit3(12,34,56,7,8,9));
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
  int[][] aar;
  int n = arr.length;
  int s = 0;
  permute(&arr, 0, n-1,&aar, &s);
  int max = X/x * Y/y * Z/z;
  //writeln(arr);
  //for (int i = 0; i < arr.length; i++){
    //writeln(i);
    //if (arr[i][0]*arr[i][1]*arr[i][2] > max){
    //  max = arr[i][0]*arr[i][1]*arr[i][2];
    //}
  //}
  return max;
}

void swap(int* x, int* y){
  int temp;
  temp = *x;
  *x = *y;
  *y = temp;
}

void permute(int[]* a, int l, int r, int[][]* tot, int* x){
  int i;
  if (l == r){
    ++tot.length;
    (*tot)[*x] = *a;
    *x += 1;
  }else{
    for(i = l; i <= r; i++){
      swap(&(*a)[l],&(*a)[i]);
      permute(a, l+1, r, tot, x);
      swap(&(*a)[l],&(*a)[i]);
    }
  }
  //writeln(*tot);
}
