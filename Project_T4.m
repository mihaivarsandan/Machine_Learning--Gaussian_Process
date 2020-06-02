meanfunc = {@meanConst};
covfunc = {@covSum, {@covSEiso, @covSEiso}};
likfunc  = @likGauss;
n=2000;
hyp = struct('mean', [0], 'cov', [-2 0 0 -2 0 0], 'lik', 0);
x = linspace(-5,5,n).';
K = feval(covfunc{:}, hyp.cov, x);
mu = feval(meanfunc{:}, hyp.mean, x);

K_y= K +1e-6*eye(2000);
y = chol(K_y)'*gpml_randn(0.15, n, 1);
plot(x,y)
hold on

y = chol(K_y)'*gpml_randn(0.4, n, 1);
plot(x,y,'--')
hold on

y = chol(K_y)'*gpml_randn(0.8, n, 1);
plot(x,y)
hold on

xlabel('input x')
ylabel('output,f(x)')
title('Prior')






