#include <Servo.h>
Servo myservo;
int flex = A1;
int flexpos;
float flexdeg;
float inmax;
float outmin;
float outmax;
float inmin;
float avg;
int Nmax;

float SensorMapping(float x, float inmax, float outmin, float outmax, float inmin){
  float deg = (x-inmin)*(outmax-outmin)/(inmax-inmin) + outmin;
  if (deg < 0.00){
    deg =0.00;
  }
  if (deg > 180.00){
    deg =180.00;
  }
  // while (deg < 0.00 )  {
  //   inmin = inmin -1;
  //   deg = (x-inmin)*(outmax-outmin)/(inmax-inmin) + outmin;
  // }
  // while (deg > 180.00) {
  //   inmax = inmax +1;
  //   deg = (x-inmin)*(outmax-outmin)/(inmax-inmin) + outmin;
  // }
  return deg  ;
}

void setup() {
Serial.begin(9600);
myservo.attach(2);
flexpos=0;
inmax = 245;
inmin = 481;
outmin = 0;
outmax = 180;
Nmax = 1000;
myservo.write(0);
}

 void loop() {  
  avg=0;
  for (int i=0;i<Nmax;i++) {
    flexpos= analogRead(flex);
    //Serial.println(flexpos);
    avg += flexpos;
  }
  avg=avg/Nmax;
  Serial.println(avg);
  flexdeg = SensorMapping(avg, inmax, outmin, outmax,inmin);
  Serial.println(flexdeg);
  myservo.write(flexdeg);
  delay(50);
 }

