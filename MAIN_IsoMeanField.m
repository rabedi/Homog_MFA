fclose('all');
close('all');
configName_woExt = 'baseTest';
configName_woExt = 'MatrixStiff';
%configName_woExt = 'MatrixCompliant';
configName_woExt = 'nu_min_max';
%configName_woExt = 'Kmu';
%configName_woExt = 'LSVE21';
configName_woExt = 'Kmu2inc';
configName_woExt = 'HW2_3phase';


%%%%%%%%%%%%%%%% HW1: asked questions 
configName_woExt = 'HW1_2DVoid'; % problem 2
% problem 3: 2D crack cannot be solved with this code
% configName_woExt = 'HW1_2DInclusion'; % problem 4
%configName_woExt = 'HW1_2DRigid'; % problem 5
%%%%%%%%%%%%%%%% HW1: extra credit and not asked for
% configName_woExt = 'HW1_3DInclusion'; % Extra credit problem 2
% configName_woExt = 'HW1_3DVoid'; % Extra credit problem 3
configName_woExt = 'HW1_3DRigid_NAsked'; % Extra credit problem 3 - rigid
% limit was not asked

%%%%%%%%%%%%%%%% HW2:
 configName_woExt = 'HW2_P1';
% configName_woExt = 'HW2_P2';
% configName_woExt = 'HW2_P3';
% configName_woExt = 'HW2_P4';

imf = IsoMeanField;
[cIs, K_mu_E_nu_lambdas_AllMethods, namesOut, imf] = imf.MAIN_Print_Plot_All_Cs_from_config(configName_woExt);
fclose('all');


if 0



delcI = 0.01;
cIMax = 1.0;
maxNumIteration = 100; % for SC method
relTol = 1e-3; % for SC method
imf = IsoMeanField;
% mode 3: 3D
% mode 21: plane strain
% mode 22: plane stress
imf.mode = 3;
%   1: E and nu provided
%   2: K and mu provided
imf.input_type = 1;
imf.num_inc = 1;
% relative volume fracture of inclusion phases among themselves:
% for 1 inclusion type, this is 1
% for two inclusions with 50% each inclusion type, this is [0.5,
% 0.5], if the first one is 60% ,this is [0.6, 0.4]
imf.xis = 1;
imf.matrix_pars = [1.0 0.3]; % E, nu of matrix
% [num_inc x 2]:  %  stores (K, mu) OR (E, nu) of each inclusion
imf.inclusion_paras = [10.0, 0.25];
imf.inclusion_paras = [10.0, 0.25]; % with this self-consistent
% does not converge

%imf.xis = [0.5, 0.5];
%imf.inclusion_paras = [10.0, 0.25; 50.0, 0.2];

imf = imf.Initialize();
[cIs, K_mu_E_nu_lambdas_AllMethods, namesOut] = imf.Print_Plot_All_Cs(delcI, cIMax, maxNumIteration, relTol);

end