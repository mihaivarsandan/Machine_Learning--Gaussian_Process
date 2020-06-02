meanfunc = []
covfunc  = @covSEiso
likfunc  = @likGauss
 
hyp = struct('mean', [], 'cov', [0 0], 'lik', 0);
xs = linspace(-3,3,200);
hyp2 = minimize(hyp, @gp, -100, @infGaussLik, meanfunc, covfunc, likfunc, x, y);
hyp2
nlml = gp(hyp2, @infGaussLik, meanfunc, covfunc, likfunc, x, y);
nlml
[mu s2] = gp(hyp2, @infGaussLik, meanfunc, covfunc, likfunc, x, y, xs.');
f = [mu+2*sqrt(s2); flipdim(mu-2*sqrt(s2),1)];
fill([xs.'; flipdim(xs.',1)], f, [7 7 7]/8)
hold on; plot(xs, mu); plot(x, y, '+')
title(['GP Regression Squared Exp hyp: $l=$',num2str(exp(hyp2.cov(1))),', $\sigma_f=$',num2str(exp(hyp2.cov(2))),', $\sigma_n=$',num2str(exp(hyp2.lik))],'Interpreter','latex')
xlabel('X','Interpreter','latex')
ylabel('Y','Interpreter','latex')