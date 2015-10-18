module JuliaSet
#Package JuliaSets
#Visualizing Julia sets with Julia
#Require PyPlot or Gadfly for visualization
export jset


#compute the Julia sets approximation array
function jset(R,x,y,n_iter=20,escape_tol=50) #defaults set at 20 iteration and a tolerance of 50
  nx=length(x)
  ny=length(y)
  A=zeros(nx,ny) #initialize matrix A
  for i in 1:nx
    for j in 1:ny
      z=x[i]+1im*y[j]
      Rz=deepcopy(R(z))
      for k in 1:n_iter-1 #iterate the rational function
        zi=deepcopy(Rz)
        if abs(zi)>escape_tol #z diverges
          A[i,j]=k
        end
        Rz=R(zi)
      end
      if A[i,j]==0.0 # z belongs to the julia set
        A[i,j]=escape_tol+1
      end
    end
  end
  return A
end


end # module
