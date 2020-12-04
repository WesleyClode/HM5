function [X,N_Iter,Xiter,Error]= Jacobi(A,b,IterMax,eps)
% Solution to set of linear euations (A x = b) by
% Jacobi Method
% SAMPLE INPUT
%  A=[7 3 -1 2; 3 8 1 -4; -1 1 4 -1; 2 -4 -1 6];    
%  b= [-1;0;-3;1];
%  x0=[0;0;0;0];
%  IterMax=1000;
%  Tol=1e-10;

x0 = zeros(length(b),1);


N=length(A);

x=zeros(N,IterMax);     %defining storing variable for solution at various iterations
Error=zeros(N,1);
x(:,1)=x0;

D=diag(diag(A));
Aoff=A-D;
Dinv=inv(D);

for k=1:IterMax
    x(:,k+1)=Dinv*(b-Aoff*x(:,k));               %Computes Solution for next iteration
    Error(k)= norm(x(:,k+1)-x(:,k));              %Computes the Error
    if Error(k)<eps
        break
    end
end

x(:,k+2:end)=[];
Error(k+2:end)=[];


X=x(:,end);
Xiter=x;
N_Iter=k;

end