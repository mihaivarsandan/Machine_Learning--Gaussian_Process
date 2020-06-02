meanfunc = [];
covfunc  = @covPeriodic;
likfunc  = @likGauss;
hyp = struct('mean', [], 'cov', [0 0 0.2123], 'lik', -2);

lenght_scale_array = linspace(log(0.05),log(5),150);
%signal_std_array = log(log10(logspace(0.8,3,150)));
period_array = linspace(log(0.8),log(5),150);


%[lenght_scale_array_mesh,signal_std_array_mesh]=meshgrid(lenght_scale_array,signal_std_array);
[lenght_scale_array_mesh,period_array_mesh]=meshgrid(lenght_scale_array,period_array);
nlml_array =[];
for lenght = lenght_scale_array
    for period = period_array
    %for signal_std = signal_std_array
        
        hyp.cov =[lenght period 0];
       
        
        
        nlml = gp(hyp, @infGaussLik, meanfunc, covfunc, likfunc, x, y);
        nlml_array = [nlml_array nlml];
    end
end
figure(1)
nlml_array = reshape(nlml_array,size(lenght_scale_array_mesh));
%contour(lenght_scale_array_mesh,signal_std_array_mesh,nlml_array,[10 15 20 30 40 50 100 200],'ShowText','on')
contour(lenght_scale_array_mesh,period_array_mesh,nlml_array,[10 50 100 200],'ShowText','on','Linewidth',1.5)
%title(['NLML contour plot for $\sigma_f=$',num2str(exp(hyp.cov(3))),' and $\sigma_n=$',num2str(exp(hyp.lik))],'Interpreter','latex')

xlabel('log(length-scale), log(l)')%Characteristic Lengthscale')
ylabel('log(periodicity), log(p)')
grid on
grid minor