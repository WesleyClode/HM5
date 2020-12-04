function [X,N_Iter,Xiter,Error]= Relax(A,b,w,IterMax,Tol)
% Solution to set of linear equations (A x = b) by 
% Successive Relaxtion Method
% SAMPLE INPUT
%  A=[7 3 -1 2; 3 8 1 -4; -1 1 4 -1; 2 -4 -1 6];    
%  b= [-1;0;-3;1];
%  x0=[0;0;0;0];
%  IterMax=1000;
%  Tol=1e-10;
%  w=1.5;

x0 = zeros(length(b),1);

N=length(A);

x=zeros(N,IterMax);     %defining storing variable for solution at various iterations
Error=zeros(N,1);
x(:,1)=x0;



D=diag(diag(A));
Aoff=A-D;
Dinv=inv(D);

% loop for iterations

for k=1:IterMax
    
    xc=x(:,k);                                    % Stores the current X values in xc
    for j=1:N
    xc(j)=(1-w)*xc(j)+w*Dinv(j,j)*(b(j)-Aoff(j,:)*xc);          %Computes Solution and update the Current Values,which will be used for further computations
    end
    x(:,k+1)=xc;
    Error(k)= norm(x(:,k+1)-x(:,k));              %Computes the Error
   
    if Error(k)<Tol
        break
    end
end




x(:,k+2:end)=[];
Error(k+2:end)=[];


X=x(:,end);
Xiter=x;
N_Iter=k;



end