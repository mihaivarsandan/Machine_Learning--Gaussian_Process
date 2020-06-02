mesh(reshape(x(:,1),11,11),reshape(x(:,2),11,11),reshape(y,11,11))

meanfunc = [];
covfunc1 = @covSEard;
covfunc2 = {@covSum, {@covSEard, @covSEard}};
likfunc = @likGauss;

hyp1 = struct('mean', [], 'cov', [], 'lik', -2);
hyp2 = struct('mean', [], 'cov', [], 'lik', -2);

hyp1.cov = [0 0 0];
hyp2.cov = 0.1*randn(6,1);

% hyp1_opt= minimize(hyp1, @gp, -100, @infGaussLik, meanfunc, covfunc1, likfunc, x, y);
% hyp1_opt;
% nlml_1 = gp(hyp1_opt, @infGaussLik, meanfunc, covfunc1, likfunc, x, y);
% nlml_1

hyp2_opt= minimize(hyp2, @gp, -100, @infGaussLik, meanfunc, covfunc2, likfunc, x, y);
hyp2_opt;
nlml_2 = gp(hyp2_opt, @infGaussLik, meanfunc, covfunc2, likfunc, x, y);
nlml_2

% xs_1 = linspace(-3,3,15);
% xs_2 = linspace(-4,4,15);
% [xs_1_mesh xs_2_mesh] =meshgrid(xs_1,xs_2);
% xs = [reshape(xs_1_mesh,1,225) ;reshape(xs_2_mesh,1,225)].';

% [mu_1 s2_1] = gp(hyp1_opt, @infGaussLik, meanfunc, covfunc1, likfunc, x, y, xs);
% [mu_2 s2_2] = gp(hyp2_opt, @infGaussLik, meanfunc, covfunc2, likfunc, x, y, xs);

% f1_up = mu_1+2*sqrt(s2_1);
% f1_down= mu_1-2*sqrt(s2_1);
% f2_up = mu_2+2*sqrt(s2_2);
% f2_down=mu_2-2*sqrt(s2_2);
% 
% 
% 
% mesh(reshape(x(:,1),11,11),reshape(x(:,2),11,11),reshape(y,11,11))
% hold on;
% % mesh(reshape(xs(:,1),15,15),reshape(xs(:,2),15,15),reshape(mu_2,15,15))
% % hold on;
% % mesh(reshape(xs(:,1),15,15),reshape(xs(:,2),15,15),reshape(f2_down,15,15),'EdgeColor',[0 0 0],'FaceAlpha','0.1')
% % hold on
% % mesh(reshape(xs(:,1),15,15),reshape(xs(:,2),15,15),reshape(f2_up,15,15),'EdgeColor',[0 0 0],'FaceAlpha','0.1')
% %title(['GP Regression SE + SE kernel hyp: $l1_{1}=$',num2str(exp(hyp2_opt.cov(1))),' $l2_{1}=$',num2str(exp(hyp2_opt.cov(2))),', $\sigma_{f1}=$',num2str(exp(hyp2_opt.cov(3))),' $l1_{2}=$',num2str(exp(hyp2_opt.cov(4))),' $l2_{2}=$',num2str(exp(hyp2_opt.cov(5))),', $\sigma_{f2}=$',num2str(exp(hyp2_opt.cov(6))), '$\sigma_n=$',num2str(exp(hyp2_opt.lik))],'Interpreter','latex')
% title('Dataset','Interpreter','latex')
% xlabel('X1','Interpreter','latex')
% ylabel('X2','Interpreter','latex')
% zlabel('Y2','Interpreter','latex')

