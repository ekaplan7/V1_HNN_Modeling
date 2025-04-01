
open('s001_BrainSuite_BrainStorm_BrainStorm_EEG_repsAll.fig');

a = get(gca, 'Children');

xdata = get(a, 'XData');
ydata = get(a, 'YData');


time_variable = xdata{4,1};
%first line is presentation in the upper hemisphere
%
y_data1 = ydata{10,1};
y_data2 = ydata{6,1};

%plot(time_variable, y_data2);

averaged_data = ((y_data2 + y_data1) / 2);
plot(time_variable, averaged_data)

%% interpolate data 
class(averaged_data)
size(averaged_data)
averaged_data = double(averaged_data(:));
averaged_data_resampled = resample(averaged_data, 600, 256);
averaged_data_resampled = averaged_data_resampled(1:143);
%ver signal
%create time vector
time_variable = double((1:61)')
tvec_resampled = resample(double(time_variable), 600, 256, 0);
%tvec_resampled = tvec_resampled(1:171);

%check figure to make sure it is correct 
%plot(time_variable, averaged_data_resampled);
%squeeze(tvec_resampled);
%tvec_resampled = tvec_resampled.';
%%squeeze(averaged_data_resampled);
%averaged_data_resampled = averaged_data_resampled.';

% export as a txt file 
%hnn_file = [tvec_resampled, averaged_data_resampled];
%hnn_file_numeric = hnn_file;
%dlmwrite(['Inverso_Data_New.txt'],hnn_file_numeric,'delimiter',' ')

%%

fs_original = 256; % Original sampling rate (Hz)
fs_new = 600; % New sampling rate (Hz)

% Original time vector based on the original fs (assuming length 61)
t_original = (0:length(averaged_data)-1) / fs_original; 

% Resample the signal
averaged_data_resampled2 = resample(averaged_data, fs_new, fs_original);

% Create new time vector that corresponds to the resampled data
tvec_resampled2 = (0:length(averaged_data_resampled2)-1) / fs_new;

figure; % Open a new figure window
plot(tvec_resampled2, averaged_data_resampled2);
xlabel('Time (s)'); % Label x-axis
ylabel('Amplitude'); % Label y-axis
title('Resampled Data'); % Add a title
grid on; % Add grid for better visibility