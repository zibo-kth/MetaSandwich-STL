function run_demo()
%RUN_DEMO Headless-friendly demo entrypoint for MetaSandwich-STL.
%
% Writes:
%   results/stl_demo.csv
% And (if plotting is enabled):
%   results/stl_demo.png
%
% Disable plots in CI/headless environments by setting:
%   METASANDWICH_NO_PLOTS=1

addpath(genpath(pwd));

out_dir = fullfile(pwd, 'results');
if ~exist(out_dir, 'dir')
    mkdir(out_dir);
end

% Simple demo: create a synthetic transmission coefficient tau(f)
% (This is NOT a physical model; it is a smoke/demo artifact.)
f = (50:50:5000)';
fc = 1000;
tau = 1 ./ (1 + (f./fc).^2); % monotonic decreasing
stl = fun_stl(tau);

T = table(f, tau, stl, 'VariableNames', {'f_Hz','tau','STL_dB'});
out_csv = fullfile(out_dir, 'stl_demo.csv');
writetable(T, out_csv);

no_plots = ~isempty(getenv('METASANDWICH_NO_PLOTS'));
if ~no_plots
    try
        fig = figure('Visible','off');
        plot(f, stl, 'LineWidth', 1.5);
        grid on;
        xlabel('Frequency (Hz)');
        ylabel('STL (dB)');
        title('MetaSandwich-STL demo (synthetic)');
        out_png = fullfile(out_dir, 'stl_demo.png');
        print(fig, out_png, '-dpng', '-r150');
        close(fig);
    catch
        % plotting is optional
    end
end

fprintf('MetaSandwich-STL demo wrote: %s\n', out_csv);
end
