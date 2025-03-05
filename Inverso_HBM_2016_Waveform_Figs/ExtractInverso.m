
open('s001_BrainSuite_BrainStorm_BrainStorm_EEG_repsAll.fig');

a = get(gca, 'Children');

xdata = get(a, 'XData');
ydata = get(a, 'YData');


time_variable = xdata{4,1};
%first line is presentation in the upper hemisphere
%
y_data1 = ydata{10,1};
y_data2 = ydata{6,1};

plot(time_variable, y_data2);


averaged_data = ((y_data2 + y_data1) / 2);
averaged_data

%% interpolate data 
class(averaged_data)
size(averaged_data)
averaged_data = double(averaged_data(:));
averaged_data_resampled = resample(averaged_data, 600, 213);
averaged_data_resampled = averaged_data_resampled(1:171);
ver signal
%create time vector

tvec_resampled = resample(double(time_variable), 600, 213, 0);
tvec_resampled = tvec_resampled(1:171);

%check figure to make sure it is correct 
plot(time_variable, averaged_data_resampled);
squeeze(tvec_resampled);
tvec_resampled = tvec_resampled.';
squeeze(averaged_data_resampled);
averaged_data_resampled = averaged_data_resampled.';

% export as a txt file 
hnn_file = [tvec_resampled, averaged_data_resampled];
hnn_file_numeric = hnn_file;
dlmwrite(['Inverso_Data_New.txt'],hnn_file_numeric,'delimiter',' ')

