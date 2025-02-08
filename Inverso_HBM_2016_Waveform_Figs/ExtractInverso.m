
open('s001_BrainSuite_BrainStorm_BrainStorm_EEG_repsAll.fig');

a = get(gca, 'Children');

xdata = get(a, 'XData');
ydata = get(a, 'YData');


time_variable = xdata{4,1};
%first line is presentation in the upper hemisphere
%
y_data1 = ydata{8,1};
y_data2 = ydata{4,1};

plot(time_variable, y_data1);

averaged_data = ((y_data2 + y_data1) / 2);

%% interpolate data 

averaged_data_resampled = resample(double(averaged_data), 600, 213, 0);
averaged_data_resampled = averaged_data_resampled(1:171);

%create time vector

tvec_resampled = resample(double(x_variable), 600, 213, 0);
tvec_resampled = tvec_resampled(1:171);

%check figure to make sure it is correct 
plot(tvec_resampled, averaged_data_resampled);

squeeze(tvec_resampled);
tvec_resampled = tvec_resampled.';
squeeze(averaged_data_resampled);
averaged_data_resampled = averaged_data_resampled.';

% export as a txt file 
hnn_file = [tvec_resampled, averaged_data_resampled];
hnn_file_numeric = hnn_file;
dlmwrite(['Inverso_Data.txt'],hnn_file_numeric,'delimiter',' ')

