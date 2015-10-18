using JuliaSet
using Base.Test

# write your own tests here
@test 1 == 1

#define a rational function for the test

function R1(z)
  c=-1im
  R=z*z+c
  return R
end

#define a rational function
function R2(z)
  c=1+1im
  R=z*z+c
  return R
end

#fixed point
z_fix1=1+1im
z_fix2=1-1im
#test interval
x=linspace(-1,1,100)
y=linspace(-1,1,100)
#z1 \approx x[25]+1im*y[93]
#z2 \approx  x[35]+1im*y[81]
#iterate
A1=jset(R1,x,y)
A2=jset(R2,x,y)
#test if z diverges
@test A1[100,100]==51
@test A2[100,1]==51
