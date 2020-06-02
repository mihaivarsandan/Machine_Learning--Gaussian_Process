meanfunc = [];
covfunc  = @covPeriodic;
likfunc  = @likGauss;

hyp = struct('mean', [], 'cov', [7 0.4 0.2123], 'lik', -2);
xs = linspace(-4,4,200);
hyp2 = minimize(hyp, @gp, -100, @infGaussLik, meanfunc, covfunc, likfunc, x, y);
hyp2
nlml = gp(hyp2, @infGaussLik, meanfunc, covfunc, likfunc, x, y);
nlml
[mu s2] = gp(hyp2, @infGaussLik, meanfunc, covfunc, likfunc, x, y, xs.');
f = [mu+2*sqrt(s2); flipdim(mu-2*sqrt(s2),1)];
fill([xs.'; flipdim(xs.',1)], f, [7 7 7]/8)
hold on; plot(xs, mu); plot(x, y, '+')
title(['GP Regression Periodic kernel hyp: $l=$',num2str(exp(hyp2.cov(1))),' $p=$',num2str(exp(hyp2.cov(2))),', $\sigma_f=$',num2str(exp(hyp2.cov(3))),', $\sigma_n=$',num2str(exp(hyp2.lik))],'Interpreter','latex')
xlabel('X','Interpreter','latex')
ylabel('Y','Interpreter','latex')
