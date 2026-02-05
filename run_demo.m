function run_demo()
%RUN_DEMO Physical, headless-friendly demo for MetaSandwich-STL.
%
% This demo computes STL for a simple *metamaterial-enhanced single plate*
% example using the existing calculator stack.
%
% Writes (Octave-friendly CSV):
%   results/demo_metamaterial_single_panel.csv
%
% Optionally writes a plot (disabled in CI by default):
%   results/demo_metamaterial_single_panel.png
%
% Disable plots in CI/headless environments by setting:
%   METASANDWICH_NO_PLOTS=1

addpath(genpath(pwd));

out_dir = fullfile(pwd, 'results');
if ~exist(out_dir, 'dir')
    mkdir(out_dir);
end

% --- Define a simple physical-ish example (matches ExampleCalculations) ---
mat = MaterialDatabase('aluminum');

params.host_type = 'single_panel';
params.material = mat;
params.thickness = 20e-3;               % 20 mm
params.resonators.resonance_frequency = 800; % Hz
params.resonators.mass_ratio = 0.08;         % 8%
params.freq_range = (50:2:2500);        % Hz
params.incident_angle = pi/3;           % 60 deg

results = MetamaterialPanelCalculator(params);

f = results.frequency(:);
stl_host = results.base_panel.transmission_loss_oblique(:);
stl_meta = results.transmission_loss_oblique(:);
improvement = stl_meta - stl_host;

out_csv = fullfile(out_dir, 'demo_metamaterial_single_panel.csv');

% CSV header + data (no table dependency for Octave)
fid = fopen(out_csv, 'w');
if fid < 0
    error('Could not open output file: %s', out_csv);
end
fprintf(fid, 'f_Hz,STL_host_dB,STL_meta_dB,Improvement_dB\n');
fprintf(fid, '%.6g,%.6g,%.6g,%.6g\n', [f, stl_host, stl_meta, improvement]');
fclose(fid);

no_plots = ~isempty(getenv('METASANDWICH_NO_PLOTS'));
if ~no_plots
    try
        fig = figure('Visible','off');
        semilogx(f, stl_host, '--', 'LineWidth', 1.8, 'Color', [0.6 0.6 0.6]);
        hold on;
        semilogx(f, stl_meta, '-', 'LineWidth', 2.2, 'Color', [0.8 0.2 0.4]);
        grid on;
        xlabel('Frequency (Hz)');
        ylabel('STL (dB)');
        title('MetaSandwich-STL demo: metamaterial single panel');
        legend({'Host panel','Metamaterial'}, 'Location','northwest');
        out_png = fullfile(out_dir, 'demo_metamaterial_single_panel.png');
        print(fig, out_png, '-dpng', '-r150');
        close(fig);
    catch
        % plotting is optional
    end
end

fprintf('MetaSandwich-STL demo wrote: %s\n', out_csv);
end
