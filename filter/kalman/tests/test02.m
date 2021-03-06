root_path = '../../../../KalmanGui';
addpath(genpath(root_path));
fp = fopen('data02.txt');
radar_measure = [];
radar_groudtruth = [];
while 1
    tline = fgetl(fp);
    if ~ischar(tline)
        break;
    end
    if tline(1) == 'R'
        tline_length = length(tline);
        tline = tline(3:tline_length);
        tline = str2num(tline);
        radar_measure = [radar_measure;tline(1:4)];
        radar_groudtruth = [radar_groudtruth;tline(5:end)];
    end
end
fclose(fp);

up = [
    1 0 0 0;
    0 1 0 0;
    0 0 1 0;
    0 0 0 1];
r_radar= [
    0.09 0 0;
    0 0.009 0;
    0 0 0.09];
rho = radar_measure(1,1);
phi = radar_measure(1,2);
ux = [rho*cos(phi) rho*sin(phi) 0 0]';
data_scale = size(radar_measure,1);
noise_ax = 9;
noise_ay = 9;
filtering_data = zeros(data_scale,4);
for i = 2:data_scale
    z = radar_measure(i,1:3)';
    t = (radar_measure(i,4)-radar_measure(i-1,4))/1000000;
    t_2 = t * t;
    t_3 = t_2 * t;
    t_4 = t_3 * t;
    q_radar = [
        t_4/4*noise_ax, 0, t_3/2*noise_ax, 0
        0, t_4/4*noise_ay, 0, t_3/2*noise_ay
        t_3/2*noise_ax, 0, t_2/2*noise_ax, 0
        0, t_3/2*noise_ay, 0, t_2/2*noise_ax];
    f=@(x)[x(1)+t*x(3);x(2)+t*x(4);x(3);x(4)];
    h=@(x)[sqrt(x(1)^2+x(2)^2);atan(x(2)/x(1));(x(1)*x(3)+x(2)*x(4))/(x(1)^2+x(2)^2)];
    [ux, up] = unscented_kalman_filter(f,ux,up,h,z,q_radar,r_radar);
    filtering_data(i,:) = ux;
end
result_data = filtering_data;

radar_test_ukf_mse = sum(sum(result_data-radar_groudtruth).^2)/data_scale;
data_gap = result_data-radar_groudtruth;
mse = data_gap(1,:) * data_gap(1,:)'/data_scale;
fprintf('MSE between filtered an true dim:%d is:%f\n',1,mse);
