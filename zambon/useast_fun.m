% Program to test oceanus THREDDS server
%
% Joseph B. Zambon
% 31-August 2016

clear all; close all;
run /home/jbzambon/MatlabCodes/nctoolbox/setup_nctoolbox.m
set(gcf,'Color','w','Position',[597 30 1077 917],'renderer','zbuffer','Visible','On');
nc = ncgeodataset('http://oceanus.meas.ncsu.edu:8080/thredds/dodsC/fmrc/useast_coawst_roms/USEast_COAWST-ROMS_Forecast_Model_Run_Collection_best.ncd');
lat = nc{'lat_rho'}(:,:);
lon = nc{'lon_rho'}(:,:);
time = nc{'time'}(:)/24;
time = time + datenum('2013-08-30');
hwave = nc{'Hwave'}(end,:,:);
pcolor(lon,lat,double(squeeze(hwave)));shading interp;
title(strcat(['Significant Wave Height (m) Forecast Valid: ' datestr(time(end),'yyyy-mm-dd') ' ' datestr(time(end),'HH') 'UTC']),'FontSize',16);
colorbar;
screen2png('hwave_test.png')
